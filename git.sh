#!/bin/bash

source ./shell/git-init.sh
source ./shell/git-update.sh

echo
PS3="Please select which option > "
options=("Git Init" "Git Update" "Quit")
select yn in "${options[@]}"; do
    case $yn in
        "Git Init" )      git_init; break;;
        "Git Update" )    git_update; break;;
        "Quit" ) exit;;
    esac
done