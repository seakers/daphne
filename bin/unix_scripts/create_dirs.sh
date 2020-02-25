#!/bin/bash

ROOTDIR=${1}                             # /daphne
LOGDIR="${ROOTDIR}/logs"                 # /daphne/logs
ENVFILE="${ROOTDIR}/.env"                # /daphne/.env


DATABASES_DIR="${ROOTDIR}/databases"     # /daphne/databases
POSTGRES_DIR="${DATABASES_DIR}/postgres" # /daphne/databases/postgres


# Make if DNE: /daphne/logs
if [ -d "$LOGDIR" ]; then
    echo "Log directory exists..."
    echo "Trying recursively remove log directory..."
    echo "Your password is required to run this next command: sudo rm -rf ${LOGDIR}"
    sudo rm -rf $LOGDIR
fi

echo "Creating log directory"
mkdir "$LOGDIR"

# Make a new .env file
if [ -f $ENVFILE ]; then
   echo "File $ENVFILE exists."
else
    echo "File $ENVFILE does not exist. Creating one..."
    cd ${ROOTDIR} || exit
    touch "${ENVFILE}"
    echo "ROOT_DIR=${ROOTDIR}" > "${ENVFILE}"
fi

## Database directory
#if [ -d "$DATABASES_DIR" ]; then
#  echo "Database directory exists..."
#else
#  echo "Creating database directory"
#  mkdir "$DATABASES_DIR"
#fi
#
## Postgres directory
#if [ -d "$POSTGRES_DIR" ]; then
#  echo "Postgres directory exists..."
#else
#  echo "Creating postgres directory"
#  mkdir "$POSTGRES_DIR"
#fi
