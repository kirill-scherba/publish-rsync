#!/bin/sh -l

# Input parameters
#
#   INPUT_SERVER_NAME: $1
#   INPUT_SERVER_FOLDER: $2
#   INPUT_SERVER_USER_NAME: $3
#   INPUT_SOURCE_FOLDER: $4
#   INPUT_DEPLOYMENT_KEY: $5
#
#

set -e

# Show publish command
echo -e "\nPreparing to execute publish commands: \n" \
        "cd ${INPUT_SOURCE_FOLDER} &&" \
        "rsync --progress -e \"ssh -o StrictHostKeyChecking=no\" --recursive ./ " \
        "${INPUT_SERVER_USER_NAME}@${INPUT_SERVER_NAME}:${INPUT_SERVER_FOLDER} &&" \
        "cd ../"

# Set private SSH key
echo -e "\nSet deployment key"
mkdir -p /root/.ssh
echo "${INPUT_DEPLOYMENT_KEY}" >> "/root/.ssh/id_rsa" && \
    chmod 0700 "/root/.ssh" && \
    chmod 0600 "/root/.ssh/id_rsa"

# Change dir to source folder and execute rsync
cd ${INPUT_SOURCE_FOLDER}
echo -e "\nPublish folder content:"
ls -all
echo -e "\nRun rsync:"
rsync --progress -e "ssh -o StrictHostKeyChecking=no" --recursive ./ \
    ${INPUT_SERVER_USER_NAME}@${INPUT_SERVER_NAME}:${INPUT_SERVER_FOLDER}
cd ../ 
