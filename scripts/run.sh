#!/usr/bin/env bash

SELECTED_ENV=""
SELECTED_MODE=""

####################################################
###
### Execute
###
####################################################
source ./scripts/select.sh
get_env
get_mode
printf "\e[42m\e[34m-------Running App-------\e[0m\e[34m\e[41m-$SELECTED_ENV-\e[46m-$SELECTED_MODE-\e[0m\n"
make run-apk env=$SELECTED_ENV mode=$SELECTED_MODE