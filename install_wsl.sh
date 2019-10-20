#! /usr/bin/env bash

# Call with sudo and additional string arguments for additional stuff to install
# For now just "rust" is there for rustup
# Exemple: `sudo ./scripts/install_wsl.sh 'rust'`

set -euxo pipefail

PSEUDO=sinewyk
EMAIL=sinewyk@gmail.com
WINDOWS_USER=Sinewyk # remember to lowercaser my name next time on windows :o
WHAT_TO_INSTALL=$1

cd $HOME

# update packages
sudo apt-get update

# install some "mandatory" some packages
sudo apt-get install -y --no-install-recommends man-db \
  curl \
  git \
  zsh \
  ca-certificates \
  vim \
  ssh \
  build-essential

# git config
git config --global user.name "$PSEUDO"
git config --global user.email "$EMAIL"

# rust detected ?
if [[ $WHAT_TO_INSTALL == *"rust"* ]]; then
  curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
fi

# oh-my-zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

# ssh conf windows => wsl
cp -R /mnt/c/Users/$WINDOWS_USER/.ssh .ssh
chmod -R 700 .ssh