#!/bin/bash
SCRIPT=$(readlink -f "$0")

###################################### Directories
SCRIPTPATH=$(dirname "$SCRIPT")      # /daphne/bin/unix_scripts/migrations
ROOTDIR=${SCRIPTPATH::-28}           # /daphne
BUILDDIR="${ROOTDIR}/build"          # /daphne/build
LIBSDIR="${ROOTDIR}/build/libs"      # /daphne/build/libs
SCRIPSDIR="${ROOTDIR}/build/scripts" # /daphne/build/scripts
CODEDIR="${ROOTDIR}/codebase"          # /daphne/daphne
######################################


docker cp "${SCRIPSDIR}/." daphne_server:/app/scripts