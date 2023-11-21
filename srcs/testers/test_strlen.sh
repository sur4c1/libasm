#!/bin/bash

make strlen &> /dev/null

{ og_strlen "$2" &> og.log; } &> /dev/null
echo Shell error code: $? >> og.log
{ ft_strlen "$2" &> ft.log; } &> /dev/null
echo Shell error code: $? >> ft.log

difference=$(diff og.log ft.log)

if [ "$2" != "NULL" ]
then
	in="\"$2\""
else
	in=$2
fi

if [ "$difference" != "" ]
then
	printf "TEST $1 [strlen($in)] : KO\n" | tee -a trace.log
	echo "$difference" >> trace.log
else
	printf "TEST $1 [strlen($in)] : OK\n" | tee -a trace.log
	cat og.log >> trace.log
fi

rm og.log ft.log
