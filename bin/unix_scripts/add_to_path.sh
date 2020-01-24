#!/bin/bash
SCRIPT=$(readlink -f "$0")

SCRIPTPATH=$(dirname "$SCRIPT") # /daphne/bin/unix_scripts
BINDIR=${SCRIPTPATH::-13}       # /daphne/bin
ROOTDIR=${SCRIPTPATH::-17}      # /daphne
CODEDIR="${ROOTDIR}/daphne"     # /daphne/daphne

DAPHNE_EXECUTABLE="${BINDIR}/daphne"

# Ask user if they want their PATH variable set
echo "Do you wish to set daphne to your PATH env variable? (1 for yes : 2 for no)"
select yn in "Yes" "No"; do
    case $yn in
        Yes ) echo "yes"; break;;
        No )  exit;;
    esac
done

# Check if PATH already contains the appropriate directory
if [[ ":$PATH:" == *":${BINDIR}:"* ]]; then
  echo "${BINDIR} is already in PATH... doing nothing..."
  exit
fi

# Add to either .bash_profile or .bashrc
BASH_PROFILE_FILE="${HOME}/.bash_profile"
BASHRC_FILE="${HOME}/.bashrc"

if [ -f $BASH_PROFILE_FILE ]; then
   echo "File $BASH_PROFILE_FILE exists... Setting PATH there"
   echo "export PATH=\$PATH:${BINDIR}" >> ${BASH_PROFILE_FILE}
   source ${BASH_PROFILE_FILE}
   chmod +x "${DAPHNE_EXECUTABLE}"
   exit
else
  echo "${BASH_PROFILE_FILE}, does not exist.. Checking for ${BASHRC_FILE}"
  if [ -f $BASHRC_FILE ]; then
     echo "File $BASHRC_FILE exists... Setting PATH there"
     echo "export PATH=\$PATH:${BINDIR}" >> ${BASHRC_FILE}
     source ${BASHRC_FILE}
     chmod +x "${DAPHNE_EXECUTABLE}"
     exit
  else
      echo "Files .bashrc and .bash_profile couldn't be found... Can't install to PATH"
      exit
  fi
fi