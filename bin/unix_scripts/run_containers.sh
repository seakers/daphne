#!/bin/bash
SCRIPT=$(readlink -f "$0")


#################################
SCRIPTPATH=$(dirname "$SCRIPT") # /daphne/bin/unix_scripts
BINDIR=${SCRIPTPATH::-13}       # /daphne/bin
ROOTDIR=${SCRIPTPATH::-17}      # /daphne
CODEDIR="${ROOTDIR}/codebase"     # /daphne/daphne
#################################


# ----------> Run containers
cd $ROOTDIR || exit
docker-compose up -d