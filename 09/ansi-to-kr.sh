#!/bin/bash
#set -euxo pipefail
 
while read -r line; do
        a=`echo "$line" | sed 's/^.*(void).*/void/'`
        b=`echo "$line" | sed 's/^.*;.*/;/'`
        text=`echo "$line" | sed 's/\(^.*\)(void)\(.*$\)/\1()\2/'`
        if [[ $a != "void" ]]; then
                function_name=`echo "$line" | sed 's/\(^.*(\).*;/\1/'`
 
                if [[ $b == ";" ]]; then
                        function_sufix=`echo "$line" | sed 's/.*)\(.*\)/\1/'`
                        parameters=`echo "$line" | sed 's/^.*(\(.*)\).*/\1/'`
                        parameters=`echo "$parameters" | sed 's/,\s/,/g'`
                        types=`echo "$parameters" | sed 's/,\s/,/g'`
                        #types=`echo "$types" | perl -pe 's/\s.*?,/,/g'
                        types=`echo "$types" | sed 's/ .*)/)/'
                        text="$function_name$types$function_sufix"
                
                else
                        function_name=`echo "$line" | sed 's/\(^.*(\).*/\1/'`
                        parameters=`echo "$line" | sed 's/^.*\((.*\)).*/\1/'`
                        declaration=`echo "$parameters" | sed 's/(//'`
                        parameters=`echo "$parameters" | sed 's/,.* /,/g'`
                        parameters=`echo "$parameters" | sed 's/(.* /(/'`
                        declaration=`echo "$declaration" | tr ' ,' ';\n'`
                        text=$function_name$types$'\n'$declaration
 
                fi
        fi
        echo $text
done
