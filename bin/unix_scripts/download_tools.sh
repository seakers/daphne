#!/bin/bash
SCRIPT=$(readlink -f "$0")

# -----> Directories and files
SCRIPTPATH=$(dirname "$SCRIPT")                                    # /daphne/bin/unix_scripts
BINDIR=${SCRIPTPATH::-13}                                          # /daphne/bin
ROOTDIR=${SCRIPTPATH::-17}                                         # /daphne
BUILDDIR="${ROOTDIR}/build"                                        # /daphne/build
TOOLSDIR="${BUILDDIR}/tools"                                       # /daphne/build/tools
JDKDOWNLOADPATH="${TOOLSDIR}/openjdk-12+32_linux-x64_bin.tar.gz"   # /daphne/build/tools/openjdk-12+32_linux-x64_bin.tar.gz
JDKMVPATH="${TOOLSDIR}/openjdk-12_linux-x64_bin.tar.gz"            # /daphne/build/tools/openjdk-12_linux-x64_bin.tar.gz


# -----> Check if files exist
if test -f "$JDKPATH"; then
    echo "$JDKPATH exist"
else
    echo "Downloading JDK 12"
    cd ${TOOLSDIR}
    wget https://download.java.net/openjdk/jdk12/ri/openjdk-12+32_linux-x64_bin.tar.gz
    mv "${JDKDOWNLOADPATH}" "${JDKMVPATH}"
fi











