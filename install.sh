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
    for pkg in git tmux python3 neovim zsh; do
      if brew list -1 | grep -q "^${pkg}\$"; then
        echo "Package '$pkg' is installed"
      else
        echo "Installing package '$pkg'"
        brew install $pkg;
      fi
    done
    ;;
  Linux)
    ;;
esac

echo "Symlinking.."
ln -sf ~/.dotfiles/init.vim ~/.config/nvim/init.vim
ln -sf ~/.dotfiles/.zshrc ~/.zshrc

echo
echo "Symlinking Complete!"
echo
