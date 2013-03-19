export EDITOR='vim'

alias ls='ls -FG' # add -G option for colors
alias ri='ri -Tf ansi'
alias ruby='ruby -w'

# gihub.com/rupa/z
source ~/Entwicklung/github/z/z.sh

traceapp () {
    sudo echo '' > /dev/null && open /Applications/$1.app/ && a=`ps ax | grep $1 | head -n 1` && b=`php -r 'preg_match("/\d+/", $argv[1], $a); echo $a[0];' $a` && sudo opensnoop -p $b | grep '/Users/till/'
}

# My scripts/programs
export PATH=/Users/till/bin:$PATH

# Haskell
export PATH=/Users/till/Library/Haskell/bin:~/.cabal/bin:$PATH

# prefer custom builds over system builds of programs
export PATH=/usr/local/bin:$PATH

# homebrew
export PATH=/Users/till/.brew/bin:$PATH

# gitignore
export PATH=/Users/till/Entwicklung/utilities:$PATH
export GITIGNORE_REPO='/Users/till/Entwicklung/github/gitignore/'

# rbenv
# eval "$(rbenv init -)"
