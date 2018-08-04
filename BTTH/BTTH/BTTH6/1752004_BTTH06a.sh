#!/bin/bash

getLengthList()
{
    echo "$#"
}

displayList()
{
    local len
    len=$(getLengthList $*)
    echo
    echo "Do dai day so la: $len"
    echo -n "Cac so trong day la: "
    for i in $*
    do
	echo -n "$i "
    done
    echo
}

getEvenNumbers()
{
    echo
    echo -n "Cac so chan trong day so la: "
    for i in $*
    do
	if (($i % 2 == 0))
	then
	    echo -n "$i "
	fi
    done
    echo
}

getOddNumbers()
{
    echo
    echo -n "Cac so le trong day so la: "
    for i in $*
    do
	if (($i % 2 != 0))
	then
	    echo -n "$i "
	fi
    done
    echo
}

getMax()
{
    local max=$1
    shift
    for i in $*
    do
	if (($i > $max)); then
	    max=$i
	fi
    done
    echo
    echo "So lon nhat trong day la: $max"
}	  


getMin()
{
    local min=$1
    shift
    for i in $*
    do
	if (($i < $min)); then
	    min=$i
	fi
    done
    echo
    echo "So be nhat trong day la: $min" 
}

getValueAt()
{
    local pos=$1
    shift
    echo
    local len=$(getLengthList $*)
    if ((pos < 0 || pos + 1 > len)); then
	echo "Loi" > /dev/stderr
	exit 1
    fi
    local t=0
    for i in $*
    do
	if ((t == pos)); then
	    echo "Gia tri tai vi tri $pos la $i"
	    break
	fi
	t=$(($t+1))
    done
}

process()
{
    local fin=$1
    local fout=$2
    local res
    while read line; do
	res=$(displayList $line)
	res+=$(getEvenNumbers $line)
	res+=$(getOddNumbers $line)
	res+=$(getMax $line)
	res+=$(getMin $line)
	res+=$(getValueAt $line)
	echo "$res" >> $fout
	echo "----------------------" >> $fout
    done < $fin
}

process input.txt output.txt


