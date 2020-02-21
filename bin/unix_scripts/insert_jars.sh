#!/bin/bash
SCRIPT=$(readlink -f "$0")


#################################
SCRIPTPATH=$(dirname "$SCRIPT") # /daphne/bin/unix_scripts
ROOTDIR=${SCRIPTPATH::-17}       # /daphne
JARSDIR="${ROOTDIR}/build/jars" # /daphne/build/jars
CODEDIR="${ROOTDIR}/daphne"     # /daphne/daphne
#################################



########################################## Jars
JESS="${JARSDIR}/jess.jar"               # /daphne/build/jars/jess.jar
##########################################


##################################### Target
JAVALIBS="${CODEDIR}/java_libs"     # /daphne/daphne/java_libs
#####################################


# ----------> Insert
cp "$JESS" "$JAVALIBS"
