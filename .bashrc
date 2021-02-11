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
alias fishconfig="nvim ~/.config/fish/config.fish"
alias cls="clear"                                 
# ---------------------                           
                                                  
# ---------------------                           
# Package managing (dnf)                          
alias dinstall="sudo dnf install"                 
alias dremove="sudo dnf remove"                   
alias dupdate="sudo dnf update"                   
alias dupgrade="sudo dnf upgrade"                 
# ---------------------                           
                                                  
                                                  
# ---------------------                           
# Package managing (pacman)                       
alias pacinstall="sudo pacman -S"                
alias pacremove="sudo pacman -Rn"                 
alias pacupdate="sudo pacman -Syyu"               
# ---------------------
#

# ---------------------           
# System                          
alias sysinfo="inxi -Fazy"        
# ---------------------           
                                  
                                  
# ---------------------           
# Navigation                      
alias dotfiles="cd ~/dev/dotfiles"
# ---------------------           
                                  
                                  
# ---------------------           
# File managment                  
alias rm="rm -i"                  
alias mv="mv -i"                  
alias cp="cp -i"                  
# ---------------------

# ---------------------                                                                  
# Text editing                                                                           
alias vim="nvim"                                                                         
# ---------------------                                                                  
                                                                                         
                                                                                         
# ---------------------                                                                  
# Improved 'ls'                                                                          
alias tree="exa -T --color=always --color-scale --icons"                                 
alias ls="exa -G --color=always --git --color-scale --group-directories-first --icons" 
alias la="exa -Ga --color=always --git --color-scale --group-directories-first --icons"
alias ll="exa -Glah --color=always --git --color-scale --group-directories-first --icons"
# ---------------------

# ---------------------
# Switch between shells
alias tobash="sudo chsh $USER -s `which bash` && echo 'Now log out...'"
alias tozsh="sudo chsh $USER -s `which zsh` && echo 'Now log out...'"
alias tofish="sudo chsh $USER -s `which fish` && echo 'Now log out...'"
# ---------------------


export PS1='\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\W\[\033[33m\]\[\033[37m\]\$\[\033[00m\] '
