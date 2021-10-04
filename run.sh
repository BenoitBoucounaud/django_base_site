#!/bin/bash

function nicecho {
        # https://stackoverflow.com/questions/5947742/how-to-change-the-output-color-of-echo-in-linux
        LB='\033[1;34m' # Light Blue
        LP='\033[1;35m' # Light Purple
        LC='\033[1;36m' # Light Cyan
        ER='\033[0;33m' # Brown/Orange
        NC='\033[0m' # No Color
        case $1 in
                strong)
                        printf "\033[1;36m%s\033[0m\n" "$2" # Light Cyan
                        ;;
                blue)
                        printf "\033[1;34m%s\033[0m\n" "$2" # Light Blue
                        ;;
                error)
                        printf "\033[0;33m%s\033[0m\n" "$2" # Brown/Orange
                        ;;
                normal|*)
                        printf "\033[1;35m%s\033[0m\n" "$2" # Light Purple
                        ;;
        esac
}


function error_stop {
        nicecho "error" " <!> Error, stopping scripts <!>"
        exit 1
}

function usage {
        echo "Usage: $0 <ACTION>"
        echo "Parameters :"
        echo " - ACTION values :"
        echo "   * run_venv                            - Launching virtual environment."
}

function init {
    nicecho "error" "** To init the project you need to type 'source ./run.sh init' **"
    nicecho "strong" "** Initialise venv **"
    python3 -m venv .venv
    nicecho "strong" "** Install Python **"
    git clone https://github.com/django/django.git
    nicecho "strong" "** Make Django's code importbale **"
    . .venv/bin/activate
    python -m pip install -e django/
    deactivate
    nicecho "strong" "** Project initialised **"
}

function run_venv {
    nicecho "error" "** To run venv you need to type 'source ./run.sh run_venv' **"
    nicecho "strong" "** Running venv **"
    nicecho "noraml" "** Type deactivate to close venv **"
    . .venv/bin/activate
}

function run_server {
    nicecho "strong" "** Running server **"
    python ./base_site/manage.py runserver
}

# Checking parameters
if [[ "$1" == "" ]]; then
   echo "Missing arguments."
   usage
   exit 1
fi

case "$1" in
    init)
        init
        ;;
    run_venv)
        run_venv
        ;;      
    run_server)
        run_server
        ;;        
    *)
        echo "Unvalid environment detected (${1})"
        usage
        exit 1
        ;;
esac
