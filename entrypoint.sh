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

# Show input parameters (by $)
echo -e "\nGet input parameters:" \
    "\nserver_name(\$1): $1" \
    "\nserver_folder(\$2): $2" \
    "\nserver_user_name(\$3): $3" \
    "\nsource_foldere(\$4): $4" \
    "\ndeployment_key(\$5): $5"

# Check named parameters
echo -e "\nGet named input parameters:\n" \
    "\nParameter server_name: '${INPUT_SERVER_NAME}'" \
    "\nParameter server_folder: '${INPUT_SERVER_FOLDER}'" \
    "\nParameter server_user_name: '${INPUT_SERVER_USER_NAME}'" \
    "\nParameter source_folder: '${INPUT_SOURCE_FOLDER}'" \
    "\nParameter deployment_key: '${INPUT_DEPLOYMENT_KEY}'"

# Show publish command
echo -e "\nPreparing to execute publish commands: \ncd ${INPUT_SOURCE_FOLDER} &&" \
        "rsync --progress -e \"ssh -o StrictHostKeyChecking=no\" --recursive ./ " \
        "${INPUT_SERVER_USER_NAME}@${INPUT_SERVER_NAME}:${INPUT_SERVER_FOLDER} &&" \
        "cd ../"

# Set private SSH key
# echo "${INPUT_DEPLOYMENT_KEY}" | base64 -d >> "/root/.ssh/id_rsa" && \
echo -e "\nSet deployment key:"
mkdir -p /root/.ssh
echo "${INPUT_DEPLOYMENT_KEY}" >> "/root/.ssh/id_rsa" && \
    chmod 0700 "/root/.ssh" && \
    chmod 0600 "/root/.ssh/id_rsa"
cat /root/.ssh/id_rsa

# Change dir to source folder
cd ${INPUT_SOURCE_FOLDER}
echo -e "\nPublish folder content:"
ls -all
cd ../ 

time=$(date)
echo "::set-output name=time::$time"
