source ~/.zshrc.inc

source ~/.profile


# "~ $"
PS1="%{$fg_bold[white]%}%1~%{$reset_color%} %{$fg_bold[red]%}\$%{$reset_color%} "


bindkey '^A' beginning-of-line
bindkey '^E' end-of-line


unalias rm
unalias mv
unalias cp


setopt HIST_IGNORE_DUPS
