export EDITOR='vim'

alias ls='ls -F' # add -G option for colors
alias shutdown_server='ssh root@192.168.1.100 init 0'
alias jslint='java org.mozilla.javascript.tools.shell.Main ~/.jslint.js'
alias cd..='cd ..'
alias ri='ri -Tf ansi'
alias ruby='ruby -w'
alias start_hamachi='sudo tuncfg && hamachi start && hamachi login && hamachi set-nick "tilltheis"'
alias test_ruby='for f in *_test.rb ; do res=`ruby $f | grep errors` ; echo "$f: $res" ; done'
alias test_ruby_detailed='for f in *_test.rb ; do ruby $f ; done'
alias chrome='open -a Google\ Chrome --args --enable-speech-input'
alias vi='vim'

# gihub.com/rupa/z
source ~/Entwicklung/github/z/z.sh

traceapp () {
    sudo echo '' > /dev/null && open /Applications/$1.app/ && a=`ps ax | grep $1 | head -n 1` && b=`php -r 'preg_match("/\d+/", $argv[1], $a); echo $a[0];' $a` && sudo opensnoop -p $b | grep '/Users/till/'
}

quit () {
    for app in $*; do
        osascript -e 'quit app "'$app'"'
    done
}


# Haskell
export PATH=/Users/till/Library/Haskell/bin:$PATH

# prefer custom builds over system builds of programs
export PATH=/usr/local/bin:$PATH

# homebrew
export PATH=/Users/till/.brew/bin:$PATH


[[ -s "$HOME/.rvm/scripts/rvm" ]] && . "$HOME/.rvm/scripts/rvm" ]]


export PATH=/Users/till/Entwicklung/utilities:$PATH

# setup env for ~/Documents/Entwicklung/utilities/gitignore
export GITIGNORE_REPO='/Users/till/Entwicklung/github/gitignore/'


# rvm needs gcc
export CC=gcc-4.2
