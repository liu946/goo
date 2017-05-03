#!/usr/bin/env bash

if [ -f ./goo.json ]; then
    echo 'goo.json already exist.'
    exit
fi
echo '{"command":{"test": "echo no testing script"}}' | jq --raw-output  '.' > goo.json

