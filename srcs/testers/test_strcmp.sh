#!/bin/bash

{ og_strcmp "$2" "$3" &> og.log; } &> /dev/null
echo Shell error code: $? >> og.log
{ ft_strcmp "$2" "$3" &> ft.log; } &> /dev/null
echo Shell error code: $? >> ft.log

difference=$(diff og.log ft.log)

if [ "$2" != "NULL" ]
then
	in1="\"$2\""
else
	in1=$2
fi
if [ "$3" != "NULL" ]
then
	in2="\"$3\""
else
	in2=$3
fi

if [ "$difference" != "" ]
then
	printf "TEST $1 [strcmp($in1, $in2)] : KO\n" | tee -a trace.log
	echo "$difference" >> trace.log
else
	printf "TEST $1 [strcmp($in1, $in2)] : OK\n" | tee -a trace.log
	cat og.log >> trace.log
fi

rm og.log ft.log
