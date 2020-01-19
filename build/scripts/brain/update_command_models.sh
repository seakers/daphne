#!/bin/bash

# This only retrains the model
# It does not run the historical database

# ----------> Ensure correct directories exist
if [ -d "/app/daphne/command_classifier" ]; then
    cd /app/daphne/command_classifier
else
    echo "Path /app/daphne/command_classifier does not exist"
    exit
fi

# ----------> Start vassar
supervisorctl start vassar

# ----------> Generate questions
if python3 question_generator.py; then
    echo "Success executing: question_generator.py"
else
    echo "Failure executing: question_generator.py"
    exit
fi

# ----------> Train the model
if python3 train.py; then
    echo "Success executing: train.py"
else
    echo "Failure executing: train.py"
    exit
fi

# ----------> Move the model directory to brain
if [ -d "/app/daphne/daphne_brain/dialogue/models" ]; then
    echo "Moving models"
    rm -rf /app/daphne/daphne_brain/dialogue/models
    mv ./models ../daphne_brain/dialogue
else
    echo "Path /app/daphne/daphne_brain/dialogue/models does not exist"
    mv ./models ../daphne_brain/dialogue
fi


# ----------> Stop vassar
supervisorctl stop vassar

exit