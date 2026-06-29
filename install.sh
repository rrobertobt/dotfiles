#!/usr/bin/env bash
#
# install.sh — symlink dotfiles from this repo into their home locations.
#
# Works on a fresh macOS or Linux box. For each selected "module" it creates a
# symlink from the home location to the file/directory in this repo, creating
# any missing parent directories along the way.
#
# Safeguards:
#   - If the target is already the correct symlink, it is skipped.
#   - If something else already lives at the target (file, dir, or wrong
#     symlink) you are asked what to do: back it up & replace, or skip.
#   - Nothing is overwritten without a backup.
#
# Usage:
#   ./install.sh            # interactive: pick which modules to install
#   ./install.sh -a         # install all modules (still asks before replacing)
#   ./install.sh -y         # assume "yes" to replace prompts (backs up first)
#   ./install.sh -n         # dry run: show what would happen, change nothing
#   ./install.sh -h         # help
#
# Flags can be combined, e.g.  ./install.sh -a -y

set -euo pipefail

# Absolute path to the repo (the dir this script lives in), so it works no
# matter where the repo was cloned.
REPO_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

# Detect OS: "macos" or "linux" (anything else treated as linux).
case "$(uname -s)" in
  Darwin) CURRENT_OS="macos" ;;
  *)      CURRENT_OS="linux" ;;
esac

# ---------------------------------------------------------------------------
# Module manifest.
#
# Each entry is "key|description|mapping[;mapping...]|os" where:
#   - mappings: "src:dest" pairs (src relative to repo, dest relative to $HOME)
#   - os: "all" | "linux" | "macos"  — controls visibility on each platform
# Symlinking a directory links the whole directory.
# ---------------------------------------------------------------------------
ALL_MODULES=(
  "zsh|Zsh shell config (.zshrc + powerlevel10k)|.zshrc:.zshrc;.p10k:.p10k|all"
  "bash|Bash shell config (.bashrc)|.bashrc:.bashrc|all"
  "vim|Vim / Neovim config|.vimrc:.vimrc;.config/nvim:.config/nvim|all"
  "starship|Starship prompt|.config/starship.toml:.config/starship.toml|all"
  "ohmyposh|Oh My Posh prompt|.config/ohmyposh:.config/ohmyposh|all"
  "kitty|Kitty terminal|.config/kitty:.config/kitty|all"
  "alacritty|Alacritty terminal|.config/alacritty:.config/alacritty|all"
  "ghostty|Ghostty terminal|.config/ghostty:.config/ghostty|all"
  "fish|Fish shell config|.config/fish:.config/fish|all"
  "rofi|Rofi launcher|.config/rofi:.config/rofi|linux"
  "konsole|Konsole profiles & colorschemes|.local/share/konsole:.local/share/konsole|linux"
  "kservices5|KDE service menus|.local/share/kservices5:.local/share/kservices5|linux"
  "fonts|Font config (.fonts)|.fonts:.fonts|all"
  "scripts|Color/terminal scripts (-> ~/scripts)|scripts:scripts|all"
)

# Filter to only modules compatible with the current OS.
MODULES=()
SKIPPED_OS=()
for _m in "${ALL_MODULES[@]}"; do
  _os="$(printf '%s' "$_m" | cut -d'|' -f4)"
  if [[ "$_os" == "all" || "$_os" == "$CURRENT_OS" ]]; then
    MODULES+=("$_m")
  else
    SKIPPED_OS+=("$(printf '%s' "$_m" | cut -d'|' -f1)")
  fi
done
unset _m _os

# ---------------------------------------------------------------------------
# Options
# ---------------------------------------------------------------------------
ALL=false
ASSUME_YES=false
DRY_RUN=false

# ---------------------------------------------------------------------------
# Colors (disabled if not a terminal)
# ---------------------------------------------------------------------------
if [[ -t 1 ]]; then
  C_RESET=$'\033[0m'; C_BOLD=$'\033[1m'; C_DIM=$'\033[2m'
  C_GREEN=$'\033[32m'; C_YELLOW=$'\033[33m'; C_RED=$'\033[31m'; C_CYAN=$'\033[36m'
else
  C_RESET=""; C_BOLD=""; C_DIM=""; C_GREEN=""; C_YELLOW=""; C_RED=""; C_CYAN=""
fi

info()  { printf '%s\n' "$*"; }
ok()    { printf '%s✓%s %s\n' "$C_GREEN" "$C_RESET" "$*"; }
warn()  { printf '%s!%s %s\n' "$C_YELLOW" "$C_RESET" "$*"; }
err()   { printf '%s✗%s %s\n' "$C_RED" "$C_RESET" "$*" >&2; }
step()  { printf '%s%s%s\n' "$C_CYAN" "$*" "$C_RESET"; }

usage() {
  sed -n '2,30p' "${BASH_SOURCE[0]}" | sed 's/^#\s\{0,1\}//'
  exit "${1:-0}"
}

# ---------------------------------------------------------------------------
# Parse args
# ---------------------------------------------------------------------------
while [[ $# -gt 0 ]]; do
  case "$1" in
    -a|--all)     ALL=true ;;
    -y|--yes)     ASSUME_YES=true ;;
    -n|--dry-run) DRY_RUN=true ;;
    -h|--help)    usage 0 ;;
    *) err "Unknown option: $1"; usage 1 ;;
  esac
  shift
done

# ---------------------------------------------------------------------------
# Helpers
# ---------------------------------------------------------------------------

