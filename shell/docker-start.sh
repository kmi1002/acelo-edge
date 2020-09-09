#!/bin/bash

source ./shell/docker-start-local.sh
source ./shell/docker-start-dev.sh
source ./shell/docker-start-prod.sh

docker_start() {
  echo "Docker Run"
  echo
  PS3="Please select which option > "
  options=("Local Server" "Development Server" "Production Server" "Quit")
  select yn in "${options[@]}"; do
      case $yn in
          "Local Server" )        local; break;;
          "Development Server" )  dev; break;;
          "Production Server" )   prod; break;;
          "Quit" ) exit;;
      esac
  done
}