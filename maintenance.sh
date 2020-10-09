#!/bin/bash
#Author: Joan Jara Bosch
#Description: THis script only wants to execute commands and return their error and output
#Version: 1
#Date: 9/10/2020

commanda=$1
commanda=$(echo $commanda | tr "," " ")

echo $commanda

output=$($commanda) 

exit 0
