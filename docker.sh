#!/bin/bash

source ./shell/docker-start.sh
source ./shell/docker-stop.sh


# 빌드 옵션 확인
build=""

for arg in "$@"
do
  if [ $arg == '--build' ];then
    build=$arg
  fi
done

echo
PS3="Please select which option > "
options=("Docker Start" "Docker Stop" "Quit")
select yn in "${options[@]}"; do
    case $yn in
        "Docker Start" )  docker_start; break;;
        "Docker Stop" )   docker_stop; break;;
        "Quit" ) exit;;
    esac
done