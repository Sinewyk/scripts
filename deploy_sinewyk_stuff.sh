#! /usr/bin/env bash
set -euxo pipefail

REPO_PATH=/home/sinewyk/sinewyk-stuff
WWW_PATH=/var/www
MY_STUFF_PATH=$WWW_PATH/sinewyk-stuff
CURRENT_PATH=$MY_STUFF_PATH/current
RELEASES_PATH=$MY_STUFF_PATH/releases
TIMESTAMP=$(date '+%s')
NEXT_DEPLOY_COPY_PATH=$RELEASES_PATH/$TIMESTAMP

build() {
  cd $REPO_PATH
  git pull origin master
  yarn
  yarn build
}

copy() {
  cp -R dist $NEXT_DEPLOY_COPY_PATH
}

deploy() {
  ln -fsn $NEXT_DEPLOY_COPY_PATH $CURRENT_PATH
}

cleanup() {
  cd $RELEASES_PATH
  rm -Rf `ls -1rv | tail -n +3`
}

build
copy
deploy
cleanup