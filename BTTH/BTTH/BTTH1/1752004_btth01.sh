#! /bin/bash
#Ho va ten: My
#MSSV: 1752004
#Ten bai tap: BTTH1

#Cau 2
echo "Hello world"

#Cau 4
MESSAGE="Hello world"
echo $MESSAGE

#Cau 5
echo "Nhap vao mot so: "
read n

if [ $n -gt 0 ]
then
    echo "$n la so duong"
elif [ $n -lt 0 ]
then
    echo "$n la so am"
else
    echo "$n la so 0"
fi

#Cau 6
echo "Nhap vao mot so: "
read n


if ((n%2 == 0))
   
then
    echo "$n la so chan"
else
    echo "$n la so le"
fi 

echo "Nhap n: "
read n
for ((i=0; i <= n; i++))
do
	echo "$i"
done
