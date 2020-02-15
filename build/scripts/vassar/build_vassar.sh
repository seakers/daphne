#!/bin/bash

# Stop VASSAR if running on supervisorctl
supervisorctl stop vassar

# Clear gradle build caches
rm -rf $HOME/.gradle/caches/

# Remove VASSAR_lib jars
rm -rf $HOME/.m2/repository/seakers/vassar

# Rebuild and publish VASSAR_lib
cd /app/daphne/VASSAR_lib || exit
gradle publishToMavenLocal

# Rebuild VASSAR_server
cd /app/daphne/VASSAR_server || exit
gradle build

# Start VASSAR with supervisorctl
supervisorctl start vassar