module_field() { # $1=module string, $2=field index (1-based)
  printf '%s' "$1" | cut -d'|' -f"$2"
}

# Prompt yes/no. Returns 0 for yes, 1 for no. Honors --yes.
confirm() { # $1=prompt, $2=default(y/n)
  local prompt="$1" default="${2:-n}" reply
  if $ASSUME_YES; then return 0; fi
  local hint="[y/N]"; [[ "$default" == "y" ]] && hint="[Y/n]"
  read -r -p "$prompt $hint " reply </dev/tty || reply=""
  reply="${reply:-$default}"
  [[ "$reply" =~ ^[Yy] ]]
}

# Create one symlink with all the safeguards.
link_one() { # $1=src (rel to repo), $2=dest (rel to home)
  local src="$REPO_DIR/$1"
  local dest="$HOME/$2"

  if [[ ! -e "$src" ]]; then
    warn "source missing, skipping: $1"
    return
  fi

  # Already correctly linked?
  if [[ -L "$dest" && "$(readlink "$dest")" == "$src" ]]; then
    ok "already linked: ~/$2"
    return
  fi

  # Something already there?
  if [[ -e "$dest" || -L "$dest" ]]; then
    local what="file"
    [[ -d "$dest" && ! -L "$dest" ]] && what="directory"
    [[ -L "$dest" ]] && what="symlink -> $(readlink "$dest")"
    warn "exists at ~/$2 ($what)"
    if ! confirm "  back it up and replace?" "n"; then
      info "  ${C_DIM}skipped ~/$2${C_RESET}"
      return
    fi
    local backup="${dest}.bak.$(date +%Y%m%d%H%M%S)"
    if $DRY_RUN; then
      info "  [dry-run] would back up ~/$2 -> $(basename "$backup")"
    else
      mv "$dest" "$backup"
      ok "  backed up -> $(basename "$backup")"
    fi
  fi

  # Ensure parent dir exists.
  local parent; parent="$(dirname "$dest")"
  if [[ ! -d "$parent" ]]; then
    if $DRY_RUN; then
      info "  [dry-run] would create dir $parent"
    else
      mkdir -p "$parent"
    fi
  fi

  if $DRY_RUN; then
    info "  [dry-run] would link ~/$2 -> $src"
  else
    ln -s "$src" "$dest"
    ok "linked ~/$2 -> $1"
  fi
}

install_module() { # $1=module string
  local key desc maps
  key="$(module_field "$1" 1)"
  desc="$(module_field "$1" 2)"
  maps="$(module_field "$1" 3)"
  step "» $key — $desc"
  local IFS=';' mapping
  for mapping in $maps; do
    link_one "${mapping%%:*}" "${mapping##*:}"
  done
}

# ---------------------------------------------------------------------------
# Selection
# ---------------------------------------------------------------------------
print_menu() {
  info "${C_BOLD}Available config modules:${C_RESET}"
  local i=1 m
  for m in "${MODULES[@]}"; do
    printf '  %2d) %-12s %s%s%s\n' "$i" "$(module_field "$m" 1)" \
      "$C_DIM" "$(module_field "$m" 2)" "$C_RESET"
    ((i++))
  done
}

# Resulting list of module strings to install.
SELECTED=()

select_modules() {
  if $ALL; then
    SELECTED=("${MODULES[@]}")
    return
  fi

  print_menu
  info ""
  info "Enter numbers to install (e.g. ${C_BOLD}1 3 5${C_RESET} or ${C_BOLD}1,3,5${C_RESET}),"
  info "type ${C_BOLD}all${C_RESET} for everything, or ${C_BOLD}q${C_RESET} to quit."
  local choice
  read -r -p "> " choice </dev/tty || choice="q"

  case "$choice" in
    q|Q|"") info "Nothing selected. Bye."; exit 0 ;;
    all|ALL|a) SELECTED=("${MODULES[@]}"); return ;;
  esac

  # Normalize separators to spaces.
  choice="${choice//,/ }"
  local tok
  for tok in $choice; do
    if ! [[ "$tok" =~ ^[0-9]+$ ]] || (( tok < 1 || tok > ${#MODULES[@]} )); then
      err "Invalid selection: $tok"
      exit 1
    fi
    SELECTED+=("${MODULES[$((tok-1))]}")
  done
}

# ---------------------------------------------------------------------------
# Main
# ---------------------------------------------------------------------------
main() {
  info "${C_BOLD}dotfiles installer${C_RESET}"
  info "repo: ${C_DIM}$REPO_DIR${C_RESET}"
  info "  os: ${C_DIM}$CURRENT_OS${C_RESET}"
  if [[ ${#SKIPPED_OS[@]} -gt 0 ]]; then
    info "       ${C_DIM}(skipping ${CURRENT_OS}-incompatible modules: ${SKIPPED_OS[*]})${C_RESET}"
  fi
  $DRY_RUN && warn "dry run — no changes will be made"
  info ""

  select_modules

  info ""
  info "${C_BOLD}About to install:${C_RESET}"
  local m
  for m in "${SELECTED[@]}"; do
    info "  • $(module_field "$m" 1) — $(module_field "$m" 2)"
  done
  info ""
  if ! confirm "Proceed?" "y"; then
    info "Aborted."
    exit 0
  fi
  info ""

  for m in "${SELECTED[@]}"; do
    install_module "$m"
    info ""
  done

  ok "Done."
  $DRY_RUN && warn "(dry run — nothing was actually changed)"
}

main
