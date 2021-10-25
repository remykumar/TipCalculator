#!/bin/bash

# Build script for building the TipCalculator python code in a virtual environment
# Author : Remy Kumar Arumugham
# Date : 24-Oct 2021

# Read me
# Run using your own user account (not root) from your home directory. 
# A small program to calculate the tip amount at varying percentages
# Usage : python3 tip_calculator.py 200 20

BUILD_DIRECTORY=/tmp/temp_build_directory
SRC_DIRECTORY=${HOME}/TipCalculator
DEPLOY_DIRECTORY=$HOME/DEPLOY-$(date '+%Y%m%d')

echo -e "\nChecking if running as the current user..\n"
sleep 3
if [ $USER = root ]; then
 echo -e "!!!!Running with root user; existing script. Please run with your normal user account!!!!\n"
 exit
else
 echo -e "Switching to $SRC_DIRECTORY directory if not already in it - $SRC_DIRECTORY\n"
 sleep 2
 cd $SRC_DIRECTORY
fi

# Starting the Build process
echo -e "\nSTARTING BUILD PROCESS FOR REFERENCE SOFTWARE..\n"
sleep 2

# Remove all the previously used old directories
echo -e "REMOVING OLD BUILD AND DEPLOY DIRECTORIES..\n"
rm -rf ${BUILD_DIRECTORY}
rm -rf ${DEPLOY_DIRECTORY}

# Make the directories
echo -e "CREATING NEW BUILD AND DEPLOY DIRECTORIES..\n"
mkdir ${BUILD_DIRECTORY}
mkdir ${DEPLOY_DIRECTORY}

# Changing to Build directory
echo -e "CHANGING WORK/CURRENT DIRECTORY TO BUILD DIRECTORY..\n"
cd ${BUILD_DIRECTORY}

# Get the code from the Source directory and move to temp Build directory
cp -r ${SRC_DIRECTORY}/* ${BUILD_DIRECTORY}
cd ${BUILD_DIRECTORY}

echo -e "RUNNING THE BUILD NOW..\n"
sleep 2

echo -e "Taking care of pre-requistives.INSTALLING LINUX PACKAGES..\n"
sudo apt-get update -y
sudo apt-get install -y python3
sudo apt-get install -y python3-venv
sudo apt-get install -y python3-pip

echo -e "\nCREATING PYTHON VIRTUAL ENVIRONMENT & INSTALLING REQUIREMENTS..\n"
python3 -m venv venv
. venv/bin/activate
venv/bin/pip3 install -r requirements.txt

echo -e "\nDEPLOY COMPLETE AND RUNNING THE TIP CALCULATOR CODE..\n"
echo -e "\nScript usage : python3 tip_calculator.py [Bill Total] [Tip percent] , eg. : python3 tip_calculator.py 200 20\n"
sleep 3
venv/bin/python3 tip_calculator.py 200 20

echo -e "CLEANING UP..\n"
deactivate
rm -rf venv/__pycache__
rm -rf venv
rm -rf __pycache__
cp -r ${BUILD_DIRECTORY}/* ${DEPLOY_DIRECTORY}
echo -e "\n Uploading Deployment artifacts to AWS S3..\n"
sleep 2 
aws s3 cp ~/DEPLOY-$(date '+%Y%m%d') s3://uchicago-module5-assignment/DEPLOY-$(date '+%Y%m%d') --recursive
rm -rf ${BUILD_DIRECTORY}

echo -e "END OF DEPLOYMENT!!\n"

echo -e "DEPLOYMENT ARTIFACTS CAN BE FOUND HERE - ${DEPLOY_DIRECTORY}\n"
