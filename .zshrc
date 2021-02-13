# ---------------------
# Powerlevel10k prompt and instant prompt
# ---------------------
#if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
#  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
#fi

#[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
# ---------------------


# ---------------------
# start starship prompt
# ---------------------
eval "$(starship init zsh)"


# ---------------------
# oh-my-zsh and zsh settings
# ---------------------
export ZSH=$HOME/.oh-my-zsh

ZSH_THEME="agnoster"
#ZSH_THEME="powerlevel10k/powerlevel10k"

COMPLETION_WAITING_DOTS="true"

DISABLE_AUTO_TITLE="false"
plugins=(git fast-syntax-highlighting zsh-autosuggestions)

source $ZSH/oh-my-zsh.sh
# -------------------

#function set_win_title(){
#    echo -ne "\033]0; $(echo "$PWD") \007"
#}
#precmd_functions+=(set_win_title)


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
alias ls="exa -lh --color=always --git --color-scale --group-directories-first --icons" 
alias la="exa -lha --color=always --git --color-scale --group-directories-first --icons"
# ---------------------

# ---------------------
# Switch between shells
alias tobash="sudo chsh $USER -s `which bash` && echo 'Now log out...'"
alias tozsh="sudo chsh $USER -s `which zsh` && echo 'Now log out...'"
alias tofish="sudo chsh $USER -s `which fish` && echo 'Now log out...'"
# ---------------------



# =====================
# PLUGINS
# =====================

# ---------------------
# Fish-like autosuggestions
# source /usr/share/zsh-autosuggestions/zsh-autosuggestions.plugin.zsh
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
# Print last login
# ---------------------
# echo "Last login:`last -2 -R $USER | head -2 | cut -c 20- | sed -n '1!p'`"
# ---------------------
export ZSH_THEME_TERM_TITLE_IDLE="%n:%~"

export NVM_DIR="$([ -z "${XDG_CONFIG_HOME-}" ] && printf %s "${HOME}/.nvm" || printf %s "${XDG_CONFIG_HOME}/nvm")"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" # This loads nvm

