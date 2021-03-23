#!/bin/bash
SCRIPT=$(readlink -f "$0")


SCRIPTPATH=$(dirname "$SCRIPT") # /daphne/bin/unix_scripts
BINDIR=${SCRIPTPATH::-13}       # /daphne/bin
ROOTDIR=${SCRIPTPATH::-17}      # /daphne
CODEDIR="${ROOTDIR}/codebase"   # /daphne/codebase



# Repo Paths
VASSARSERVER="${CODEDIR}/VASSAR_server"
VASSARLIB="${CODEDIR}/VASSAR_lib"
SYSARCHPROBLEMS="${CODEDIR}/SystemArchitectureProblems"
OREKIT="${CODEDIR}/orekit"
VASSARRESOURCES="${CODEDIR}/VASSAR_resources"
DAPHNEBRAIN="${CODEDIR}/daphne_brain"
COMMANDCLASSIFIER="${CODEDIR}/command_classifier"
HISTORICALDB="${CODEDIR}/historical_db"
DATAMINING="${CODEDIR}/data-mining"
MOPAOS="${CODEDIR}/mopAOS"
DAPHNEINTERFACE="${CODEDIR}/daphne-interface"
JAVALIBS="${CODEDIR}/java_libs"


# ---------------------------------------------------- Git Check
git --version 2>&1 >/dev/null
GIT_IS_AVAILABLE=$?
if [ $GIT_IS_AVAILABLE -ne 0 ]; then
    echo "Git is not installed... exiting"
    exit
else
    echo "Git found..."
fi


# ---------------------------------------------------- Clone submodules
cd $ROOTDIR || exit
git submodule init
git submodule update --remote



# ---------------------------------------------------- Create /daphne/codebase/java_libs
if [ -d "$JAVALIBS" ]; then
    echo "java_libs exists"
else
    echo "java_libs not found... creating"
    mkdir "$JAVALIBS"
fi


