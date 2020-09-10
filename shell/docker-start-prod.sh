#!/bin/bash

function prod_all()
{
  cp .env.prod .env
  docker-compose \
    -p acelo-edge \
    -f ./docker-compose/api/docker-compose.base.yml \
    -f ./docker-compose/api/docker-compose.prod.yml \
    -f ./docker-compose/admin/docker-compose.base.yml \
    -f ./docker-compose/admin/docker-compose.prod.yml \
    -f ./docker-compose/web/docker-compose.base.yml \
    -f ./docker-compose/web/docker-compose.prod.yml \
    -f ./docker-compose/docker-compose.postgre.yml \
    up -d $build --remove-orphans
}

function prod_api()
{
  cp .env.prod .env
  docker-compose \
    -p acelo-edge \
    -f ./docker-compose/api/docker-compose.base.yml \
    -f ./docker-compose/api/docker-compose.prod.yml \
    up -d $build --remove-orphans
}

function prod_admin()
{
  cp .env.prod .env
  docker-compose \
    -p acelo-edge \
    -f ./docker-compose/api/docker-compose.base.yml \
    -f ./docker-compose/api/docker-compose.prod.yml \
    -f ./docker-compose/admin/docker-compose.base.yml \
    -f ./docker-compose/admin/docker-compose.prod.yml \
    up -d $build --remove-orphans
}

function prod_web()
{
  cp .env.prod .env
  docker-compose \
    -p acelo-edge \
    -f ./docker-compose/api/docker-compose.base.yml \
    -f ./docker-compose/api/docker-compose.prod.yml \
    -f ./docker-compose/web/docker-compose.base.yml \
    -f ./docker-compose/web/docker-compose.prod.yml \
    up -d $build --remove-orphans
}

function prod()
{
  echo
  PS3="Please select which option > "
  options=("ALL" "API" "API + Admin" "API + Web" "Quit")
  select yn in "${options[@]}"; do
      case $yn in
          "All" )         prod_all; break;;
          "API" )         prod_api; break;;
          "API + Admin" ) prod_admin; break;;
          "API + Web" )   prod_web; break;;
          "Quit" )        exit;;
      esac
  done
}