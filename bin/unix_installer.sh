#!/bin/bash
SCRIPT=$(readlink -f "$0")


#########################################################
SCRIPTPATH=$(dirname "$SCRIPT")                         # /daphne/bin
UNIXSCRIPTS="${SCRIPTPATH}/unix_scripts"                # /daphne/bin/unix_scripts
ROOTDIR=${SCRIPTPATH::-4}                               # /daphne
BUILDDIR="${ROOTDIR}/build"                             # /daphne/build
CODEDIR="${ROOTDIR}/daphne"                             # /daphne/daphne
VASSARSERVER="${CODEDIR}/VASSAR_server"                 # /daphne/daphne/VASSAR_server
VASSARLIB="${CODEDIR}/VASSAR_lib"                       # /daphne/daphne/VASSAR_lib
SYSARCHPROBLEMS="${CODEDIR}/SystemArchitectureProblems" # /daphne/daphne/SystemArchitectureProblems
OREKIT="${CODEDIR}/orekit"                              # /daphne/daphne/orekit
VASSARRESOURCES="${CODEDIR}/VASSAR_resources"           # /daphne/daphne/VASSAR_resources
DAPHNEBRAIN="${CODEDIR}/daphne_brain"                   # /daphne/daphne/daphne_brain
COMMANDCLASSIFIER="${CODEDIR}/command_classifier"       # /daphne/daphne/command_classifier
HISTORICALDB="${CODEDIR}/historical_db"                 # /daphne/daphne/historical_db
DATAMINING="${CODEDIR}/data-mining"                     # /daphne/daphne/data-mining
DAPHNEINTERFACE="${CODEDIR}/daphne-interface"           # /daphne/daphne/daphne-interface
JAVALIBS="${CODEDIR}/java_libs"                         # /daphne/daphne/java_libs
#########################################################



# ----------> Create logs
bash "${UNIXSCRIPTS}/create_logs.sh" "${ROOTDIR}"

# ----------> Download tools
bash "${UNIXSCRIPTS}/download_tools.sh"

# ----------> Install repos
bash "${UNIXSCRIPTS}/clone_repositories.sh"

# ----------> Replace libs
bash "${UNIXSCRIPTS}/insert_libs.sh"

# ----------> Replace jars
bash "${UNIXSCRIPTS}/insert_jars.sh"

# ----------> Build containers
bash "${UNIXSCRIPTS}/build_containers.sh"

# ----------> Run containers
bash "${UNIXSCRIPTS}/run_containers.sh"

# ----------> Initialize supervisor
bash "${UNIXSCRIPTS}/run_container_script.sh" "init_supervisor.sh"

# ----------> Build daphne
bash "${UNIXSCRIPTS}/run_container_script.sh" "build_daphne.sh"

# ----------> Run services
bash "${UNIXSCRIPTS}/run_container_script.sh" "start_services.sh"

























