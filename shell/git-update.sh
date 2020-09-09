#!/bin/bash

git_fetch() {
  echo ">> Fetch source for main module <<"
  git fetch -p

  echo ">> Fetch source for sub modules <<"
  git submodule foreach git fetch -p
}

git_pull() {
  echo ">> Pull source for main module <<"
  git pull

  echo ">> Pull source for sub modules <<"
  git submodule foreach git pull
}

git_update() {
  git_fetch # 최신 소스 확인
  git_pull # 최신 소스 가져오기
}