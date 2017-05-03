#!/usr/bin/env bash

mkdir -p ~/.goo
mkdir -p ~/.goo/script

cp -f $(pwd)/goo.sh ~/.goo/goo.sh
cp -f $(pwd)/goo.json ~/.goo/goo.json
cp -f ./script/init.sample.sh ~/.goo/script/init.sh

ln -sf ~/.goo/goo.sh /usr/local/bin/goo

