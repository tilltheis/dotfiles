ZSH=$HOME/.oh-my-zsh
ZSH_THEME="tilltheis"
plugins=(brew bundler extract gem git git-flow osx)
export DISABLE_AUTO_UPDATE="true"
source $ZSH/oh-my-zsh.sh
source ~/.profile

# for z (sourced in .profile)
function precmd () {
  z --add "$(pwd -P)"
}
