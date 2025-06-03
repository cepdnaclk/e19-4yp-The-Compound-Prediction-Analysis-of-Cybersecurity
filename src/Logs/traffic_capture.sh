#!/bin/bash

# Unified Network Monitoring Script
LOG_DIR="/home/ubuntu/logs"
PCAP_FILE="${LOG_DIR}/network_traffic_unified.pcap"
NETWORK_CSV="${LOG_DIR}/network_metrics_unified.csv"

# Create CSV header if file doesn't exist
if [ ! -f "$NETWORK_CSV" ]; then
    echo "timestamp,active_connections,tcp_connections,udp_connections,bytes_received,bytes_transmitted,packets_received,packets_transmitted" > $NETWORK_CSV
fi

echo "Starting unified network monitoring..."

# Start packet capture in background
sudo tcpdump -i any -w "$PCAP_FILE" '(port 80 or port 443 or port 8080)' &
TCPDUMP_PID=$!

# Monitor network metrics
while true; do
    DATE=$(date '+%Y-%m-%d %H:%M:%S')
    
    # Active connections count
    ACTIVE_CONN=$(netstat -tuln | grep LISTEN | wc -l)
    
    # TCP/UDP connections
    TCP_CONN=$(ss -t | grep ESTAB | wc -l)
    UDP_CONN=$(ss -u | wc -l)
    
    # Network interface stats
    NET_STATS=$(cat /proc/net/dev | grep eth0 | awk '{print $2","$10","$3","$11}')
    
    # Combine metrics
    echo "$DATE,$ACTIVE_CONN,$TCP_CONN,$UDP_CONN,$NET_STATS" >> $NETWORK_CSV
    
    sleep 5
done &
MONITOR_PID=$!

echo "Network monitoring started. PIDs: tcpdump=$TCPDUMP_PID, monitor=$MONITOR_PID"
echo "To stop: kill $TCPDUMP_PID $MONITOR_PID"

wait
