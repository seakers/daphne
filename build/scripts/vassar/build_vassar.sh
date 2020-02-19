#!/bin/bash

# Stop VASSAR if running on supervisorctl
supervisorctl stop vassar

# Clear gradle caches
rm -rf $HOME/.gradle/caches/

# Clear maven local jars
rm -rf $HOME/.m2/repository/seakers/system-architecture-problems
rm -rf $HOME/.m2/repository/seakers/orekit
rm -rf $HOME/.m2/repository/seakers/vassar


# BUILD: seakers/system-architecture-problems
echo "-----> Building seakers/system-architecture-problems"
cd /app/daphne/SystemArchitectureProblems
mvn dependency:purge-local-repository
mvn install


# BUILD: seakers/orekit
echo "-----> Building seakers/orekit"
cd /app/daphne/orekit/orekit
mvn dependency:purge-local-repository
mvn install


# BUILD: seakers/vassar
echo "-----> Building seakers/vassar"
cd /app/daphne/VASSAR_lib
gradle publishToMavenLocal


# BUILD: VASSAR_server
echo "-----> Building VASSAR_server"
cd /app/daphne/VASSAR_server || exit
gradle build




# Start VASSAR with supervisorctl
supervisorctl start vassar
