#!/bin/bash
#
# zenity color picker with hex representation
#
rgb=$(zenity --color-selection | sed 's/^.*(//' | sed 's/).*$//' | awk -F[,] '{for (i=1; i<=NF; i+=1) print $i}')
hex="#"
for n in $rgb;
do
    h=$(echo "ibase=10; obase=16; $n" | bc | tr A-Z a-z)
    [ ${#h} == 1 ] && h="0$h"
    hex+=$h
done
echo -n $hex | xclip -sel clipboard
