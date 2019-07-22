#!/usr/bin/env bash

SELECTED_ENV=""
SELECTED_MODE=""

printf "\n"

####################################################
###
### Get environment
###
####################################################
title="Select environment"
prompt="Pick an option:"
options=("PROD" "QA" "STAGING")

printf "\e[4m$title\e[0m\n"
PS3="$prompt "
select opt in "${options[@]}"; do

    case "$REPLY" in

    1 ) SELECTED_ENV=$opt; break;;
    2 ) SELECTED_ENV=$opt; break;;
    3 ) SELECTED_ENV=$opt; break;;

    *) echo "Invalid option. Try another one.";continue;;

    esac

done

printf "\n"

####################################################
###
### Get mode
###
####################################################
title2="Select mode"
prompt2="Pick an option:"
options2=("RELEASE" "DEBUG")

printf "\e[4m$title2\e[0m\n"
PS3="$prompt2 "
select opt in "${options2[@]}"; do

    case "$REPLY" in

    1 ) SELECTED_MODE=$opt; break;;
    2 ) SELECTED_MODE=$opt; break;;

    *) echo "Invalid option. Try another one.";continue;;

    esac

done

printf "\n"



####################################################
###
### Execute
###
####################################################
printf "\e[42m\e[34m-------Generating Apk-------\e[0m\e[34m\e[41m-$SELECTED_ENV-\e[46m-$SELECTED_MODE-\e[0m\n"
make build-apk env=$SELECTED_ENV mode=$SELECTED_MODE