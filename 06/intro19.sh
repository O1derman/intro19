#!/bin/bash

b="nic"
s="false"

for var in "$@"; do
        if [[ $b == "git" ]]; then
                b="nic"
                git=$var

        elif [[ $b == "url" ]]; then
                b="nic"
                url=$var

        elif [[ $var == "-h" || $var == "--help" ]]; then
                echo options are: -h, -g, -u, -v, -s and commands: ls, status, next

        elif [[ $var == "g" || $var == "--git" ]]; then
        b="git"

        elif [[ $var == "-u" || $var == "--url" ]]; then
        b="url"

        elif [[ $var == "-v" || $var == "--verbose" ]]; then
                echo ToDo

        elif [[ $var == "-s" || $var == "--short" ]]; then
                s="true"

        elif [[ $var == "ls" ]]; then                    
                site=$(wget $url -q -O -)
                for line in `cat $site`; do 
                        if [[ $line == *" points]"* ]]; then 
                                
                        fi      
                done    

        elif [[ $var == "status" ]]; then                    
                echo s

        elif [[ $var == "next" ]]; then                    
                echo n

        else
                echo wrong option
                exit 1
        fi
done
