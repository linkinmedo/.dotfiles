#!/bin/bash

case "$(uname)" in
  Darwin)
    which -s brew
    if [[ $? != 0 ]]; then
      echo "Installing Homebrew"
      /usr/bin/ruby -e "$(curl -fsSL https://raw.github.com/gist/323731)"
    else
      echo "Updating Homebrew"
      brew update
    fi

    echo "Installing Packages..."
    brew install git tmux python3 neovim zsh
    ;;
  Linux)
    apt-get update
    if [ $(dpkg-query -W -f='${Status}' nodejs 2>/dev/null | grep -c "ok installed") -eq 0 ];
    then
      echo "Setting nodejs 6"
      curl -sL https://deb.nodesource.com/setup_6.x | sudo -E bash -
    fi
    echo "Installing Packages"
    apt-get install -y git tmux python3 neovim zsh nodejs
    ;;
esac

if [ -f ".oh-my-zsh" ]; then
  echo "Downloading OMZ..."
  sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
  echo "Downloading Spaceship theme..."
  curl -o - https://raw.githubusercontent.com/denysdovhan/spaceship-zsh-theme/master/install.zsh | zsh
  echo "Downloading autosuggestions..."
  git clone git://github.com/zsh-users/zsh-autosuggestions $ZSH_CUSTOM/plugins/zsh-autosuggestions
fi

if [ -f "~/.local/share/nvim/site/autoload/plug.vim" ]; then
  echo "Installing vim-plug"
  curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
fi

echo "Symlinking.."
ln -sf ~/.dotfiles/init.vim ~/.config/nvim/init.vim
ln -sf ~/.dotfiles/.zshrc ~/.zshrc

echo
echo "Symlinking Complete!"
echo
