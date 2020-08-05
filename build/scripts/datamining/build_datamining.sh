#!/bin/bash


# Stop datamining
bash /app/scripts/datamining/stop_datamining.sh


# Clear gradle caches
rm -rf $HOME/.gradle/caches/

# Clear maven local jars
rm -rf $HOME/.m2/repository/seakers/mopAOS

# BUILD: seakers/mopAOS
echo "-----> Building seakers/mopAOS"
cd /app/daphne/mopAOS
# mvn dependency:purge-local-repository
mvn install

# BUILD: datamining
cd /app/daphne/data-mining
./gradlew build





