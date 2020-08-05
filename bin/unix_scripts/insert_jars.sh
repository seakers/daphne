#!/bin/bash
SCRIPT=$(readlink -f "$0")

#################################
SCRIPTPATH=$(dirname "$SCRIPT") # /daphne/bin/unix_scripts
ROOTDIR=${SCRIPTPATH::-17}      # /daphne
JARSDIR="${ROOTDIR}/build/jars" # /daphne/build/jars
CODEDIR="${ROOTDIR}/codebase"   # /daphne/codebase
#################################

########################################## Jars
JESS="${JARSDIR}/jess.jar"               # /daphne/build/jars/jess.jar
##########################################

##################################### Target
JAVALIBS="${CODEDIR}/java_libs"     # /daphne/codebase/java_libs
#####################################


# ----------> Insert
cp "$JESS" "$JAVALIBS"
