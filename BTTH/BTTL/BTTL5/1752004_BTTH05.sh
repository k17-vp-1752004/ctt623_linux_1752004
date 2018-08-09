#!/bin/bash
FLAG_DISPLAY=false
FLAG_SUM=false
FLAG_PRODUCT=false
lengthList()
{
    echo "So luong so nguyen co trong tham so dau vao: $#"
}

showHelp()
{
    echo "$0 [-a|--all] [-d|--display][-s|--sum][-p|--product] input_file output_file"
}

displayList()
{
    echo $(lengthList $*)
    while [ $# -gt 0 ]; do
	echo $1
	shift
    done
}

sumInt()
{
    s=0
    while [ $# -gt 0 ]; do
	s=$((s+$1))
	shift
    done
    echo $s
}

productInt()
{
    product=1
    while [ $# -gt 0 ]; do
	product=$((product * $1))
	shift
    done
    echo $product
}

showInfos()
{
    if $FLAG_SUM; then
        sumInt $*
    fi
    if $FLAG_PRODUCT; then
        productInt  $*
    fi
    if $FLAG_DISPLAY; then
	displayList $*
    fi
}

readFile() # dir
{
    local dir=$1
    if ! [ -f $dir ]
    then
	echo "Duong dan $dir  khong hop le." >/dev/stderr
	exit 1
    fi
}

process()
{
    local fin=$1
    local fout=$2
    if readFile $fin ; then
	while read line; do
	    echo $(showInfos $line)  >> $fout
	done < "$fin"
    fi
    
}

    if [ $# -lt 2 ]
    then
	echo "so luong tham so ko hop le"
	showHelp
	exit 1
    fi 
    while [ $# -gt 2 ]; do
	case $1 in
	    -a|--all) FLAG_DISPLAY=true
		      FLAG_SUM=true
		      FLAG_PRODUCT=true
		      shift;;
	    -s|--sum) FLAG_SUM=true
	     shift;;
	    -p|--product) FLAG_PRODUCT=true
			  shift;;
	    -d|--display) FLAG_DISPLAY=true
			  shift;;
	esac
    done
    showInfos

input="$1"
output="$2"
process input.txt output.txt
