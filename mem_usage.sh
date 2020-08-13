#!/bin/bash

if [ "$1" == "master" ]; then
	echo "MEM-$(free -m | awk '{print $7}' | head -2 | tail -1)"
else
        Ans=$(ssh odroid@$1 "free -m | awk '{print \$7}' | head -2 | tail -1")
        echo "MEM-$Ans"
fi
