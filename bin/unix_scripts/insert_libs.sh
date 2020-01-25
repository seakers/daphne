#!/bin/bash
SCRIPT=$(readlink -f "$0")

################################# Directories
SCRIPTPATH=$(dirname "$SCRIPT") # /daphne/bin/unix_scripts
ROOTDIR=${SCRIPTPATH::-17}      # /daphne
LIBSDIR="${ROOTDIR}/build/libs" # /daphne/build/libs
CODEDIR="${ROOTDIR}/daphne"     # /daphne/daphne
#################################



################################################################ From
BRAINCONF="${LIBSDIR}/daphne.conf"                             # /daphne/build/libs/daphne.conf
BRAINSETTINGS="${LIBSDIR}/settings_brain.py"                   # /daphne/build/libs/settings_brain.py
CLASSIFIERSETTINGS="${LIBSDIR}/settings_command_classifier.py" # /daphne/build/libs/settings_command_classifier.py
HISTORICALSETTINGS="${LIBSDIR}/settings_historical_db.py"      # /daphne/build/libs/settings_historical_db.py
WEBPACKSETTINGS="${LIBSDIR}/webpack.dev.js"                    # /daphne/build/libs/webpack.dev.js
CLASSIFIERTRAIN="${LIBSDIR}/train.py"                          # /daphne/build/libs/train.py
################################################################



##################################################################### To
BRAINCONFTO="${CODEDIR}/daphne_brain/config/daphne.conf"            # /daphne/daphne/daphne_brain/daphne_brain/settings.py
BRAINSETTINGSTO="${CODEDIR}/daphne_brain/daphne_brain/settings.py"  # /daphne/daphne/daphne_brain/daphne_brain/settings.py
CLASSIFIERSETTINGSTO="${CODEDIR}/command_classifier/settings.py"    # /daphne/daphne/command_classifier/settings.py
HISTORICALSETTINGSTO="${CODEDIR}/historical_db/scraper/settings.py" # /daphne/daphne/historical_db/scraper/settings.py
WEBPACKSETTINGSTO="${CODEDIR}/daphne-interface/webpack.dev.js"      # /daphne/daphne/daphne-interface/webpack.dev.js
CLASSIFIERTRAINTO="${CODEDIR}/command_classifier/train.py"          # /daphne/daphne/command_classifier/train.py
#####################################################################

# ----------> Insert
# cp $BRAINCONF $BRAINCONFTO
# cp $BRAINSETTINGS $BRAINSETTINGSTO
cp $CLASSIFIERSETTINGS $CLASSIFIERSETTINGSTO
cp $HISTORICALSETTINGS $HISTORICALSETTINGSTO
cp $WEBPACKSETTINGS $WEBPACKSETTINGSTO
cp $CLASSIFIERTRAIN $CLASSIFIERTRAINTO
