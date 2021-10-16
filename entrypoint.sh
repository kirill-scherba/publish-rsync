#!/bin/sh -l

# echo "Hello $1"

echo -e "Get input parameters:\nserver-name: $1\nserver-folder: $2\nserver-user-name: $3\nsource-folder: $4\n"
echo -e "Preparing to execute publish commands: \ncd $4 && rsync --progress -e \"ssh -o StrictHostKeyChecking=no\" --recursive ./ $3@$1:$2 && cd ../"

time=$(date)
echo "::set-output name=time::$time"
