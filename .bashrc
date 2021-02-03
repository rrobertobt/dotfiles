#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

eval "$(starship init bash)"

# =====================
# Aliases
# =====================

# ---------------------
# Terminal
alias zshconfig="nvim ~/.zshrc"
alias cls="clear"
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


export PS1='\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\W\[\033[33m\]\[\033[37m\]\$\[\033[00m\] '
