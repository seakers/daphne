#!/bin/bash

echo "Comitting container changes..."
docker commit daphne_server daphne:test
docker rmi $(docker images -f "dangling=true" -q)

