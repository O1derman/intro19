acpi | awk -F ':' '{print $2}' | awk -F ',' '{print $2, $1}'
