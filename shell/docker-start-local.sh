#!/bin/bash

function local_all()
{
  cp .env.local .env
  docker-compose \
    -p project \
    -f ./docker-compose/docker-compose.postgre.yml \
    -f ./docker-compose/api/docker-compose.base.yml \
    -f ./docker-compose/api/docker-compose.local.yml \
    -f ./docker-compose/admin/docker-compose.base.yml \
    -f ./docker-compose/admin/docker-compose.local.yml \
    -f ./docker-compose/web/docker-compose.base.yml \
    -f ./docker-compose/web/docker-compose.local.yml \
    up $build --remove-orphans
}

function local_api()
{
  cp .env.local .env
  docker-compose \
    -p project \
    -f ./docker-compose/docker-compose.postgre.yml \
    -f ./docker-compose/api/docker-compose.base.yml \
    -f ./docker-compose/api/docker-compose.local.yml \
    up $build --remove-orphans
}

function local_admin()
{
  cp .env.local .env
  docker-compose \
    -p project \
    -f ./docker-compose/docker-compose.postgre.yml \
    -f ./docker-compose/api/docker-compose.base.yml \
    -f ./docker-compose/api/docker-compose.local.yml \
    -f ./docker-compose/admin/docker-compose.base.yml \
    -f ./docker-compose/admin/docker-compose.local.yml \
    up $build --remove-orphans
}

function local_web()
{
  cp .env.local .env
  docker-compose \
    -p project \
    -f ./docker-compose/docker-compose.postgre.yml \
    -f ./docker-compose/api/docker-compose.base.yml \
    -f ./docker-compose/api/docker-compose.local.yml \
    -f ./docker-compose/web/docker-compose.base.yml \
    -f ./docker-compose/web/docker-compose.local.yml \
    up $build --remove-orphans
}

function local()
{
  echo
  PS3="Please select which option > "
  options=("All" "Api" "Api + Admin" "Api + Web" "Quit")
  select yn in "${options[@]}"; do
      case $yn in
          "All" )         local_all; break;;
          "Api" )         local_api; break;;
          "Api + Admin" ) local_admin; break;;
          "Api + Web" )   local_web; break;;
          "Quit" )        exit;;
      esac
  done
}