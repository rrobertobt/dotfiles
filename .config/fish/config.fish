# Put system-wide fish configuration entries here
# or in .fish files in conf.d/
# Files in conf.d can be overridden by the user
# by files with the same name in $XDG_CONFIG_HOME/fish/conf.d

# This file is run by all fish instances.
# To include configuration only for login shells, use
# if status --is-login
#    ...
# end
# To include configuration only for interactive shells, use
# if status --is-interactive
#   ...
# end
#
#

# =====================                           
# colors
# =====================  

set fish_color_normal white --bold
set fish_color_autosuggestion '555' brblack
set fish_color_command white --bold
set fish_color_error red
set fish_color_param cyan



# =====================                           
# fish settings                                         
# =====================                           
 
set fish_greeting 

starship init fish | source
# =====================  



# =====================
# List of fisher plugins
# =====================
#
# Install with "fisher install user/repo"
#
# - https://github.com/jhillyerd/plugin-git
# jorgebucaran/fisher
# jhillyerd/plugin-git
# FabioAntunes/fish-nvm
# edc/bass

# =====================



# =====================
# Functions
# =====================

# ---------------------
# bang-bang (!!)

function __history_previous_command
  switch (commandline -t)
  case "!"
    commandline -t $history[1]; commandline -f repaint
  case "*"
    commandline -i !
  end
end

function __history_previous_command_arguments
  switch (commandline -t)
  case "!"
    commandline -t ""
    commandline -f history-token-search-backward
  case "*"
    commandline -i '$'
  end
end
# The bindings for !! and !$
if [ $fish_key_bindings = fish_vi_key_bindings ];
  bind -Minsert ! __history_previous_command
  bind -Minsert '$' __history_previous_command_arguments
else
  bind ! __history_previous_command
  bind '$' __history_previous_command_arguments
end
# ---------------------


# ---------------------
# terminal title

function fish_title
    echo (status current-command) ' '
    echo '@ '
    pwd
end
# ---------------------
# =====================  



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
# Package managing (dnf)
# ---------------------
alias dinstall="sudo dnf install"                 
alias dremove="sudo dnf remove"                   
alias dupdate="sudo dnf update"                   
alias dupgrade="sudo dnf upgrade"                 
# ---------------------                           
                                                  
                                                  
# ---------------------                           
# Package managing (pacman)                       
# ---------------------
alias pacinstall="sudo pacman -S"                
alias pacremove="sudo pacman -Rn"                 
alias pacupdate="sudo pacman -Syyu"               
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
# ---------------------                                                                  
                                                                                         
                                                                                         
# ---------------------                                                                  
# Improved 'ls'
# ---------------------  
alias tree="exa -T --color=always --color-scale --icons"                                 
alias ls="exa -lh --color=always --git --color-scale --group-directories-first --icons" 
alias la="exa -lha --color=always --git --color-scale --group-directories-first --icons"
# ---------------------


# ---------------------
# Switch between shells (doesn't work on Red Hat distros, use lchsh)
# ---------------------  
alias tobash="sudo chsh $USER -s `which bash` && echo 'Now log out...'"
alias tozsh="sudo chsh $USER -s `which zsh` && echo 'Now log out...'"
alias tofish="sudo chsh $USER -s `which fish` && echo 'Now log out...'"
# ---------------------

# =====================


