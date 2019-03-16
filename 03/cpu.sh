cat /proc/cpuinfo | grep 'model name' | head -2 | awk -F ':' '{print $2}' | tr '\n' ' '
