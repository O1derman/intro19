c=$0
for i in ls  /usr/include/*.h
do
	if [$c lt $wc -l < $i]
	then
		c="$wc -l < $i"
	fi
done

for i in ls /usr/include/*.h
do
	if [$c eq $wc -l < $i]
	then
		echo $i
	fi

done
