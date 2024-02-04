HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=1000
setopt INC_APPEND_HISTORY_TIME

# enable auto completion
autoload -Uz compinit && compinit

# setup
autoload -Uz colors && colors;
setopt prompt_subst

# show git branch/tag, or name-rev if on detached head
parse_git_branch() {
  (command git symbolic-ref -q HEAD || command git name-rev --name-only --no-undefined --always HEAD) 2>/dev/null
}

# show dirty indicator if there are uncommitted changes
parse_git_dirty() {
  if command git diff-index --quiet HEAD 2> /dev/null; then
    echo "$ZSH_THEME_GIT_PROMPT_CLEAN"
  else
    echo "$ZSH_THEME_GIT_PROMPT_DIRTY"
  fi
}

# if in a git repo, show dirty indicator + git branch
git_prompt_info() {
  local git_where="$(parse_git_branch)"
  [ -n "$git_where" ] && echo "$ZSH_THEME_GIT_PROMPT_PREFIX${git_where#(refs/heads/|tags/)}$(parse_git_dirty)$ZSH_THEME_GIT_PROMPT_SUFFIX"
}

# prompt
PROMPT='%{$fg_bold[white]%}%1~%{$reset_color%}$(git_prompt_info) %{$fg_bold[red]%}\$%{$reset_color%} '
ZSH_THEME_GIT_PROMPT_PREFIX="%{$fg[white]%} ["
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_DIRTY="] ✗"
ZSH_THEME_GIT_PROMPT_CLEAN="]"


###

# keep pwd when cloning tabs in windows terminal
keep_current_path() {
  printf "\e]9;9;%s\e\\" "$(wslpath -w "$PWD")"
}
precmd_functions+=(keep_current_path)


###


export EDITOR='vim'


alias ls='ls -FG --color=auto' # add -G option for colors
alias gst='git status'
alias g=git
alias gb='git branch'
alias ga='git add'
alias gp='git push'
alias gc='git commit'
alias gd='git diff -w'
alias gs='git show -w'
alias gl='git pull --rebase'
alias gco='git checkout'
alias glg='git log --color --graph --pretty=format:"%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset" --abbrev-commit --'
alias dcupd='docker-compose up -d'
alias dcdn='docker-compose down'


#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="$HOME/.sdkman"
[[ -s "$HOME/.sdkman/bin/sdkman-init.sh" ]] && source "$HOME/.sdkman/bin/sdkman-init.sh"

# Install Ruby Gems to ~/gems
export GEM_HOME="$HOME/gems"
export PATH="$HOME/gems/bin:$PATH"

# pip
export PATH="$HOME/.local/bin:$PATH"

# make ctrl+left and ctrl+right move words
bindkey "^[[1;5C" forward-word
bindkey "^[[1;5D" backward-word


export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
