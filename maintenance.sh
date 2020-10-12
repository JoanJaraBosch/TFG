#!/bin/bash
#Author: Joan Jara Bosch
#Description: THis script only wants to execute commands and return their error and output
#Version: 1
#Date: 9/10/2020

aux=""

for val in "${@:1:$#-1}"; do
	aux=$(echo "$aux$val ")
done

if [ "${@: -1}" == "master" ]; then
	$aux
else
	aux=$(echo "ssh -o StrictHostKeyChecking=no ${@: -1} "$aux"")
	$aux
fi

exit 0
