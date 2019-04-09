!/bin/dash

num='^[0-9]+$'

if [ ! -z $3 ]; then
        if [ $3 = $num ]; then
                DEPTH=$3
        fi
else
        DEPTH=5
fi


if  [ $1 = "-a" ]; then
        option="wav\\\|mp3\\\|ogg\\"
elif [ $1 = "-p" ]; then
        option="png\\\|jpg\\\|svg\\\|gif\\\|JPG\\"
elif [ $1 = "-d" ]; then
        option="doc\\\|xls\\\|pdf\\"
elif [ $1 = "-h" ]; then
        echo options are -a, -p, -d and then site from where to search
        echo depth of recursion is optional, set up by nuber after url, default value is 5
        exit 0
fi

wget -r --spider --delete-after --force-html -l $DEPTH "https://$2" 2>&1 \
| grep '^--' | awk '{ print $3 }' | grep -v '\. \('$option')$' | uniq > cat
