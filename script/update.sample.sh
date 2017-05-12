#!/usr/bin/env bash

rm -rf ~/.goo
git clone https://github.com/liu946/goo.git goo
cd goo
./install.sh
cd ..
rm -rf goo
