# ========================
# Initialize prompts (and brew for Mac) (just use one prompt theme at once)
# ========================

eval "$(/opt/homebrew/bin/brew shellenv)"


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
  zsh-syntax-highlighting
  zsh-autosuggestions
  #sudo
)

source $ZSH/oh-my-zsh.sh

# ---------------------
# Set idle terminal title (works only if oh-my-zsh is installed)
# ---------------------

#export ZSH_THEME_TERM_TITLE_IDLE="%n:%~"

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
  export EDITOR='nano'
else
  export EDITOR='nano'
fi
# ---------------------



# =====================
# Aliases
# =====================
                       
# ---------------------                           
# Configs
# ---------------------
alias zconfig="nvim ~/.zshrc"                   
#alias fconfig="nvim ~/.config/fish/config.fish"
alias cls="clear"                                 
# ---------------------                                                 
                                                  
                                                  
# ---------------------                           
# Package managing (pacman)                       
# ---------------------
#alias pacinstall="sudo pacman -S"                
#alias pacremove="sudo pacman -Rn"                 
#alias pacupdate="sudo pacman -Syyu"
#alias upall="dnfu && flatpak upgrade"
# ---------------------


# ---------------------           
# System
# ---------------------
#alias sysinfo="inxi -Fazy"
#alias set-nvidia="sudo mv /etc/X11/xorg.conf.d/nvidia.conf.bak /etc/X11/xorg.conf.d/nvidia.conf && #gnome-session-quit"
#alias set-hybrid="sudo mv /etc/X11/xorg.conf.d/nvidia.conf /etc/X11/xorg.conf.d/nvidia.conf.bak && #gnome-session-quit"
# ---------------------           
                                  
                                  
# ---------------------           
# Navigation
# ---------------------  
alias dotfiles="cd ~/.dotfiles"
alias caf="caffeinate -disu"
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
#alias vim="nvim"                                                                         
alias cat="bat"
# ---------------------                                                                  
                                                                                         
                                                                                         
# ---------------------                                                                  
# Better 'ls'
# ---------------------  
alias tree="echo && eza -T --color=always --icons"                                 
alias ll="echo && eza -lh --color=auto  --icons --no-filesize" 
alias ls="echo && eza --grid --color=auto  --icons --no-user --no-filesize" 
alias l="echo && eza -1 --color=auto  --icons --no-user --no-filesize" 
alias la="echo && eza -a --grid --color=auto  --icons --no-user --no-filesize" 
alias lla="echo && eza -lha --color=always  --icons --no-filesize"
# ---------------------

# =====================




# ========================
# CLI tools and dev tools
# ========================

# ---------------------
# Scripts in path
# ---------------------
# export PATH="$HOME/.dotfiles/scripts:$PATH"
# ---------------------

# ---------------------
# nvm
# ---------------------
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
# ---------------------

# Load Angular CLI autocompletion.
# source <(ng completion script)

# ========================


# ========================
# Custom paths
# ========================
# Database paths (postgres and mysql w/brew)
export PATH="/opt/homebrew/opt/postgresql@17/bin:$PATH"


#export PATH="/opt/homebrew/opt/mysql@8.4/bin:$PATH"
# ========================


# Golang GOPATH bin
#export PATH="$HOME/go/bin:$PATH"

# sqlcl (Oracle SQL Developer Command Line)
# export PATH="/opt/homebrew/Caskroom/sqlcl/24.4.4.086.1931/sqlcl/bin:$PATH"

# Composer

# export PATH="$HOME/.composer/vendor/bin:$PATH"

# pnpm
export PNPM_HOME="/Users/robertob/Library/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac
# pnpm end

eval "$(oh-my-posh init zsh --config '~/.config/ohmyposh/config.yaml')"

# opencode
export PATH=/Users/robertob/.opencode/bin:$PATH

#claude
export PATH="$HOME/.local/bin:$PATH"

# flutter
#export PATH=$HOME/Developer/Flutter/flutter/bin:$PATH
#export PATH=$HOME/Developer/Android/cmdline-tools/latest/bin:$PATH
#export PATH=$HOME/Developer/Android/cmdline-tools/emulator:$PATH
