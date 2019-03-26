s=0
for i in find /etc/*.conf -type f -printf "%s %p\n" | sort -rn | head -n 5 | awk '{print $2}'
do
  	cp $i /POKUS/$i
done

for i in /POKUS
do
  	echo $i " " $wc -l < $i
        s+=$wc -l < $i
done
echo $s
