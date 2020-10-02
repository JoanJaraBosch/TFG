#!/bin/bash

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


for i in /sys/class/net/*; do RX=$(cat $i/statistics/tx_bytes); TX=$(cat $i/statistics/rx_bytes); network=$(echo "_"$(basename $i)": "$RX" "$TX" "$network) ; done


temp=$(echo "${temp//[+,),C,°]/}")
load=$(echo $load" "$cpunum)
up=$(echo $days"-"$min"-"$sec)

echo '{"cpu": "'"$cpu"'", "mem":"'"$mem"'", "mem_avail":"'"$mem_avail"'", "temp": "'"$temp"'", "load": "'"$load"'", "entropy": "'"$entropy"'", "up": "'"$up"'", "net": "'"$network"'"}'
