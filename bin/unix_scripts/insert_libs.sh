#!/bin/bash
SCRIPT=$(readlink -f "$0")

################################# Directories
SCRIPTPATH=$(dirname "$SCRIPT") # /daphne/bin/unix_scripts
ROOTDIR=${SCRIPTPATH::-17}      # /daphne
LIBSDIR="${ROOTDIR}/build/libs" # /daphne/build/libs
CODEDIR="${ROOTDIR}/codebase"   # /daphne/codebase
#################################

################################################################ From
WEBPACKSETTINGS="${LIBSDIR}/webpack.dev.js"                    # /daphne/build/libs/webpack.dev.js
CLASSIFIERTRAIN="${LIBSDIR}/train.py"                          # /daphne/build/libs/train.py
################################################################

##################################################################### To
WEBPACKSETTINGSTO="${CODEDIR}/daphne-interface/webpack.dev.js"      # /daphne/codebase/daphne-interface/webpack.dev.js
CLASSIFIERTRAINTO="${CODEDIR}/command_classifier/train.py"          # /daphne/codebase/command_classifier/train.py
#####################################################################

# ----------> Insert
cp $WEBPACKSETTINGS $WEBPACKSETTINGSTO
cp $CLASSIFIERTRAIN $CLASSIFIERTRAINTO
