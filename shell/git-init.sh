#!/bin/bash

copy_default_env_files() {
  echo ">> Copy default env files <<"
  cp .env.example .env.prod
  cp .env.example .env.dev
  cp .env.example .env.local
}

init_and_update_submodules() {
  echo ">> Initialize and update submodules <<"
  git submodule init && git submodule update
}

checkout_branch() {
  branchName=$1
  echo ">> Checkout branch to $branchName <<"
  git submodule foreach git checkout $branchName
}

install_node_modules() {
  echo ">> Install node modules <<"
  git submodule foreach yarn
}

git_init() {
  copy_default_env_files # 기본 환경 변수 파일 만들기
  init_and_update_submodules # submodule 초기화 및 소스 업데이트
  checkout_branch master # master 브랜치로 변경
  install_node_modules # node modules 설치
}
