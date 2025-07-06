#!/usr/bin/env bash
 
TF_ENV=$1 # staging, production, etc
TF_STATE=$2 # network, data, compute
 
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"
 
# Always run from the location of this script
cd $DIR
 
if [ $# -gt 0 ]; then
 
    if [ ! -d "envs/$TF_ENV/$TF_STATE" ]; then
        >&2 echo "Directory $DIR/envs/$TF_ENV/$TF_STATE" does not exist
        exit 1
    fi
 
    if [ "$3" == "init" ]; then
        terraform -chdir=./envs/$TF_ENV/$TF_STATE init \
          -backend-config="key=$TF_ENV/$TF_STATE.tfstate"
    else
        terraform -chdir=./envs/$TF_ENV/$TF_STATE $3
    fi
fi
cd -