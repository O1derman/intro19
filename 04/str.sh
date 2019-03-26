ps -eo pid,ppid,cmd,%mem,%cpu --sort=-%mem | head -11 | tail -10 | awk '{s+=$1} END {print s}'
