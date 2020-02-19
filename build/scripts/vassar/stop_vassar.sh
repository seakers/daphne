#!/bin/bash
supervisorctl stop vassar
kill $(lsof -t -i:9090)




