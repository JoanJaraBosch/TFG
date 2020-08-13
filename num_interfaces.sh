#!/bin/bash

if [ "$1" == "master" ]; then
	echo "$(ip link show | sed -n 'p;n' | awk '{print $2}' | cut -d ':' -f 1 | tr '\n' ' ')"
else
        Ans=$(ssh odroid@$1 "ip link show | sed -n 'p;n' | awk '{print \$2}' | cut -d ':' -f 1 | tr '\n' ' '")
        echo "$Ans"
fi
