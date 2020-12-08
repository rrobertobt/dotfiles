#
# /etc/bash.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

[[ $DISPLAY ]] && shopt -s checkwinsize


PS1='\[\033[0;38m\] [\[\033[01;38m\] \d] \[\033[0;37m\]\h \[\033[01;34m\]\W \[\033[01;32m\]\$ \[\033[0;38m\]'

# Layout is:  [ date] hostname current_dir $ >command

case ${TERM} in
  xterm*|rxvt*|Eterm|aterm|kterm|gnome*)
    PROMPT_COMMAND=${PROMPT_COMMAND:+$PROMPT_COMMAND; }'printf "\033]0;%s@%s:%s\007" "${USER}" "${HOSTNAME%%.*}" "${PWD/#$HOME/\~}"'

    ;;
  screen*)
    PROMPT_COMMAND=${PROMPT_COMMAND:+$PROMPT_COMMAND; }'printf "\033_%s@%s:%s\033\\" "${USER}" "${HOSTNAME%%.*}" "${PWD/#$HOME/\~}"'
    ;;
esac

[ -r /usr/share/bash-completion/bash_completion   ] && . /usr/share/bash-completion/bash_completion


# FOR PROMPT LAYOUT

# For colors use:
# \[\033[x;ym\]
# 
# x = format 
#
#    - Normal Text: 0
#    - Bold or Light Text: 1 (It depends on the terminal emulator.)
#    - Dim Text: 2
#    - Underlined Text: 4
#    - Blinking Text: 5 (This does not work in most terminal emulators.)
#    - Reversed Text: 7 (This inverts the foreground and background colors, so you’ll see black text
#    on a white background if the current text is white text on a black background.)
#    - Hidden Text: 8
#
# y = colors
# 
#   ## foreground ##  
#
#    Black: 30
#    Blue: 34
#    Cyan: 36
#    Green: 32
#    Purple: 35
#    Red: 31
#    White: 37
#    Yellow: 33
#   
#  # or #
#
#   Black 	0;30
#   Blue 	34
#   Green 	32
#   Cyan 	36
#   Red 	31
#   Purple 	35
#   Brown 	33
#   Blue 	34
#   Green 	32
#   Cyan 	36
#   Red 	31
#   Purple 	35
#   Brown 	33
#
#   # background #
#    
#   
#    Black background: 40
#    Blue background: 44
#    Cyan background: 46
#    Green background: 42
#    Purple background: 45
#    Red background: 41
#    White background: 47
#    Yellow background: 43
#
