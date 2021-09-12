#!/bin/bash
. ubuntu.sh
. macos.sh

editor=false

while getopts 'e' flag; do
  case "${flag}" in
    # below is how to pass an argument
    # f) files="${OPTARG}" ;;
    e) editor=true ;;
    *) exit 1 ;;
  esac
done

case "$(uname)" in
  Darwin)
    setupMac $editor
    ;;
  Linux)
    setupUbuntu $editor
    ;;
esac

if [ -f ".oh-my-zsh" ]; then
  echo "Downloading OMZ..."
  sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
  echo "Downloading Spaceship theme..."
  curl -o - https://raw.githubusercontent.com/denysdovhan/spaceship-zsh-theme/master/install.zsh | zsh
  echo "Downloading autosuggestions..."
  git clone git://github.com/zsh-users/zsh-autosuggestions $ZSH_CUSTOM/plugins/zsh-autosuggestions
else
  echo "oh-my-zsh! found"
fi

if [ -f "~/.local/share/nvim/site/pack/packer/start/packer.nvim" ]; then
  echo "Installing packer.nvim..."
  git clone --depth 1 https://github.com/wbthomason/packer.nvim\
  ~/.local/share/nvim/site/pack/packer/start/packer.nvim
else 
  echo "packer.nvim found"
fi

echo "Symlinking.."
ln -sf ~/.dotfiles/init.lua ~/.config/nvim/init.lua
ln -sf ~/.dotfiles/lua ~/.config/nvim/lua
ln -sf ~/.dotfiles/.zshrc ~/.zshrc

echo
echo "Symlinking Complete!"
echo
