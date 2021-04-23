#
# ~/.bashrc
#

# =====================
# Default prompt
# =====================

export PS1='\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\W\[\033[33m\]\[\033[37m\]\$\[\033[00m\] '

# =====================

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# ========================
# Initialize prompt
# ========================

# ---------------------
# starship prompt
# ---------------------
eval "$(starship init zsh)"
# ---------------------

# ========================


# =====================
# Functions
# =====================

# ---------------------
# Switch between shells
# ---------------------
function tozsh {
	if [ -x "$(command -v chsh)" ]; then
		sudo chsh -s `which zsh` $USER
		echo "Now log out and log back in..."
	elif [ -x "$(command -v lchsh)" ]; then
		echo "Using 'lchsh', enter manually the path of the shell...\n"
		sudo lchsh $USER
		echo "Now log out and log back in..."
	elif [ -x "$(command -v usermod)" ]; then
		sudo usermod -s /usr/bin/zsh $USER
		echo "Now log out and log back in..."
	else
		echo "No command found, can't change shell"
	fi
}

function tobash {
	if [ -x "$(command -v chsh)" ]; then
		sudo chsh -s /bin/bash $USER 
		echo "Now log out and log back in..."
	elif [ -x "$(command -v lchsh)" ]; then
		echo "Using 'lchsh', enter manually the path of the shell...\n"
		sudo lchsh $USER
		echo "Now log out and log back in..."
	elif [ -x "$(command -v usermod)" ]; then
		sudo usermod -s /bin/bash $USER
		echo "Now log out and log back in..."
	else
		echo "No command found, can't change shell"
	fi
}

function tofish {
	if [ -x "$(command -v chsh)" ]; then
		sudo chsh -s `which fish` $USER
		echo "Now log out and log back in..."
	elif [ -x "$(command -v lchsh)" ]; then
		echo "Using 'lchsh', enter manually the path of the shell...\n"
		sudo lchsh $USER
		echo "Now log out and log back in..."
	elif [ -x "$(command -v usermod)" ]; then
		sudo usermod -s /usr/bin/fish $USER
		echo "Now log out and log back in..."
	else
		echo "No command found, can't change shell"
	fi
}

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
alias dnfi="sudo dnf install"                 
alias dnfr="sudo dnf remove"                   
alias dnfu="sudo dnf update"
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
alias rm="rm -i"                  
alias mv="mv -i"                  
alias cp="cp -i"                  
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
# export PATH="$HOME/.dev/flutter/bin:$PATH"
# ---------------------

# ---------------------
# Scripts in path
# ---------------------
export PATH="$HOME/.dotfiles/scripts:$PATH"
# ---------------------

# ---------------------
# nvm
# ---------------------
#export NVM_DIR="$HOME/.nvm"
#[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
#[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
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


