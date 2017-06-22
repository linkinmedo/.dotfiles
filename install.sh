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
    echo "Installing Packages"
    apt-get install -y git tmux python3 neovim zsh
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

echo "Symlinking.."
ln -sf ~/.dotfiles/init.vim ~/.config/nvim/init.vim
ln -sf ~/.dotfiles/.zshrc ~/.zshrc

echo
echo "Symlinking Complete!"
echo
