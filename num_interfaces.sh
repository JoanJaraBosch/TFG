#!/bin/bash

echo "$(ip link show | sed -n 'p;n' | awk '{print $2}' | cut -d ':' -f 1 | tr '\n' ' ')"
