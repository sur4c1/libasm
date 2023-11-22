#!/bin/bash

{ og_read "$2" "$3" "$4" &> og.log; } &> /dev/null
echo Shell error code: $? >> og.log
{ ft_read "$2" "$3" "$4" &> ft.log; } &> /dev/null
echo Shell error code: $? >> ft.log

difference=$(diff og.log ft.log)

if [ "$difference" != "" ]
then
	printf "TEST $1 [read($2, $3, $4)] : KO\n" | tee -a trace.log
	echo "$difference" >> trace.log
else
	printf "TEST $1 [read($2, $3, $4)] : OK\n" | tee -a trace.log
	cat og.log >> trace.log
fi

rm og.log ft.log
