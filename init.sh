#!/bin/bash
filename="repo_list.txt"

readarray -t lines < "$filename"

for line in "${lines[@]}"; do
    git clone $line
done

mkdir java_libs