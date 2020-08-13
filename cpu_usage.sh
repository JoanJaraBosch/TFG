#!/bin/bash


if [ "$1" == "master" ]; then
	echo "CPU-$(ps -A -o pcpu | tail -n+2 | paste -sd+ | bc)"
else
        Ans=$(ssh odroid@$1 "ps -A -o pcpu | tail -n+2 | paste -sd+ | bc")
        echo "CPU-$Ans"
fi
