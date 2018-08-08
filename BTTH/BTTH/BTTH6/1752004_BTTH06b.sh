#!/bin/bash

countWord()
{
    local cnt=0
    for word in $*
    do
	cnt=$(($cnt+1))
    done
    echo "$cnt"
}

showWord()
{
    local res=''
    local temp=$#
    local i=1
    for word in $*
    do
	i=$(($i + 1))
	res+=$word
	if ((i <= temp)); then
	    res+=", "
	fi
    done
    echo "$res"
}

countLoopWord() #$1=word $2=all_words_in_file
{
    local cnt=0
    local word=$1
    for i in $*
    do
	if [ "$i" == "$word" ]; then
	    cnt=$(($cnt + 1))
	fi
    done
    cnt=$(($cnt - 1))
    echo "Tu $word xuat hien $cnt lan"
}

process()
{
    local fin=$1
    local fout=$2
    local str=''
    while read line; do
	str+=$line
	str+=" "
    done < $fin
    local res=$(countWord $str)
    echo "So tu co trong file la $res " >> $fout
    res=$(showWord $str)
    echo "Cac tu co trong file la: $res " >> $fout
    res=$(countLoopWord "vong" $str)
    echo "$res" >> $fout
}

process inputb.txt outputb.txt
