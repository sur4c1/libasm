#!/bin/bash

{ og_read "$2" "$3" "$4" &> og.log; } &> /dev/null
echo Shell error code: $? >> og.log
{ ft_read "$2" "$3" "$4" &> ft.log; } &> /dev/null
echo Shell error code: $? >> ft.log

difference=$(diff og.log ft.log)

if [ "$difference" != "" ]
then
	printf "TEST %2d \e[1m\e[38;5;9mKO\e[0m [read($2, $3, $4)]\n" $1 | tee -a trace.log
	echo "$difference" >> trace.log
else
	printf "TEST %2d \e[1m\e[38;5;10mOK\e[0m [read($2, $3, $4)]\n" $1 | tee -a trace.log
	cat og.log >> trace.log
fi

rm og.log ft.log
