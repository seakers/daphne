#!/bin/bash

DAPHNEDIR="/app/daphne"
JAVALIBS="/app/daphne/java_libs"
SYSARCHPROBLEMS="/app/daphne/SystemArchitectureProblems"
OREKIT="/app/daphne/orekit/orekit"
VASSARLIB="/app/daphne/VASSAR_lib"
DAPHNEINTERFACE="/app/daphne/daphne-interface"
DAPHNEBRAIN="/app/daphne/daphne_brain"
COMMANDCLASSIFIER="/app/daphne/command_classifier"
HISTORICALDB="/app/daphne/historical_db"

# Check for daphne directory
if [ -d "$DAPHNEDIR" ]; then
    echo "Daphne directory exists"
    cd "$DAPHNEDIR" || exit
else
    echo "Cannot build... /app/daphne does not exist"
    exit
fi


# Perform Installation
cd $JAVALIBS || exit
mvn install:install-file -Dfile=./jess.jar -DgroupId=gov.sandia -DartifactId=jess -Dversion=7.1p2 -Dpackaging=jar
cd ../SystemArchitectureProblems || exit
mvn install
cd ../orekit/orekit || exit
mvn install
cd ../../VASSAR_lib || exit
JAVA_LIBS=../java_libs gradle jar
cp build/libs/vassar-1.0.jar ../java_libs/vassar.jar
gradle publishToMavenLocal
cd ../daphne-interface || exit
npm install
cd ..
pip3 install -r ./daphne_brain/requirements.txt
pip3 install -r ./command_classifier/requirements.txt
pip3 install -r ./historical_db/requirements.txt
python3 -m spacy download en
supervisorctl start vassar
cd historical_db || exit
scrapy crawl ceosdb_scraper
cd ../command_classifier || exit
python3 question_generator.py
python3 train.py
cp -r ./models ../daphne_brain/dialogue
cd ../daphne_brain || exit
mkdir logs
touch ./logs/daphne.log
python3 manage.py makemigrations
python3 manage.py migrate
supervisorctl stop vassar