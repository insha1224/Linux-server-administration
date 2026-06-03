#!/bin/bash
# =============================================
# System Health Monitor Script
# Author: Insha Taj Shaikh
# Description: Monitors CPU, Memory, and Disk
#              usage and logs daily report
# =============================================

DATE=$(date '+%Y-%m-%d %H:%M:%S')
REPORT_FILE="/var/log/health_report.log"
ALERT_THRESHOLD_CPU=80
ALERT_THRESHOLD_DISK=85

echo "=====================================" >> $REPORT_FILE
echo "  SYSTEM HEALTH REPORT - $DATE" >> $REPORT_FILE
echo "=====================================" >> $REPORT_FILE

# CPU Usage
CPU_USAGE=$(top -bn1 | grep "Cpu(s)" | awk '{print $2}' | cut -d'%' -f1)
echo "CPU Usage     : $CPU_USAGE%" >> $REPORT_FILE
if (( $(echo "$CPU_USAGE > $ALERT_THRESHOLD_CPU" | bc -l) )); then
    echo "⚠️  ALERT: CPU usage is above ${ALERT_THRESHOLD_CPU}%!" >> $REPORT_FILE
fi

# Memory Usage
TOTAL_MEM=$(free -m | awk '/Mem:/ {print $2}')
USED_MEM=$(free -m | awk '/Mem:/ {print $3}')
MEM_PERCENT=$(echo "scale=2; $USED_MEM/$TOTAL_MEM*100" | bc)
echo "Memory Usage  : ${USED_MEM}MB / ${TOTAL_MEM}MB (${MEM_PERCENT}%)" >> $REPORT_FILE

# Disk Usage
DISK_USAGE=$(df -h / | awk 'NR==2 {print $5}' | cut -d'%' -f1)
DISK_TOTAL=$(df -h / | awk 'NR==2 {print $2}')
DISK_USED=$(df -h / | awk 'NR==2 {print $3}')
echo "Disk Usage    : ${DISK_USED} / ${DISK_TOTAL} (${DISK_USAGE}%)" >> $REPORT_FILE
if [ "$DISK_USAGE" -gt "$ALERT_THRESHOLD_DISK" ]; then
    echo "⚠️  ALERT: Disk usage is above ${ALERT_THRESHOLD_DISK}%!" >> $REPORT_FILE
fi

# Top 5 Processes by CPU
echo "" >> $REPORT_FILE
echo "Top 5 Processes by CPU:" >> $REPORT_FILE
ps aux --sort=-%cpu | awk 'NR<=6 {printf "%-20s %s%%\n", $11, $3}' >> $REPORT_FILE

echo "=====================================" >> $REPORT_FILE
echo "" >> $REPORT_FILE

echo "Health report saved to $REPORT_FILE"
