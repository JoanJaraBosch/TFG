#!/bin/bash

if [ "$1" == "master" ]; then
	cpu=$(ps -A -o pcpu | tail -n+2 | paste -sd+ | bc)
	mem=$(free -m | awk '{print $7}' | head -2 | tail -1)
	mem_avail=$(df -t ext4 --output=used,avail | head -2 | tail -1)
	temp=$(sensors | tail -2 | head -1 | cut -d " " -f 9,13)
        load=$(uptime | cut -d " " -f 11-)
	cpunum=$(lscpu | head -3 | tail -1 | cut -d " " -f 15-)
	entropy=$(cat /proc/sys/kernel/random/entropy_avail)
	up=$(uptime -p | tr -s ' ')
else
	cpu=$(ssh -o StrictHostKeyChecking=no $1 "ps -A -o pcpu | tail -n+2 | paste -sd+ | bc")
        mem=$(ssh -o StrictHostKeyChecking=no $1 "free -m | awk '{print \$7}' | head -2 | tail -1")
	mem_avail=$(ssh -o StrictHostKeyChecking=no $1 "df -t ext4 --output=used,avail | head -2 | tail -1")
	temp=$(ssh -o StrictHostKeyChecking=no $1 "sensors | tail -2 | head -1 | cut -d \" \" -f 9,13")
	load=$(ssh -o StrictHostKeyChecking=no $1 "uptime | cut -d \" \" -f 12-")
	cpunum=$(ssh -o StrictHostKeyChecking=no $1 "lscpu | head -3 | tail -1 | cut -d \" \" -f 15-")
	entropy=$(ssh -o StrictHostKeyChecking=no $1 "cat /proc/sys/kernel/random/entropy_avail")
	up=$(ssh -o StrictHostKeyChecking=no $1 "uptime -p | tr -s \' \'")
fi

temp=$(echo "${temp//[+,),C,°]/}")
load=$(echo "${load//\,/} $cpunum")
up=$(echo "${up//[a-z,\,]/}")
up=$(echo $up | tr -s " ")
up=$(echo "${up//\ /-}")

echo '{"cpu": "'"$cpu"'", "mem":"'"$mem"'", "mem_avail":"'"$mem_avail"'", "temp": "'"$temp"'", "load": "'"$load"'", "entropy": "'"$entropy"'", "up": "'"$up"'"}'
