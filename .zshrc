# ---------------------
# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi
# ---------------------



# ---------------------
# oh-my-zsh and zsh settings
export ZSH=/usr/share/oh-my-zsh

ZSH_THEME="robbyrussell"

COMPLETION_WAITING_DOTS="true"

plugins=(git)

source $ZSH/oh-my-zsh.sh
# ---------------------



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
alias cat="ccat"
alias nnn="nnn -H"
# ---------------------


# ---------------------
# Text editing
alias vim="nvim"
# ---------------------


# ---------------------
# Improved 'ls'
alias tree="exa -T --color=always --color-scale"
alias ls="exa -Glh --color=always --git --color-scale --group-directories-first"
alias la="exa -Glah --color=always --git --color-scale --group-directories-first"
# ---------------------



# =====================
# PLUGINS
# =====================

# ---------------------
# powerlevel10k
# ---------------------
#
# Load powerlevel10k
source /usr/share/zsh-theme-powerlevel10k/powerlevel10k.zsh-theme

# Load powerlevel10k config
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
# ---------------------


# ---------------------
# Syntax highlighing
source /usr/share/zsh/plugins/fast-syntax-highlighting/fast-syntax-highlighting.plugin.zsh
# ---------------------


# ---------------------
# Fish-like autosuggestions
source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.plugin.zsh
# ---------------------


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
# Run 'pfetch' command everytime zsh runs
# ---------------------
pfetch
# ---------------------

/home/robertob/.spectrum

# ---------------------
# Print last login
# ---------------------
# echo "Last login: `last -1 -R $USER | head -1 | cut -c 20-`"
# ---------------------
