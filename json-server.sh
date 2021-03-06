#!/bin/bash
#Author: Joan Jara Bosch
#Description: Script that retunrs a json with the information needed to make the graphics in javascript. We put this script in a general place in order to achieve the json for all the odroid cards.
#Version: 1
#Date: 26/9/2020

cpu=$(ps -A -o pcpu | tail -n+2 | paste -sd+ | bc)
mem=$(free -m | awk '{print $7}' | head -2 | tail -1)
mem_avail=$(df -t ext4 --output=used,avail | head -2 | tail -1)
temp=$(sensors | tail -2 | head -1 | cut -d " " -f 9-)
load=$(cat /proc/loadavg | awk '{print $1" "$2" "$3}')
cpunum=$(lscpu | head -3 | tail -1 | cut -d " " -f 15-)
entropy=$(cat /proc/sys/kernel/random/entropy_avail)
days=$(echo "$(awk '{print $1}' /proc/uptime) /86400" | bc)
min=$(echo "($(awk '{print $1}' /proc/uptime) %86400) /3600" | bc)
sec=$(echo "(($(awk '{print $1}' /proc/uptime) %86400)%3600)/60" | bc)
writeread=$(iostat | tail -n +7 | awk '{r+=$5}{w+=$6}END{print w" "r}')

for i in /sys/class/net/*; do RX=$(cat $i/statistics/tx_bytes); TX=$(cat $i/statistics/rx_bytes); network=$(echo "_"$(basename $i)": "$RX" "$TX" "$network) ; done

temp=$(echo "${temp//[+,),(,=,C,a-z,°]/}")
temp=$(echo $temp | tr -s " ")

load=$(echo $load" "$cpunum)
up=$(echo $days"-"$min"-"$sec)

echo '{"cpu": "'"$cpu"'", "mem":"'"$mem"'", "mem_avail":"'"$mem_avail"'", "temp": "'"$temp"'", "load": "'"$load"'", "entropy": "'"$entropy"'", "up": "'"$up"'", "net": "'"$network"'", "write_read": "'"$writeread"'"}'
