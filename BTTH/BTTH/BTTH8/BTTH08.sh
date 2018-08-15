#!/bin/bash

flag_add=false
flag_delete=false
flag_search=false
flag_count=false

showHelp()
{
    echo "$0 [f|--find] [c|--count] [a|--add] [del|--delete] [input]"
}

search() 
{
    local fin=$1
    echo "Nhap tu can tim: "
    read word
    while read line; do
	for w in $line; do
		 if (($w == $word)); then
		     echo "$line"
		     break
		 fi
	done    
    done < $fin
}

count()
{
    local cnt=0
    local fin=$1
    while read line; do
	cnt=$(($cnt+1))
    done < $fin
    echo "So muc la $cnt"
}
    
add()
{
    local fin=$1
    echo -n "Last name: "
    read lname
    echo -n "First name: "
    read fname
    echo -n "Phone: "
    read phone
    echo -n "Email: "
    read email
    echo -n "Status: "
    read status
    echo -n "$lname $fname $phone $email $status" >> $fin
}

delete()
{
    local fin=$1
    echo "Nhap tu trong muc ban can xoa: "
    read word
    touch temp.txt
    chmod u+x temp.txt
    cp $fin temp.txt
    rm $fin
    touch $fin
    chmod u+x $fin
    while read line; do
	for w in $line; do
	    if (($w != $word)); then
		echo "$line" >> $fin
	    else
		break
	    fi
	done
    done < temp.txt
    rm temp.txt
}


showInfos()
{
    local fin=$1
    if (($flag_count)); then
	count $fin
    fi
    if (($flag_search)); then
	find $fin
    fi
    if (($flag_add)); then
	add $fin
    fi
    if (($flag_delete)); then
	delete $fin
    fi
}

process()
{
    local fin=$1
    local option=$2
    case $2 in
	h|--help) flag_help=true;;
        s|--search) flag_search=true;;
        a|--add) flag_add=true;;
        d|--delete) flag_delete=true;;
    esac
    showInfos $option
}

process input.txt delete 
