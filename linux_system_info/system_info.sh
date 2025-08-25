#!/bin/bash
# A simple linux sytem info script

echo "====SYSTEM INFORMATION======"
echo "Hostname: $(hostname)"
echo "OS: $(lsb_release -d | cut -f2)"
echo "Kernel: $(uname -r)"
echo "Uptime: $(uptime -p)"
echo "CPU Info: $(lscpu | grep 'Model name' | cut -d ':' -f2)"
echo "Memory Usage:"
free -h
echo "Disk Usage:"
df -h | grep '^/dev/'
echo "IP Address: $(hostname -I)"
