#!/bin/bash

make strlen > /dev/null

../../og_strlen $2 &> og.log
../../ft_strlen $2 &> ft.log

local difference = $(diff og.log ft.log)

if [ "$difference" != ""]
then
	printf "TEST $1 [strlen($2)] : KO\n" >> trace.log
	echo "$difference" >> trace.log
	echo KO
else
	printf "TEST $1 [strlen($2)] : OK\n" >> trace.log
	echo OK
fi

rm og.log ft.log
