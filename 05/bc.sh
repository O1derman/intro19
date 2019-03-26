#!/bin/dash


re=[0-9]

echo "Enter number: "
while true
do

	read a

	if ! [[ "$a" =~ ^[0-9]+$ ]]
		then
			echo "Sorry integers only"
	else
		break
	fi
done


while true
do

	echo "Enter Choice:"
	echo "1. +"
	echo "2. -"
	echo "3. *"
	echo "4. /"

	while true
	do

		read ch

		if ! [[ "$ch" =~ ^[0-9]+$ ]]
			then
				echo "Input number of your choice"
		else
			break
		fi

	done

	echo "Enter number: "

	while true
	do
		read b

	if ! [[ "$b" =~ ^[0-9]+$ ]]
		then
			echo "Sorry integers only"
	else
		break
	fi

	done

	case $ch in
	1)res=`echo $a + $b | bc`
	;;
	2)res=`echo $a - $b | bc`
	;;
	3)res=`echo $a \* $b | bc`
	;;
	4)res=`echo "scale=2; $a / $b" | bc`
	;;
	5)exit
	esac
	echo "Result : $res"
	a=$res
done
