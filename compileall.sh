#!/bin/bash

# Build everything in order of dependency

# VASSAR_server <- VASSAR_lib, SystemArchitectureProblems, orekit, Jess
# VASSAR_lib <- SystemArchitectureProblems, orekit, Jess
# orekit
# SystemArchitectureProblems

cd SystemArchitectureProblems
mvn install

cd ../
cd orekit/orekit
mvn install

cd ../../
cd VASSAR_lib
JAVA_LIBS=../java_libs gradle jar
cp build/libs/vassar-1.0.jar ../java_libs/vassar.jar