#!/usr/bin/env bash

# Varible Passed
# 1. PROJECT_ROOT `real path of the folder contains goo.json`
# 2. CALL_PATH `the path where goo <cmd> is called`
#

CALL_PATH=$(pwd)
# 1. check run global cmd
if [ ! -f ~/.goo/goo.json ]; then
	echo 'no goo installed on this computer.'
	exit
fi

if [ -f ~/.goo/script/$1.sh ]; then
	source ~/.goo/script/$1.sh
	exit
fi

# 2.
#
# check project root (with goo.json)
#

now_dir=$(pwd)
while [ ! -f './goo.json' ]; do
    cd ..
    now_dir=$(pwd)
    if [ ${now_dir} == '/' ]; then
        echo '[error] not in a goo project'
        exit
    fi
done
PROJECT_ROOT=$(pwd)
PROJECT_NAME=$(cat goo.json | jq --raw-output '.name')

# 2.
#
# read goo.json
#

# make sure at goo root before usage
function print_usage () {
	echo
	echo "	usage:"
	echo "		$0 <command>"
	if [ $(cat goo.json | jq '. | has("command")') == 'true' ]; then
		echo "	inline command:"
		allowed_commands=$(cat goo.json | jq --raw-output '.command | keys | .[]')
		for cmd in ${allowed_commands[@]}
		do
		echo "		"${cmd}
		done
	fi
	echo "	script command:"
	for cmd in $(ls ./script/)
	do
		if [[ -f "./script/${cmd}" ]]; then
		    echo "		"${cmd%%.sh}
		fi
	done
	echo "	script injected Varibles:"
	echo "		CALL_PATH=${CALL_PATH}"
	echo "		PROJECT_ROOT=${PROJECT_ROOT}"
	echo "		PROJECT_NAME=${PROJECT_NAME}"
}

if [[ $( cat goo.json | jq '. | has("command")' ) == 'true' \
     && \
     $( cat goo.json | jq '.command | has("'$1'")' ) == 'true' ]]; then
    command=$(cat goo.json | jq --raw-output '.command.'$1)
    eval ${command}
elif [ -f "./script/$1.sh" ]; then
	source ./script/$1.sh
else
	echo
	echo "[error] no command '$1'."
	print_usage
fi

