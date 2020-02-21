#!/bin/bash
supervisorctl stop datamining
kill $(lsof -t -i:9191)