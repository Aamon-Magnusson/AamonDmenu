#! /bin/bash

if [ -z $1 ];then
	color=$(echo -e "pink\ndracula\nwhite\nblue" | dmenu -p "What color scheme would you like dwm to follow?" -i )
	[[ "$color" == "" ]] && color="pink"
elif [ $1 == "-cli" ];then
	echo "1) pink"
	echo "2) dracula"
	echo "3) white"
	echo "4) blue"
	echo "From the colors above select the number you would like to use."
	read index
	case $index in
		1)
			color="pink" ;;
		2)
			color="dracula" ;;
		3)
			color="white" ;;
		4)
			color="blue" ;;
		*)
			color="pink" ;;
	esac
else
	color=$1
fi

ex=".h"
header="$color$ex"
cd colors
currentColor=$(awk 'NR==1{print $2}' current.h)
mv current.h $currentColor.h
mv $header current.h
cd ..
sudo make -s install clean
