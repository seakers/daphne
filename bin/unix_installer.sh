#!/bin/bash
SCRIPT=$(readlink -f "$0")


#########################################################
SCRIPTPATH=$(dirname "$SCRIPT")                         # /daphne/bin
UNIXSCRIPTS="${SCRIPTPATH}/unix_scripts"                # /daphne/bin/unix_scripts
ROOTDIR=${SCRIPTPATH::-4}                               # /daphne
BUILDDIR="${ROOTDIR}/build"                             # /daphne/build
CODEDIR="${ROOTDIR}/codebase"                           # /daphne/codebase
VASSARSERVER="${CODEDIR}/VASSAR_server"                 # /daphne/codebase/VASSAR_server
VASSARLIB="${CODEDIR}/VASSAR_lib"                       # /daphne/codebase/VASSAR_lib
SYSARCHPROBLEMS="${CODEDIR}/SystemArchitectureProblems" # /daphne/codebase/SystemArchitectureProblems
OREKIT="${CODEDIR}/orekit"                              # /daphne/codebase/orekit
VASSARRESOURCES="${CODEDIR}/VASSAR_resources"           # /daphne/codebase/VASSAR_resources
DAPHNEBRAIN="${CODEDIR}/daphne_brain"                   # /daphne/codebase/daphne_brain
COMMANDCLASSIFIER="${CODEDIR}/command_classifier"       # /daphne/codebase/command_classifier
HISTORICALDB="${CODEDIR}/historical_db"                 # /daphne/codebase/historical_db
DATAMINING="${CODEDIR}/data-mining"                     # /daphne/codebase/data-mining
DAPHNEINTERFACE="${CODEDIR}/daphne-interface"           # /daphne/codebase/daphne-interface
JAVALIBS="${CODEDIR}/java_libs"                         # /daphne/codebase/java_libs
#########################################################



# ----------> Create logs
bash "${UNIXSCRIPTS}/create_dirs.sh" "${ROOTDIR}"

# ----------> Skip if updating
if [ "${1}" != "--update" ]; then 
    # ----------> Install repos
    bash "${UNIXSCRIPTS}/clone_repositories.sh"

    # ----------> Replace libs
    bash "${UNIXSCRIPTS}/insert_libs.sh"
fi

# ----------> Build images
bash "${UNIXSCRIPTS}/build_images.sh"

# ----------> Run containers
bash "${UNIXSCRIPTS}/run_containers.sh"

# ----------> Initialize supervisor
bash "${UNIXSCRIPTS}/run_container_script.sh" "init_supervisor.sh"

# ----------> Build daphne
bash "${UNIXSCRIPTS}/run_container_script.sh" "build_daphne.sh"

# ----------> Update Daphne docker image
bash "${UNIXSCRIPTS}/commit_container_changes.sh"

# ----------> Run services
bash "${UNIXSCRIPTS}/run_container_script.sh" "start_services.sh"

if [ "${1}" != "--update" ]; then 
    bash "${UNIXSCRIPTS}/aws_config.sh"
fi

bash "${UNIXSCRIPTS}/aws_queues.sh"

# ----------> Add daphne to PATH
if [ "${1}" != "--update" ]; then 
    bash "${UNIXSCRIPTS}/add_to_path.sh"
fi


























