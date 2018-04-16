#!/usr/bin/env bash

# check if jq is installed

jq --version > /dev/null
if [[ $? != 0 ]]; then
	echo "[ERROR] jq is required. you can run \`sudo apt-get install jq\` to fix this."
	exit 1
fi

# install goo

mkdir -p ~/.goo
mkdir -p ~/.goo/script

cp -f $(pwd)/goo.sh ~/.goo/goo.sh
cp -f $(pwd)/goo.json ~/.goo/goo.json
cp -f ./script/init.sample.sh ~/.goo/script/init.sh
cp -f ./script/update.sample.sh ~/.goo/script/update.sh

ln -sf ~/.goo/goo.sh /usr/local/bin/goo

