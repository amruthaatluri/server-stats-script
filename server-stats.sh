#!/bin/bash



cpu_usage=$(top -l 1 | grep "CPU usage" | awk '{print $3}')
echo "Total CPU Usage: $cpu_usage"

memory_stats=$(top -l 1 -s 0 | grep "PhysMem" | awk '{print $2, $3, $4}')
echo "Memory Usage: $memory_stats"

disk_usage=$(df -h | grep '^/dev/')
echo "Disk Usage: "
echo "$disk_usage"

echo "Top 5 Processes by CPU Usage:"
ps aux | sort -nrk 3,3 | head -n 6

echo "Top 5 Processes by Memory Usage:"
ps aux | sort -nrk 4,4 | head -n 6

os_version=$(sw_vers -productName)$(sw_vers -productVersion)
echo "OS Version: $os_version"

uptime_info=$(uptime -p)
echo "Uptime: $uptime_info"

logged_in_users=$(who)
echo "Logged-In Users: "
echo "$logged_in_users"

failed_logins=$(grep "Failed" /var/log/secure.log | wc -l)
echo "Failed Login Attempts: $failed_logins"









