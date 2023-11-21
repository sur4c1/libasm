#!/bin/bash

{ og_write "$2" "$3" "$4" 2> og2.log > og1.log; } &> /dev/null
echo STDOUT : $(cat og1.log) STDERR : $(cat og2.log) > og.log
echo Shell error code: $? >> og.log
{ ft_write "$2" "$3" "$4" 2> ft2.log > ft1.log; } &> /dev/null
echo STDOUT : $(cat ft1.log) STDERR : $(cat ft2.log) > ft.log
echo Shell error code: $? >> ft.log

difference=$(diff og.log ft.log)

if [ "$3" != "NULL" ]
then
	in="\"$3\""
else
	in=$3
fi

if [ "$difference" != "" ]
then
	printf "TEST $1 [write($2, $in, $4)] : KO\n" | tee -a trace.log
	echo "$difference" >> trace.log
else
	printf "TEST $1 [write($2, $in, $4)] : OK\n" | tee -a trace.log
	cat og.log >> trace.log
fi

# rm og.log ft.log og2.log ft2.log og1.log ft1.log
