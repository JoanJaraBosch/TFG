#!/bin/bash

echo "CPU-$(ps -A -o pcpu | tail -n+2 | paste -sd+ | bc)"
