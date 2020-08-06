#!/bin/bash

echo "MEM_AVA-$(df -t ext4 --output=used,avail | head -2 | tail -1)"
