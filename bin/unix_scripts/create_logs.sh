#!/bin/bash

ROOTDIR=${1}                # /daphne
LOGDIR="${ROOTDIR}/logs"    # /daphne/logs
ENVFILE="${ROOTDIR}/.env"   # /daphne/.env


# Make if DNE: /daphne/logs
if [ -d "$LOGDIR" ]; then
    echo "Log directory exists..."
    echo "Trying recursively remove directory: ${LOGDIR}, type in password if ok. Kill installer if not, no damage will be done"
    sudo rm -rf $LOGDIR
fi

echo "Creating log directory"
mkdir "$LOGDIR"



# Make a new .env file
if [ -f $ENVFILE ]; then
   echo "File $ENVFILE exists."
   exit
else
    echo "File $ENVFILE does not exist. Creating one..."
    cd ${ROOTDIR} || exit
    touch "${ENVFILE}"
    echo "ROOT_DIR=${ROOTDIR}" > ./.env
fi



