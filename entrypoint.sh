#!/bin/sh -l

# Input parameters
#
#   server-name: $1
#   server-folder: $2
#   erver-user-name: $3
#   source-folder: $4
#
#

# Show input parameters
echo -e "\nGet input parameters:\nserver-name: $1\nserver-folder: $2\nserver-user-name: $3\nsource-folder: $4"

# Check named parameters
echo -e "\nParameter source-folder: '${INPUT_SOURCE-FOLDER}' or '${INPUT_SOURCE_FOLDER}'"

# Show and publish command
echo -e "\nPreparing to execute publish commands: \ncd $4 && rsync --progress -e \"ssh -o StrictHostKeyChecking=no\" --recursive ./ $3@$1:$2 && cd ../"

# Change dir to source folder
cd $4
echo -e "\nPublish folder content:"
ls -all
cd ../ 

time=$(date)
echo "::set-output name=time::$time"
