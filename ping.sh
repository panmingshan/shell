#! /bin/bash

#  检测目标机器是否在线

for ((i=0;i<4;i++));do
if ping -c 1 $1 &>/dev/null;then
ping_count"$i"=1
else
ping_count"$i"=0
fi

sleep 1;
done;

if ($ping_count0 + $ping_count1 + $ping_count2) == 3;then
echo 成功
else
echo 失败
fi;