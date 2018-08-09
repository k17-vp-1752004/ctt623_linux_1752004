#!/bin/bash
FLAG_SUM=false
FLAG_MULT=false

showHelp ()
{
    echo "$0 [ -h | --help ] [ -s | --sum ] [ -m | --mult ] list_of_numbers"
}

displaylist ()
{
    while [ $# -gt 0 ]; do
	echo $1
	shift
    done
}

sum ()
{
    s=0
    while [ $# -gt 0 ]; do
	s=$((s+$1))
	shift
    done
    echo $s
}

mult ()
{
    product=1
    while [ $# -gt 0 ]; do
	product=$((product * $1))
	shift
    done
    echo $product
}

showResult ()
{
    if $FLAG_SUM; then
        sum 1000 2000 3 4 6
    else
	exit 1
    fi
    if $FLAG_MULT; then
        mult 2 5 6 7 10 4 5 
    else
	exit 1
    fi
}

option ()
{
    if [ $# -lt 1 ]
    then
	showHelp
    fi
    while [ $# -ge 1 ]; do
	case $1 in
	    -h|--help) showHelp
	     exit 1;;
	    -s|--sum) FLAG_SUM=true
	     shift;;
	    -m|--mult) FLAG_MULT=true
	     shift;;
	esac
    done
    showResult
}

option --sum --mult



