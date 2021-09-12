setupUbuntu() {
    editor=$1

    if [ $(dpkg-query -W -f='${Status}' yarn 2>/dev/null | grep -c "ok installed") -eq 0 ];
    then
      echo "Setting up yarn repo"
      curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | sudo apt-key add -
      echo "deb https://dl.yarnpkg.com/debian/ stable main" | sudo tee /etc/apt/sources.list.d/yarn.list
    fi

    if [ $editor != true ];
    then
      if [ $(dpkg-query -W -f='${Status}' fnm 2>/dev/null | grep -c "ok installed") -eq 0 ];
      then
        echo "Installing fnm..."
        curl -fsSL https://fnm.vercel.app/install | bash
      else
        echo "Updating fnm..."
        curl -fsSL https://fnm.vercel.app/install --skip-shell | bash
      fi

      echo "Installing node LTS..."
      fnm install --lts
      fnm default lts-latest

      echo "Updating npm..."
      npm install -g npm
    fi

    echo "Updating apt"
    apt-get update

    echo "Installing Packages"
    apt-get install -y git tmux python3 neovim zsh

    if [ $editor != true ];
    then
      echo "Installing yarn..."
      apt-get install --no-install-recommends yarn

      echo "installing npm Packages"
      yarn global add serve fkill-cli create-react-app typescript 
    fi
}
