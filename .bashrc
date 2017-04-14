#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

#alias ls='ls --color=auto'
alias ll='ls -l'
alias la='ls -a'
alias lla='ls -la'

alias et='emacsclient -t'
alias ec='emacsclient -c'

PS1='[\u@\h \W]\$ '

export GDK_CORE_DEVICE_EVENTS=1
