#!/bin/bash


# Stop datamining
bash /app/scripts/datamining/stop_datamining.sh


# Clear gradle caches
rm -rf $HOME/.gradle/caches/

# Clear maven local jars
rm -rf $HOME/.m2/repository/seakers/mopAOS
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


# BUILD: seakers/mopAOS
echo "-----> Building seakers/mopAOS"
cd /app/daphne/mopAOS
# mvn dependency:purge-local-repository
mvn install


# BUILD: seakers/vassar
echo "-----> Building seakers/vassar"
cd /app/daphne/VASSAR_lib
./gradlew publishToMavenLocal


# BUILD: datamining
cd /app/daphne/data-mining
./gradlew build





