#!/bin/bash
SCRIPT=$(readlink -f "$0")


#################################
SCRIPTPATH=$(dirname "$SCRIPT") # /daphne/bin/unix_scripts
BINDIR=${SCRIPTPATH::-13}       # /daphne/bin
ROOTDIR=${SCRIPTPATH::-17}      # /daphne
CODEDIR="${ROOTDIR}/codebase"     # /daphne/daphne
#################################

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
DAPHNEINTERFACE="${CODEDIR}/daphne-interface"
JAVALIBS="${CODEDIR}/java_libs"

# ----------------------------------------------------- Main Repo Check
if [ -d "$CODEDIR" ]; then
    echo "Daphne directory exists"
    cd "$CODEDIR" || exit
else
    echo "Creating daphne directory"
    mkdir "$CODEDIR"
    cd "$CODEDIR" || exit
fi


for i in $(find . -name ".git" | cut -c 3-); do
    echo "";
    echo $i;

    # We have to go to the .git parent directory to call the pull command
    cd "${CODEDIR}/$i" || exit;
    cd .. || exit;

    # finally pull
    git pull origin master;
done



cd "${VASSARLIB}" || exit
git checkout working_patch

cd "${VASSARSERVER}" || exit
git checkout working_patch

exit












