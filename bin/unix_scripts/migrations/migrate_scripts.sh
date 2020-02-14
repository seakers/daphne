#!/bin/bash
SCRIPT=$(readlink -f "$0")

###################################### Directories
SCRIPTPATH=$(dirname "$SCRIPT")      # /daphne/bin/unix_scripts
ROOTDIR=${SCRIPTPATH::-17}           # /daphne
LIBSDIR="${ROOTDIR}/build/libs"      # /daphne/build/libs
SCRIPSDIR="${ROOTDIR}/build/scripts" # /daphne/build/libs
CODEDIR="${ROOTDIR}/daphne"          # /daphne/daphne
######################################



docker cp "${SCRIPSDIR}/." daphne_server:/app/scripts