#!/bin/bash

flag_add=false
flag_delete=false
flag_search=false
flag_count=false
flag_vcard=false

showHelp()
{
    echo "$0 [f|--find] [c|--count] [a|--add] [del|--delete] [v-|--vcard] [input]"
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
    echo -n "Age: "
    read age
    echo -n "$lname $fname $phone $email $age" >> $fin
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

printVCard()
{
    local fin=$1
    local res=''
    echo "Nhap 1 tu trong muc can xuat: "
    read word
    touch directory.vcf
    chmod u+x directory.vcf
    local fout="directory.vcf"
    while read line; do
	for w in $line; do
	    if (($w == $word)); then
		res=line
		break
	    fi
	done
    done
    i=0
    for w in $res; do
	i=$(($i+1))
	if (($i==1)); then
	    echo -n "Last name: " >> $fout
	fi
	if (($i==2)); then
	    echo -n "First name: " >> $fout
	fi
	if (($i==3)); then
	    echo -n "Phone: " >> $fout
	fi
	if (($i==4)); then
	    echo -n "Email: " >> $fout
	fi
	if (($i==5)); then
	    echo -n "Age: " >> $fout
	fi
	echo "$w" >> $fout
	echo >> $fout
    done
}


showInfos()
{
    local fin=$1
    if (($flag_help)); then
	showHelp
    fi
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
    if (($flag_vcard)); then
        printVCard $fin
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
	c|--count) flag_count=true;;
	v|--vcard) flag_vcard=true;;
    esac
    showInfos $option
}

process input.txt delete 
