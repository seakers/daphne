#!/bin/bash
SCRIPT=$(readlink -f "$0")

########################################### Directories
SCRIPTPATH=$(dirname "$SCRIPT")           # /daphne/bin/unix_scripts/migrations
ROOTDIR=${SCRIPTPATH::-28}                # /daphne
BUILDDIR="${ROOTDIR}/build"               # /daphne/build
LIBSDIR="${ROOTDIR}/build/libs"           # /daphne/build/libs
SCRIPSDIR="${ROOTDIR}/build/scripts"      # /daphne/build/scripts
CODEDIR="${ROOTDIR}/daphne"               # /daphne/daphne
UNIXSCRIPTS="${ROOTDIR}/bin/unix_scripts" # /daphne/bin/unix_scripts
###########################################

# --> Stop all services
bash "${UNIXSCRIPTS}/run_container_script.sh" "stop_services.sh"

# --> Copy the new supervisor file
docker cp "${BUILDDIR}/tools/supervisord.conf" daphne_server:/etc/supervisor

# --> Initialize the new supervisor file
bash "${UNIXSCRIPTS}/run_container_script.sh" "init_supervisor.sh"

echo "All services have been stopped... You will have to restart them"