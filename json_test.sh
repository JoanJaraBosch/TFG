#!/bin/bash

if [ "$1" == "master" ]; then
	cpu=$(ps -A -o pcpu | tail -n+2 | paste -sd+ | bc)
	mem=$(free -m | awk '{print $7}' | head -2 | tail -1)
	mem_avail=$(df -t ext4 --output=used,avail | head -2 | tail -1)
else
	cpu=$(sshpass -p "odroid" ssh -o StrictHostKeyChecking=no odroid@$1 "ps -A -o pcpu | tail -n+2 | paste -sd+ | bc")
        mem=$(sshpass -p "odroid" ssh -o StrictHostKeyChecking=no odroid@$1 "free -m | awk '{print \$7}' | head -2 | tail -1")
	mem_avail=$(sshpass -p "odroid" ssh -o StrictHostKeyChecking=no odroid@$1 "df -t ext4 --output=used,avail | head -2 | tail -1")
fi

echo "$(printf '{"cpu":"%s", "mem":"%s", "mem_avail":"%s"}\n' "$cpu" "$mem" "$mem_avail")"
