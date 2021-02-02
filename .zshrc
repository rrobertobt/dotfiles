# ---------------------
# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
#if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
#  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
#fi

#[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
# ---------------------

eval "$(starship init zsh)"

# ---------------------
# oh-my-zsh and zsh settings
# ---------------------
export ZSH=$HOME/.oh-my-zsh

ZSH_THEME="agnoster"
#ZSH_THEME="powerlevel10k/powerlevel10k"

COMPLETION_WAITING_DOTS="true"

DISABLE_AUTO_TITLE="true"
plugins=(git fast-syntax-highlighting zsh-autosuggestions)

source $ZSH/oh-my-zsh.sh
# -------------------

function set_win_title(){
    echo -ne "\033]0; $(echo "$PWD") \007"
}
precmd_functions+=(set_win_title)

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
# Terminal
alias zshconfig="nvim ~/.zshrc"
alias cls="clear"
alias fuck="sudo !!" 
# ---------------------


# ---------------------
# Package managing (pacman)
alias pacinstall="sudo pacman -Sy"
alias pacremove="sudo pacman -Rn"
alias pacupdate="sudo pacman -Syyu"
# ---------------------


# ---------------------
# System
alias sysinfo="inxi -Fazy"
# ---------------------


# ---------------------
# Navigation
alias dotfiles="cd ~/Git/dotfiles"
alias oldhome="cd /home/roberto_mjro_old/"
# ---------------------


# ---------------------
# File managment

alias rm="rm -i"
alias mv="mv -i"
alias cp="cp -i"
alias nnn="nnn -H"
# ---------------------


# ---------------------
# Text editing
alias vim="nvim"
# ---------------------


# ---------------------
# Improved 'ls'
alias tree="exa -T --color=always --color-scale --icons"
alias ls="exa -Glh --color=always --git --color-scale --group-directories-first --icons"
alias la="exa -Glah --color=always --git --color-scale --group-directories-first --icons"
# ---------------------



# =====================
# PLUGINS
# =====================


# ---------------------
# Don't throw errors when file globs don't match anything
setopt NULL_GLOB
# ---------------------

# ---------------------
# ruby
# ---------------------
# rbenv
# export PATH="$HOME/.rbenv/bin:$PATH"
# eval "$(rbenv init -)"

# ruby build
# export PATH="$HOME/.rbenv/plugins/ruby-build/bin:$PATH"
# ---------------------


# ---------------------
# Flutter
# export PATH="$HOME/Devel/flutter/bin:$PATH"
# ---------------------


# ---------------------
# Make 'yay' (AUR helper) completitions work
# ---------------------
# autoload -Uz compinit
# compinit (or run this command, or delete .zcompdump...)
# ---------------------


# ---------------------
# Print last login
# ---------------------
# echo "Last login: `last -1 -R $USER | head -1 | cut -c 20-`"
# ---------------------
