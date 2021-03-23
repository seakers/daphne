#!/bin/bash

DAPHNEDIR="/app/daphne"
JAVALIBS="/app/java_libs"

# Check for daphne directory
if [ -d "$DAPHNEDIR" ]; then
    echo "Daphne directory exists"
    cd "$DAPHNEDIR" || exit
else
    echo "Cannot build... /app/daphne does not exist"
    exit
fi

# ----------------------------------------------------------------------------------------------------------------> JESS
cd $JAVALIBS || exit
mvn install:install-file -Dfile=./jess.jar -DgroupId=gov.sandia -DartifactId=jess -Dversion=7.1p2 -Dpackaging=jar


# --------------------------------------------------------------------------------------------------------------> VASSAR
bash /app/scripts/vassar/build_vassar.sh


# ----------------------------------------------------------------------------------------------------------> DATAMINING
bash /app/scripts/datamining/build_datamining.sh


# -----------------------------------------------------------------------------------------------------------> INTERFACE
bash /app/scripts/interface/build_interface.sh


# ---------------------------------------------------------------------------------------------------------------> BRAIN
bash /app/scripts/brain/build_brain.sh --all








exit




















