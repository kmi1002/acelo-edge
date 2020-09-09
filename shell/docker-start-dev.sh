#!/bin/bash

function dev_all()
{
  cp .env.dev .env
  docker-compose \
    -p project \
    -f ./docker-compose/api/docker-compose.base.yml \
    -f ./docker-compose/api/docker-compose.dev.yml \
    -f ./docker-compose/admin/docker-compose.base.yml \
    -f ./docker-compose/admin/docker-compose.dev.yml \
    -f ./docker-compose/web/docker-compose.base.yml \
    -f ./docker-compose/web/docker-compose.dev.yml \
    up -d $build --remove-orphans
}

function dev_api()
{
  cp .env.dev .env
  docker-compose \
    -p project \
    -f ./docker-compose/api/docker-compose.base.yml \
    -f ./docker-compose/api/docker-compose.dev.yml \
    up -d $build --remove-orphans
}

function dev_admin()
{
  cp .env.dev .env
  docker-compose \
    -p project \
    -f ./docker-compose/api/docker-compose.base.yml \
    -f ./docker-compose/api/docker-compose.dev.yml \
    -f ./docker-compose/admin/docker-compose.base.yml \
    -f ./docker-compose/admin/docker-compose.dev.yml \
    up -d $build --remove-orphans
}

function dev_web()
{
  cp .env.dev .env
  docker-compose \
    -p project \
    -f ./docker-compose/api/docker-compose.base.yml \
    -f ./docker-compose/api/docker-compose.dev.yml \
    -f ./docker-compose/web/docker-compose.base.yml \
    -f ./docker-compose/web/docker-compose.dev.yml \
    -f ./docker-compose/docker-compose.postgre.yml \
    up -d $build --remove-orphans
}

function dev()
{
  echo
  PS3="Please select which option > "
  options=("ALL" "API" "API + Admin" "API + Web" "Quit")
  select yn in "${options[@]}"; do
      case $yn in
          "All" )         dev_all; break;;
          "API" )         dev_api; break;;
          "API + Admin" ) dev_admin; break;;
          "API + Web" )   dev_web; break;;
          "Quit" )        exit;;
      esac
  done
}
