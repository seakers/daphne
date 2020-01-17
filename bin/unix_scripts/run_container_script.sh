#!/bin/bash

SCRIPTPATH="/app/scripts/${1}"

if [ "$(docker ps -q -f name=daphne_server)" ]; then
    echo "Container is running... executing command"
    docker exec -u root daphne_server chmod +x $SCRIPTPATH
    docker exec -u root daphne_server $SCRIPTPATH
else
    echo "Container isn't running... exiting"
fi