#!/bin/bash
supervisorctl stop interface
kill $(lsof -t -i:8080)