#!/bin/sh -l

# Input parameters
#
#   INPUT_SERVER_NAME: $1
#   INPUT_SERVER_FOLDER: $2
#   INPUT_SERVER_USER_NAME: $3
#   INPUT_SOURCE_FOLDER: $4
#
#

# Show input parameters (by $)
echo -e "\nGet input parameters:" \
    "\nserver_name(\$1): $1" \
    "\nserver_folder(\$2): $2" \
    "\nserver_user_name(\$3): $3" \
    "\nsource_foldere(\$4): $4"

# Check named parameters
echo -e "\nGet named input parameters:\n" \
    "\nParameter server_name: '${INPUT_SERVER_NAME}'" \
    "\nParameter server_folder: '${INPUT_SERVER_FOLDER}'" \
    "\nParameter server_user_name: '${INPUT_SERVER_USER_NAME}'" \
    "\nParameter source_folder: '${INPUT_SOURCE_FOLDER}'"

# Show and publish command
echo -e "\nPreparing to execute publish commands: \ncd ${INPUT_SOURCE_FOLDER} &&" \
        "rsync --progress -e \"ssh -o StrictHostKeyChecking=no\" --recursive ./ " \
        "${INPUT_SERVER_USER_NAME}@${INPUT_SERVER_NAME}:${INPUT_SERVER_FOLDER} &&" \
        "cd ../"

# Change dir to source folder
cd ${INPUT_SOURCE_FOLDER}
echo -e "\nPublish folder content:"
ls -all
cd ../ 

time=$(date)
echo "::set-output name=time::$time"
