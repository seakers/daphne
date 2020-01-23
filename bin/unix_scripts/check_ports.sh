#!/bin/bash

# Array of ports to check
declare -a ports=("8080", "5432", "6379", "5671", "5672", "15672")



# Loop over and check if ports are open

echo "You will be prompted for your password to check port avaliability"
for i in "${ports[@]}"
do
  echo "$i"

  if sudo lsof -Pi :"$i" -sTCP:LISTEN ; then
    echo "Port ${i} in use, please free this port before installation"
    exit
  else
    echo "Port ${i} is free"
  fi
done