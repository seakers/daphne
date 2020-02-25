#!/bin/bash
SCRIPT=$(readlink -f "$0")


#################################
SCRIPTPATH=$(dirname "$SCRIPT") # /daphne/bin/unix_scripts
BINDIR=${SCRIPTPATH::-13}       # /daphne/bin
ROOTDIR=${SCRIPTPATH::-17}      # /daphne
CODEDIR="${ROOTDIR}/daphne"     # /daphne/daphne
#################################


echo "Clearing coverage database..."
echo "Please enter your password to run command: sudo rm -rf ${CODEDIR}/VASSAR_resources/orekit/CoverageDatabase"

sudo rm -rf "${CODEDIR}/VASSAR_resources/orekit/CoverageDatabase"