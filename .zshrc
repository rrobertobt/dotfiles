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

COMPLETION_WAITING_DOTS="true"

DISABLE_AUTO_TITLE="false"

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
# ---------------------           
                                  
                                  
# ---------------------           
# Navigation
# ---------------------  
alias dotfiles="cd ~/.dotfiles"
alias bk="cd -"
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
alias cat="bat --theme=gruvbox"
# ---------------------                                                                  
                                                                                         
                                                                                         
# ---------------------                                                                  
# Better 'ls'
# ---------------------  
alias tree="exa -T --color=always --color-scale --icons"                                 
alias ls="exa -lh --color=always --git --color-scale --group-directories-first --icons" 
alias la="exa -lha --color=always --git --color-scale --group-directories-first --icons"
# ---------------------

# =====================




# ========================
# CLI tools and dev tools
# ========================

# ---------------------
# ruby
# ---------------------
# rbenv
# export PATH="$HOME/.dev/.rbenv/bin:$PATH"
# eval "$(rbenv init -)"

# ruby build
# export PATH="$HOME/.dev/.rbenv/plugins/ruby-build/bin:$PATH"
# ---------------------


# ---------------------
# Flutter
# ---------------------
#export PATH="$HOME/.dev/flutter/bin:$PATH"
# ---------------------

# ---------------------
# Scripts in path
# ---------------------
export PATH="$HOME/.dotfiles/scripts:$PATH"
# ---------------------

# ---------------------
# nvm
# ---------------------
# export NVM_DIR="$([ -z "${XDG_CONFIG_HOME-}" ] && printf %s "${HOME}/.nvm" || printf %s "${XDG_CONFIG_HOME}/nvm")"
#[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" # This loads nvm
# ---------------------

# ---------------------
# asdf
# ---------------------
. $HOME/.asdf/asdf.sh 
# ---------------------
# ========================



# ========================
# Extras/others
# ========================

# ---------------------
# Show last login
# ---------------------
# echo "Last login:`last -2 -R $USER | head -2 | cut -c 20- | sed -n '1!p'`"
# ---------------------

