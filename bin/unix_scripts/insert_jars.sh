#!/bin/bash
SCRIPT=$(readlink -f "$0")


#################################
SCRIPTPATH=$(dirname "$SCRIPT") # /daphne/bin/unix_scripts
ROOTDIR=${SCRIPTPATH::-17}       # /daphne
JARSDIR="${ROOTDIR}/build/jars" # /daphne/build/jars
CODEDIR="${ROOTDIR}/daphne"     # /daphne/daphne
#################################



########################################## From
JESS="${JARSDIR}/jess.jar"               # /daphne/build/jars/jess.jar
IFEED="${JARSDIR}/ifeed-data-mining.jar" # /daphne/build/jars/ifeed-data-mining.jar
##########################################


##################################### To
JAVALIBS="${CODEDIR}/java_libs"     # /daphne/daphne/java_libs
DATAMINING="${CODEDIR}/data-mining" # /daphne/daphne/data-mining
#####################################


# ----------> Insert
cp "$JESS" "$JAVALIBS"
cp "$IFEED" "$DATAMINING"
