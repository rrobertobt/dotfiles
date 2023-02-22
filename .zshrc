# ========================
# Initialize prompts (just use one at once)
# ========================

# ---------------------
# Powerlevel10k's prompt and instant prompt
# 
# set "ZSH_THEME" to "powerlevel10k/powerlevel10k"
#
# Comment if using other prompt
# ---------------------
#if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
#  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
#fi

#[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
# ---------------------


# ---------------------
# starship prompt
#
# comment "ZSH_THEME" if using this prompt
# ---------------------

eval "$(starship init zsh)"
#eval "$(oh-my-posh init zsh --config ~/.poshthemes/chips.omp.json)"

# ---------------------

# ========================

# =====================
# Functions
# =====================

# =====================


# =====================
# oh-my-zsh and zsh settings
# =====================

export ZSH=$HOME/.oh-my-zsh

#ZSH_THEME="powerlevel10k/powerlevel10k"
#ZSH_THEME="robbyrussell"

plugins=(
  git
  fast-syntax-highlighting
  zsh-autosuggestions
  dnf
  sudo
)

source $ZSH/oh-my-zsh.sh

# ---------------------
# Set idle terminal title (works only if oh-my-zsh is installed)
# ---------------------

export ZSH_THEME_TERM_TITLE_IDLE="%n:%~"

# ---------------------


# ---------------------
# Don't throw errors when file globs don't match anything

setopt NULL_GLOB

# ---------------------

# =====================



# ---------------------
# Preferred editor for local and remote sessions
# ---------------------
if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='vim'
else
  export EDITOR='nvim'
fi
# ---------------------



# =====================
# Aliases
# =====================
                       
# ---------------------                           
# Configs
# ---------------------
alias zconfig="nvim ~/.zshrc"                   
alias fconfig="nvim ~/.config/fish/config.fish"
alias cls="clear"                                 
# ---------------------                                                 
                                                  
                                                  
# ---------------------                           
# Package managing (pacman)                       
# ---------------------
alias pacinstall="sudo pacman -S"                
alias pacremove="sudo pacman -Rn"                 
alias pacupdate="sudo pacman -Syyu"
alias upall="dnfu && flatpak upgrade"
# ---------------------


# ---------------------           
# System
# ---------------------
alias sysinfo="inxi -Fazy"
alias set-nvidia="sudo mv /etc/X11/xorg.conf.d/nvidia.conf.bak /etc/X11/xorg.conf.d/nvidia.conf && gnome-session-quit"
alias set-hybrid="sudo mv /etc/X11/xorg.conf.d/nvidia.conf /etc/X11/xorg.conf.d/nvidia.conf.bak && gnome-session-quit"
# ---------------------           
                                  
                                  
# ---------------------           
# Navigation
# ---------------------  
alias dotfiles="cd ~/.dotfiles"
# ---------------------           
                                  
                                  
# ---------------------           
# File managment                  
# ---------------------  
alias rm="rm -i"                  
alias mv="mv -i"                  
alias cp="cp -i"                  
# ---------------------


# ---------------------                                                                  
# Text editing
# ---------------------
alias vim="nvim"                                                                         
alias cat="bat --theme=Monokai Extended Light"
# ---------------------                                                                  
                                                                                         
                                                                                         
# ---------------------                                                                  
# Better 'ls'
# ---------------------  
alias tree="exa -T --color=always --color-scale --icons"                                 
alias ls="exa -lh --color=always --color-scale --group-directories-first --icons" 
alias la="exa -lha --color=always --color-scale --group-directories-first --icons"
# ---------------------

# =====================




# ========================
# CLI tools and dev tools
# ========================

# ---------------------
# Scripts in path
# ---------------------
export PATH="$HOME/.dotfiles/scripts:$PATH"
# ---------------------

# ---------------------
# nvm
# ---------------------
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
# ---------------------

# Load Angular CLI autocompletion.
source <(ng completion script)

# ========================
