#!/bin/bash

process1()
{
    local fin=$1
    local fout=$2
    local s=''
    while read line
    do
	s="${line} ${s}"
    
    done < $fin
    for word in $s
    do
	echo ${word} >> $fout
    done
    #
}

process2()
{
    local fin=$1
    local fout=$2
    local res
    while read line
    do
	n=${#line}
	res=''
	for (( i=$n-1; i >= 0; i-- ))
	do
	    res="$res${line:$i:1}"
	done
	echo "$res" >> $fout
	echo -n
    done < $fin
}

input="$1"
output="$2"
process1 input.txt output.txt
echo -n
#process2 input.txt output.txt
