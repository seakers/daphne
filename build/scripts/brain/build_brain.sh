#!/bin/bash

DAPHNEDIR="/app/daphne"
DAPHNEBRAIN="${DAPHNEDIR}/daphne_brain"
COMMANDCLASSIFIER="${DAPHNEDIR}/command_classifier"
HISTORICALDB="${DAPHNEDIR}/historical_db"
VASSARDB="${DAPHNEDIR}/VASSAR_resources"
DAPHNELOGDIR="${DAPHNEBRAIN}/logs"
DAPHNELOGFILE="${DAPHNELOGDIR}/daphne.log"


# Install Dependencies
pip3 install -r ${DAPHNEBRAIN}/requirements.txt
pip3 install -r ${COMMANDCLASSIFIER}/requirements.txt
pip3 install -r ${HISTORICALDB}/requirements.txt
pip3 install -r ${VASSARDB}/requirements.txt
python3 -m spacy download en_core_web_sm

# Creating log directory
cd ${DAPHNEBRAIN} || exit
if [ -d "$DAPHNELOGDIR" ]; then
    echo "Daphne log directory exists"
else
    mkdir logs
fi

# Creating log file
cd ${DAPHNEBRAIN} || exit
if test -f "$DAPHNELOGFILE"; then
    echo "Daphne logfile exists"
else
    touch ./logs/daphne.log
fi

supervisorctl start vassar

# Index historian database + train models
if [ "${1}" == "--all" ]; then
  # Index historical database
  chmod +x /app/scripts/brain/index_historian_database.sh
  bash /app/scripts/brain/index_historian_database.sh

  # Train models
  chmod +x /app/scripts/brain/update_command_models.sh
  bash /app/scripts/brain/update_command_models.sh
fi

# Run migrations
bash /app/scripts/brain/migrate_database.sh

if [ "${1}" == "--all" ]; then
  # Index VASSAR database
  python /app/daphne/VASSAR_resources/db_utility/index.py
fi
echo "%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%"
echo "Please go to http://localhost:6002, put 'daphne' as a password if asked, then click on the DATA tab on top, and press 'track all' for all tables and foreign-key relationships. When done, press <ENTER> here."
echo "%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%"
read -n 1

mkdir /run/daphne
