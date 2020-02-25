#!/bin/bash

DAPHNEDIR="/app/daphne"
DAPHNEBRAIN="${DAPHNEDIR}/daphne_brain"
COMMANDCLASSIFIER="${DAPHNEDIR}/command_classifier"
HISTORICALDB="${DAPHNEDIR}/historical_db"
DAPHNELOGDIR="${DAPHNEBRAIN}/logs"
DAPHNELOGFILE="${DAPHNELOGDIR}/daphne.log"


# Install Dependencies
pip3 install -r ${DAPHNEBRAIN}/requirements.txt
pip3 install -r ${COMMANDCLASSIFIER}/requirements.txt
pip3 install -r ${HISTORICALDB}/requirements.txt
python3 -m spacy download en

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





















