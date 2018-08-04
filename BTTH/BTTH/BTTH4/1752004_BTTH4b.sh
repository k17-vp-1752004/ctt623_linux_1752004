#!/bin/bash

flag_countline=false
flag_find=false
flag_all=false
lengthList()
{
    echo "So luong so nguyen co trong tham so dau vao: $#"
}

showHelp()
{
    echo "$0 [-h|--help] [-a|--all] [-f|--find filename] [-c|--count filename] [dir]"
}

showAllFiles()
{
    local dir=$1
    if ! [ -d $dir ]
    then
	echo "Duong dan khong hop le." > /dev/stderr
	return 1
    fi
    for i in $dir/* ;
    do
	echo $i
    done
}

findFile()
{
    local dir=$1
    local file=$2
    if ! [ -d $dir ]
    then
	echo "Duong dan khong hop le" > /dev/stderr
	return 1
    fi
    for i in $dir/* ; do
	temp=${i##*/}
	if [ "$i"="$file" ]
	then
	    echo "$i"
	fi
   done
    
}

countlines()
{
    local dir=$1
    local file
    file=${dir##*/}
    echo "$(wc -l < $file)"
}

showInfos()
{
    if $flag_countline; then
        echo $(countlines $*)
    fi
    if $flag_find; then
        echo $(findFile $*)
    fi
    if $flag_all; then
	echo $(showAllFiles $*)
    fi
}

#cau2
    if [ $# -lt 2 ]
    then
	echo "so luong tham so ko hop le"
	showHelp
	exit 1
    fi 
    while [ $# -gt 2 ]; do
	case $1 in
	    -a|--all) flag_all=true
		      shift;;
	    -f|--find) flag_find=true
	     shift;;
	    -c|--count) flag_countline=true
			  shift;;
	esac
    done
    showInfos


    
