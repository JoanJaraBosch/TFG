#!/bin/bash
#Author: Joan Jara Bosch
#Description: THis script only wants to execute commands and return their error and output
#Version: 1
#Date: 9/10/2020

aux=""

for val in $@; do
	aux=$(echo "$aux$val ")
	echo "lol"
done

$aux

exit 0
