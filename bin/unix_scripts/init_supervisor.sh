#!/bin/bash

if [ "$(docker ps -q -f name=daphne_server)" ]; then
    echo "Container is running... installing"
    docker exec -u root daphne_server /app/scripts/init_supervisor.sh
else
    echo "Container isn't running... exiting"
fi