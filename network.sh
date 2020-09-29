#!/bin/bash

for i in /sys/class/net/*; do RX=$(cat $i/statistics/tx_bytes); TX=$(cat $i/statistics/rx_bytes); result=$(echo $(basename $i)": "$RX" "$TX" "$result) ; done

echo $result
