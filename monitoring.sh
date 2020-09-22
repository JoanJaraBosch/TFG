#!/bin/bash

if [ "$1" == "master" ]; then
	cpu=$(ps -A -o pcpu | tail -n+2 | paste -sd+ | bc)
	mem=$(free -m | awk '{print $7}' | head -2 | tail -1)
	mem_avail=$(df -t ext4 --output=used,avail | head -2 | tail -1)
	temp=$(sensors | tail -2 | head -1 | cut -d " " -f 9,13)        
else
	cpu=$(ssh -o StrictHostKeyChecking=no $1 "ps -A -o pcpu | tail -n+2 | paste -sd+ | bc")
        mem=$(ssh -o StrictHostKeyChecking=no $1 "free -m | awk '{print \$7}' | head -2 | tail -1")
	mem_avail=$(ssh -o StrictHostKeyChecking=no $1 "df -t ext4 --output=used,avail | head -2 | tail -1")
	temp=$(ssh -o StrictHostKeyChecking=no $1 "sensors | tail -2 | head -1 | cut -d \" \" -f 9,13")
fi

temp=$(echo "${temp//[+,),C,°]/}")

echo '{"cpu": "'"$cpu"'", "mem":"'"$mem"'", "mem_avail":"'"$mem_avail"'", "temp": "'"$temp"'"}'
