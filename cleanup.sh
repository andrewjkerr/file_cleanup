#!/bin/bash

usage="$(basename "$0") [-s <separator>] [-d <text to delete>] -p <path to files> -f <format of files>"

if [ "$1" == "-h" -o "$1" == "--help" ]; then
	echo "Usage: $usage"
	exit 1
fi

while [[ $# -gt 1 ]]
do
	key="$1"
	case $key in
		-s|--separator)
			SEPARATOR="$2"
			shift
		;;
		-d|--delete)
			DELETE="$2"
			shift
		;;
		-p|--path)
			FILES="$2"
			shift
		;;
		-f|--format)
			FORMAT="$2"
			shift
		;;
		*)
		;;
	esac
	shift
done

for file in $FILES/*.$FORMAT
do
	echo $file
	new_name="${file/$DELETE/}"
	new_name="${new_name/\[*\]/}"
	new_name="${new_name//.$FORMAT/}"
	new_name="${new_name//$SEPARATOR/ }.$FORMAT"
	echo $new_name
	echo "---"
done

echo 'Looks good? (Y/n):'
read answer
if [ "$answer" == "Y" ]; then
	for file in $FILES/*.$FORMAT
	do
		new_name="${file/$DELETE/}"
		new_name="${new_name/\[*\]/}"
		new_name="${new_name//.$FORMAT/}"
		new_name="${new_name//$SEPARATOR/ }.$FORMAT"
		mv "$file" "$new_name"
	done
	echo 'Done!'
else
	echo 'Aborting...'
fi
