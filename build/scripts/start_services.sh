#!/bin/bash
supervisorctl start vassar
supervisorctl start datamining
supervisorctl start brain
supervisorctl start interface
supervisorctl start hasura-auth