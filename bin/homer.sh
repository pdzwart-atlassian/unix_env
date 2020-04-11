#!/bin/bash

homers_texts=~/share/odyssey.txt

dadadodo -c 1 -w 1048576 $homers_texts 2> /dev/null

#declare -a lines

#i=0

#old_ifs="$IFS"
#IFS=$'\n'

#for line in `cat ~/share/odyssey.txt`
#do
#    lines[$i]="$line"
#    let i+=1
#done

#index=$(($RANDOM*$RANDOM%$i))
#line="${lines[$index]}"

#echo "$line"
