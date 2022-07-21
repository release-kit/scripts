#!/bin/bash

FINAL_ENV_DIR="${ENV_DIR:-.}"

########################################
## Save current environment variables ##
########################################

export -p > .cde-saved-env

################################
## Load environment variables ##
################################

set -o allexport

# Run twice to expand variables in higher-priority env files
for i in 1 2
do
  for file in $FINAL_ENV_DIR/.env $FINAL_ENV_DIR/.env.$ENV $FINAL_ENV_DIR/.env.$ENV.local $FINAL_ENV_DIR/.env.local
  do
    if [[ -f $file ]]; then
      source $file
    fi
  done
done

set +o allexport

#################################################
##    Restore saved environment variables      ##
## Globally defined envs should be #1 priority ##
#################################################

source .cde-saved-env
rm .cde-saved-env