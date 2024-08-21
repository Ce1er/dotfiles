# If not running interactively, don't do anything
[[ $- != *i* ]] && return


alias ls='ls --color=auto'
alias grep='grep --color=auto'
alias c='clear'
alias nv='sudo -Es nvim'
alias nf='neofetch'
alias gb='setxkbmap gb'
alias razer='openrazer-daemon -r'
alias e='exit'
alias sd='shutdown'
PS1='[\u@\h \W]\$ '

eval "$(thefuck --alias)"

export GTK_THEME=Adwaita:dark
