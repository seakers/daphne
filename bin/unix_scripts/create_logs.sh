#!/bin/bash

ROOTDIR=${1}               # /daphne
LOGDIR="${ROOTDIR}/logs"   # /daphne/logs


# Make if DNE: /daphne/logs
if [ -d "$LOGDIR" ]; then
    echo "Log directory exists, removing"
    rm -rf $LOGDIR
fi

echo "Creating log directory"
mkdir "$LOGDIR"