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
	if [ "${@: -1}" == "odroids" ]; then
                if [ -f /home/odroid/.django-monitor/odroid/ips ]; then
			aux2=$($aux)
			echo "master->"$aux2

                        for odroid in $(cat /home/odroid/.django-monitor/odroid/ips ); do
                                val=$(echo $odroid | tr "," " " | awk '{print $2}')
                                aux2=$(ssh -o StrictHostKeyChecking=no $val "$aux")
                                echo $val"->"$aux2
                        done
                fi
        else
                aux=$(echo "ssh -o StrictHostKeyChecking=no ${@: -1} "$aux"")
                $aux
        fi
fi

exit 0
