#!/bin/bash

make testers &> /dev/null
prefix=srcs/testers/test_

echo -n "" > trace.log

printf	"strlen\n"
"$prefix"strlen.sh 1 ""
"$prefix"strlen.sh 2 "abcdefghijklmnopqrstuvwxyz"
"$prefix"strlen.sh 3 NULL
printf "\n\n\n" >> trace.log
echo ""

printf	"strcpy\n"
"$prefix"strcpy.sh 1 "" ""
"$prefix"strcpy.sh 2 "abcdefghijklmnopqrstuvwxyz" "abcdefghijklmnopqrstuvwxyz"
"$prefix"strcpy.sh 3 "abcdefghijklmnopqrstuvwxyz" "lorem ipsum"
"$prefix"strcpy.sh 4 "lorem ipsum" "abcdefghijklmnopqrstuvwxyz"
"$prefix"strcpy.sh 5 "" "lorem ipsum"
"$prefix"strcpy.sh 6 "lorem ipsum" ""
"$prefix"strcpy.sh 7 NULL "abcdefghijklmnopqrstuvwxyz"
"$prefix"strcpy.sh 8 "abcdefghijklmnopqrstuvwxyz" NULL
"$prefix"strcpy.sh 9 NULL NULL
printf "\n\n\n" >> trace.log
echo ""

printf	"strcmp\n"
"$prefix"strcmp.sh 1 "" ""
"$prefix"strcmp.sh 2 "abcdefghijklmnopqrstuvwxyz" "abcdefghijklmnopqrstuvwxyz"
"$prefix"strcmp.sh 3 "abcdefghijklmnopqrstuvwxyz" "lorem ipsum"
"$prefix"strcmp.sh 4 "lorem ipsum" "abcdefghijklmnopqrstuvwxyz"
"$prefix"strcmp.sh 5 "" "lorem ipsum"
"$prefix"strcmp.sh 6 "lorem ipsum" ""
"$prefix"strcmp.sh 7 NULL "abcdefghijklmnopqrstuvwxyz"
"$prefix"strcmp.sh 8 "abcdefghijklmnopqrstuvwxyz" NULL
"$prefix"strcmp.sh 9 NULL NULL
printf "\n\n\n" >> trace.log
echo ""

printf	"write\n"
"$prefix"write.sh 1		1 "" 0
"$prefix"write.sh 2		1 "bla" 0
"$prefix"write.sh 3		1 "bla" 3
"$prefix"write.sh 4		1 "abcdefghijklmnopqrstuvwxyz" 3
"$prefix"write.sh 5		1 "abcdefghijklmnopqrstuvwxyz" 26
"$prefix"write.sh 6		1 NULL 0
"$prefix"write.sh 7		1 NULL 3
"$prefix"write.sh 8		2 "" 0
"$prefix"write.sh 9		2 "bla" 0
"$prefix"write.sh 10	2 "bla" 3
"$prefix"write.sh 11	2 "abcdefghijklmnopqrstuvwxyz" 3
"$prefix"write.sh 12	2 "abcdefghijklmnopqrstuvwxyz" 26
"$prefix"write.sh 13	2 NULL 0
"$prefix"write.sh 14	2 NULL 3
"$prefix"write.sh 15	-1 "" 0
"$prefix"write.sh 16	-1 "bla" 0
"$prefix"write.sh 17	-1 "bla" 3
"$prefix"write.sh 18	-1 "abcdefghijklmnopqrstuvwxyz" 3
"$prefix"write.sh 19	-1 "abcdefghijklmnopqrstuvwxyz" 26
"$prefix"write.sh 20	-1 NULL 0
"$prefix"write.sh 21	-1 NULL 3
"$prefix"write.sh 22	BROKEN "" 0
"$prefix"write.sh 23	BROKEN "bla" 0
"$prefix"write.sh 24	BROKEN "bla" 3
"$prefix"write.sh 25	BROKEN "abcdefghijklmnopqrstuvwxyz" 3
"$prefix"write.sh 26	BROKEN "abcdefghijklmnopqrstuvwxyz" 26
"$prefix"write.sh 27	BROKEN NULL 0
"$prefix"write.sh 28	BROKEN NULL 3
printf "\n\n\n" >> trace.log
echo ""
