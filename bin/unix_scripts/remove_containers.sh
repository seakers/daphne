#!/bin/bash
SCRIPT=$(readlink -f "$0")


#################################
SCRIPTPATH=$(dirname "$SCRIPT") # /daphne/bin/unix_scripts
BINDIR=${SCRIPTPATH::-13}       # /daphne/bin
ROOTDIR=${SCRIPTPATH::-17}      # /daphne
CODEDIR="${ROOTDIR}/daphne"     # /daphne/daphne
#################################

# ----------> Commit container changes
bash "${SCRIPTPATH}/commit_container_changes.sh"

# ----------> Remove containers
cd $ROOTDIR || exit
docker-compose down