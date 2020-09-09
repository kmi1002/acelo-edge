#!/bin/bash

if [ "$#" -eq 3 ]; then
  git submodule add -f -b $1 $2 $3
elif [ "$#" -eq 1 ]; then
  git submodule deinit -f $1
  rm -rf .git/modules/$1
  git rm -f $1
else
  echo "잘못된 방법"
fi