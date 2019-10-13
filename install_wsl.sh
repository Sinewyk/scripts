#! /usr/bin/env bash

set -euxo pipefail

cd ~

# update
sudo apt-get update

# some packages
sudo apt-get install -y --no-install-recommends man-db \
  curl \
  wget \
  git \
  zsh \
  ca-certificates \
  vim \
  ssh

# git config
git config --global user.email "sinewyk@gmail.com"
git config --global user.name "sinewyk"

# oh-my-zsh
sh -c "$(wget -O- https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

# ssh conf windows => wsl
cp -R /mnt/c/Users/Sinewyk/.ssh .ssh
chown -R 700 .ssh