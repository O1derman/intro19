#!/bin/bash
#set -euxo pipefail

mkdir keys
lines=()
while read line; do
        lines+=("$line")
        key=`echo "$line" | awk '{print $1}'`
        touch keys/$key
done
for f in $(ls keys); do
        for line in "${lines[@]}"; do
                key=`echo "$line" | awk '{print $1}'`
                if [ "$key" == "$f" ]; then
                        echo "$line"
                fi
        done
done
rm keys/*
rmdir keys
