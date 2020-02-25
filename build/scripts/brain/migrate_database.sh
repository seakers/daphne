#!/bin/bash

cd /app/daphne/daphne_brain || exit
python3 manage.py makemigrations
python3 manage.py migrate