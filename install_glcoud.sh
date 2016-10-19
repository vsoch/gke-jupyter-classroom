#!/bin/sh

# This script will install the Google Cloud sdk (gcloud) for Ubuntu 16.04
# Complete instructions for Linux are at: https://cloud.google.com/sdk/docs/quickstart-linux
#
#
# Usage:
#
# ./install_gcloud.sh /path/to/install
#
# Arguments:
#
# First (and only) input is the (existing) path to an install location
#
# -------------------------------------------------------------------------


# We MUST be using python 2.7
python_version=`python -c 'import sys; print(sys.version_info[0])'`
if [ $python_version != "2" ]; then
   echo "Please have python 2.x on the path to run this install."
   exit 1
fi

# The user naeds to input an install directory
if [ -z "$1" ]
  then
    echo "Please give an install path as the first input!"
fi

# Do install in user specified directory
INSTALL_DIR=$1

# Remember where we started
CURR_DIR=$PWD
mkdir $INSTALL_DIR
cd $INSTALL_DIR

echo "Downloading tarbar..."
wget https://dl.google.com/dl/cloudsdk/channels/rapid/downloads/google-cloud-sdk-131.0.0-linux-x86_64.tar.gz
tar -xzvf google-cloud-sdk-131.0.0-linux-x86_64.tar.gz
./google-cloud-sdk/install.sh

# Activate SDK!
source ~/.bashrc
gcloud init

# Clean up
rm google-cloud-sdk-131.0.0-linux-x86_64.tar.gz
cd $CURR_DIR
