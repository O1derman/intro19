awk -F ':' '{print $1}' /etc/group
awk -F ':' '{s+=$3} END {print s}' /etc/group
