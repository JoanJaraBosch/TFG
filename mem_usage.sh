#!/bin/bash

echo "MEM-$(free -m | awk '{print $7}' | head -2 | tail -1)"
