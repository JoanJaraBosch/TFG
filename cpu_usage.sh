#!/bin/bash

echo $(ps -A -o pcpu | tail -n+2 | paste -sd+ | bc)
