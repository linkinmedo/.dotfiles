setupMac() {
    editor=$1
    which -s brew
    if [[ $? != 0 ]]; then
      echo "Installing Homebrew"
      /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
    else
      echo "Updating Homebrew"
      brew update
    fi

    if [ $editor != true ];
    then
      which -s fnm
      if [[ $? != 0 ]]; then
        echo "Installing fnm..."
        curl -fsSL https://fnm.vercel.app/install | bash
      else
        echo "Updating fnm..."
        brew upgrade fnm
      fi

      echo "Installing node LTS..."
      fnm install --lts
      fnm default lts-latest

      echo "Updating npm..."
      npm install -g npm

      echo "Installing yarn..."
      brew install yarn --ignore-dependencies

      echo "installing npm Packages"
      yarn global add serve fkill-cli create-react-app typescript 
    fi

    echo "Installing Packages..."
    brew install git tmux python3 neovim zsh 
}
