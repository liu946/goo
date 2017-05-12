#!/usr/bin/env bash

if [ -f ./goo.json ]; then
    echo 'goo.json already exist.'
    exit
fi
dir=$(pwd)
dir=${dir##*/}
read -p "Enter project name($dir):" project_name
if [[ ${project_name}x == ''x ]]; then
	project_name=${dir}
fi

if [[ ! -d ./script ]]; then
    mkdir script
fi

echo '{"name":"'$project_name'", "command":{"test": "echo no testing script"}}' | jq --raw-output  '.' > goo.json
