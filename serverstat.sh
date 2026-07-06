#!/bin/bash

echo "========================================="
echo "        SERVER PERFORMANCE STATS         "
echo "========================================="

# 1. Total CPU Usage
# 'top' kat-3ti stats, 'awk' k-akhod l-Idle value o k-y-nqsou mn 100
echo "CPU Usage: $(top -bn1 | grep "Cpu(s)" | awk '{print 100 - $8"%"}')"

# 2. Total Memory Usage
# 'free -m' k-3ti RAM b Mo. 'awk' k-y-hsab l-percentage
echo -e "\nMemory Usage:"
free -m | awk 'NR==2{printf "Used: %sMB / Free: %sMB (%.2f%%)\n", $3, $4, $3*100/$2 }'

# 3. Total Disk Usage
# 'df -h' k-3ti Disk stats. 'grep' k-filteri system disk
echo -e "\nDisk Usage:"
df -h --total | grep "total" | awk '{printf "Used: %s / Free: %s (%s)\n", $3, $4, $5}'

# 4. Top 5 processes by CPU
echo -e "\nTop 5 processes by CPU usage:"
ps -eo pid,cmd,%cpu --sort=-%cpu | head -n 6

# 5. Top 5 processes by memory
echo -e "\nTop 5 processes by memory usage:"
ps -eo pid,cmd,%mem --sort=-%mem | head -n 6
