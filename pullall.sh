#!/bin/bash

shopt -u dotglob
find * -prune -type d | while IFS= read -r d; do
    echo "Pulling new updates for $d"
    cd $d
    git pull
    cd ..
done