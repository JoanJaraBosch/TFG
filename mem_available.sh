#!/bin/bash

if [ "$1" == "master" ]; then
	echo "MEM_AVA-$(df -t ext4 --output=used,avail | head -2 | tail -1)"
else
        Ans=$(ssh odroid@$1 "df -t ext4 --output=used,avail | head -2 | tail -1")
        echo "MEM_AVA-$Ans"
fi

