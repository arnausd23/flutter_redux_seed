#!/usr/bin/env bash

SELECTED_ENV=""
SELECTED_MODE=""

printf "\n"

####################################################
###
### Get environment
###
####################################################
get_env() {
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
}

####################################################
###
### Get mode
###
####################################################
get_mode() {
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
}

