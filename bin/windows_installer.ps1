$SCRIPTPATH=split-path -parent $MyInvocation.MyCommand.Definition # \daphne\bin


#############################################################
UNIXSCRIPTS= SCRIPTPATH & "\unix_scripts"                   # \daphne\bin\unix_scripts
ROOTDIR=${SCRIPTPATH::-4}                                   # \daphne
CODEDIR="${ROOTDIR}\daphne"                                 # \daphne\daphne
VASSARSERVER="${CODEDIR}\VASSAR_server"                     # \daphne\daphne\VASSAR_server
VASSARLIB="${CODEDIR}\VASSAR_lib"                           # \daphne\daphne\VASSAR_lib
SYSARCHPROBLEMS="${CODEDIR}\SystemArchitectureProblems"     # \daphne\daphne\SystemArchitectureProblems
OREKIT="${CODEDIR}\orekit"                                  # \daphne\daphne\orekit
VASSARRESOURCES="${CODEDIR}\VASSAR_resources"               # \daphne\daphne\VASSAR_resources
DAPHNEBRAIN="${CODEDIR}\daphne_brain"                       # \daphne\daphne\daphne_brain
COMMANDCLASSIFIER="${CODEDIR}\command_classifier"           # \daphne\daphne\command_classifier
HISTORICALDB="${CODEDIR}\historical_db"                     # \daphne\daphne\historical_db
DATAMINING="${CODEDIR}\data-mining"                         # \daphne\daphne\data-mining
DAPHNEINTERFACE="${CODEDIR}\daphne-interface"               # \daphne\daphne\daphne-interface
JAVALIBS="${CODEDIR}\java_libs"                             # \daphne\daphne\java_libs
#############################################################