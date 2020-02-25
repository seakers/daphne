#!/bin/bash
SCRIPT=$(readlink -f "$0")

SCRIPTPATH=$(dirname "$SCRIPT") # /daphne/bin/unix_scripts
BINDIR=${SCRIPTPATH::-13}       # /daphne/bin
ROOTDIR=${SCRIPTPATH::-17}      # /daphne
CODEDIR="${ROOTDIR}/daphne"     # /daphne/daphne

docker rmi daphne:test
docker rmi postgres:latest
docker rmi redis:latest
docker rmi rabbitmq:3-management
