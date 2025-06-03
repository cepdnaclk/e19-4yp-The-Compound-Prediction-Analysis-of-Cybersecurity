#!/bin/bash

# Unified System Monitoring Script
LOG_DIR="/home/ubuntu/logs"
OUTPUT_FILE="${LOG_DIR}/system_metrics_unified.csv"

# Create CSV header only if file doesn't exist
if [ ! -f "$OUTPUT_FILE" ]; then
    echo "timestamp,memory_total,memory_used,memory_available,cpu_user,cpu_system,cpu_idle,load_1min,load_5min,load_15min,disk_total,disk_used,disk_available,disk_percent,process_count" > $OUTPUT_FILE
fi

echo "Starting unified system monitoring..."

while true; do
    DATE=$(date '+%Y-%m-%d %H:%M:%S')
    
    # Memory (MB)
    MEMORY=$(free -m | grep '^Mem:' | awk '{print $2","$3","$7}')
    
    # CPU percentages
    CPU=$(top -bn1 | grep "Cpu(s)" | awk '{gsub(/%us,/, ","); gsub(/%sy,/, ","); gsub(/%id,/, ""); print $2","$4","$8}')
    
    # Load averages
    LOAD=$(uptime | awk -F'load average:' '{gsub(/ /, ""); gsub(/,/, ","); print $2}')
    
    # Disk usage
    DISK=$(df -BG / | tail -1 | awk '{gsub(/G/, ""); print $2","$3","$4","$5}')
    
    # Process count
    PROCESSES=$(ps aux | wc -l)
    
    # Combine all metrics
    echo "$DATE,$MEMORY,$CPU,$LOAD,$DISK,$PROCESSES" >> $OUTPUT_FILE
    
    sleep 5
done
