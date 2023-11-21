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
