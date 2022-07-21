#!/bin/bash

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
  for file in $ENV_DIR/.env $ENV_DIR/.env.$ENV $ENV_DIR/.env.$ENV.local $ENV_DIR/.env.local
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