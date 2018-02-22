#!/bin/bash
function drawTriangle(){
startRow=$1
endRow=$2
slope=$3
light=$4
colorful=$5
row=$startRow
while [ $row -lt $endRow ]
do
let startCell=20-$row/$slope
let endCell=20+$row/$slope
 for cell in {1..40}
  do
   if [ $cell -lt $startCell ];then
      echo -n -e " "
   elif [ $cell -gt $endCell ];then
      echo -n -e " "
   else
   color=46
   ${colorful:+let color=$RANDOM%7+41}
   echo -n -e "\e[5;32;${color}m$light\e[0m"
   fi
  done
echo ""
let row+=1
done
}

drawTriangle 0 6 1 '.' 1
drawTriangle 2 10 1 '*' 1
drawTriangle 4 20 1 '#' 1
drawTriangle 1 4 10 ' '
sleep 10