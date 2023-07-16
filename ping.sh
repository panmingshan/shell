#! /bin/bash

#  检测目标机器是否在线

for ((i=1;i<4;i++));do
if ping -c 1 $1 &>/dev/null;then
export  ping_count"$i"=1
else
export ping_count"$i"=0
fi

sleep 1;
done;

if [[ $(( $ping_count1 + $ping_count2 + $ping_count3 )) == 3 ]];then
echo 成功
else
echo 失败
fi;
unset  ping_count0
unset  ping_count1
unset  ping_count2
