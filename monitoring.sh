#!/bin/bash

if [ "$1" == "master" ]; then
	cpu=$(ps -A -o pcpu | tail -n+2 | paste -sd+ | bc)
	mem=$(free -m | awk '{print $7}' | head -2 | tail -1)
	mem_avail=$(df -t ext4 --output=used,avail | head -2 | tail -1)
	temp=$(sensors | tail -2 | head -1 | cut -d " " -f 9,13)
        load=$(cat /proc/loadavg | awk '{print $1" "$2" "$3}')
	cpunum=$(lscpu | head -3 | tail -1 | cut -d " " -f 15-)
	entropy=$(cat /proc/sys/kernel/random/entropy_avail)
	days=$(echo "$(awk '{print $1}' /proc/uptime) /86400" | bc)
	min=$(echo "($(awk '{print $1}' /proc/uptime) %86400) /3600" | bc)
	sec=$(echo "(($(awk '{print $1}' /proc/uptime) %86400)%3600)/60" | bc)
	network=$(./network.sh) 
else
	cpu=$(ssh -o StrictHostKeyChecking=no $1 "ps -A -o pcpu | tail -n+2 | paste -sd+ | bc")
        mem=$(ssh -o StrictHostKeyChecking=no $1 "free -m | awk '{print \$7}' | head -2 | tail -1")
	mem_avail=$(ssh -o StrictHostKeyChecking=no $1 "df -t ext4 --output=used,avail | head -2 | tail -1")
	temp=$(ssh -o StrictHostKeyChecking=no $1 "sensors | tail -2 | head -1 | cut -d \" \" -f 9,13")
	load=$(ssh -o StrictHostKeyChecking=no $1 "cat /proc/loadavg | awk -v OFS=' ' '{print \$1, \$2, \$3}'")
	cpunum=$(ssh -o StrictHostKeyChecking=no $1 "lscpu | head -3 | tail -1 | cut -d \" \" -f 15-")
	entropy=$(ssh -o StrictHostKeyChecking=no $1 "cat /proc/sys/kernel/random/entropy_avail")
	seconds=$(ssh -o StrictHostKeyChecking=no $1 "awk '{print \$1}' /proc/uptime")
	days=$(echo "$seconds/86400" | bc)	
	min=$(echo "($seconds%86400)/3600" | bc)
	sec=$(echo "(($seconds%86400)%3600)/60" | bc)
	network=$(ssh -o StrictHostKeyChecking=no $1 "/home/odroid/.django-monitor/network.sh")
fi

temp=$(echo "${temp//[+,),C,°]/}")
load=$(echo $load" "$cpunum)
up=$(echo $days"-"$min"-"$sec)

echo '{"cpu": "'"$cpu"'", "mem":"'"$mem"'", "mem_avail":"'"$mem_avail"'", "temp": "'"$temp"'", "load": "'"$load"'", "entropy": "'"$entropy"'", "up": "'"$up"'", "net": "'"$network"'"}'
