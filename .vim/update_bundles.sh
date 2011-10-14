# thanks to https://github.com/patrickdet (https://github.com/patrickdet/dotfiles/blob/master/bin/vimbundles.sh)

mkdir -p ~/.vim/bundle
cd ~/.vim/bundle

get_bundle() {
  (
  if [ -d "$2" ]; then
    echo "Updating $1's $2"
    cd "$2"
    git pull --rebase
  else
    git clone "git://github.com/$1/$2.git"
  fi
  )
}

get_bundle  Raimondi      delimitMate
get_bundle  austintaylor  vim-indentobject
get_bundle  clones        vim-align
get_bundle  hallettj      jslint.vim
get_bundle  kana          vim-textobj-user
get_bundle  lukerandall   haskellmode-vim
get_bundle  msanders      cocoa.vim
get_bundle  msanders      snipmate.vim
get_bundle  nelstrom      vim-textobj-rubyblock
get_bundle  scrooloose    nerdtree
get_bundle  tpope         vim-repeat
get_bundle  tpope         vim-surround
get_bundle  ujihisa       camelcasemotion
get_bundle  vim-scripts   a.vim
get_bundle  wincent       Command-T
get_bundle  altercation   vim-colors-solarized
get_bundle  derekwyatt    vim-scala
