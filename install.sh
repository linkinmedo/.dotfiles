if [ "$(uname)" == "Darwin" ]; then
  # macOS
  which -s brew
  if [[ $? != 0 ]] ; then
    echo "Installing Homebrew"
    /usr/bin/ruby -e "$(curl -fsSL https://raw.github.com/gist/323731)"
  else
    echo "Updating Homebrew"
    brew update
  fi

elif [ "$(uname)" == "Linux" ]; then
  # Linux

fi

echo "Symlinking.."
ln -sf ~/.dotfiles/init.vim ~/.config/nvim/init.vim
ln -sf ~/.dotfiles/.zshrc ~/.zshrc

echo
echo "Symlinking Complete!"
echo
