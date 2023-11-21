#!/bin/bash

echo -n "" > trace.log

printf	"strlen\n"
srcs/testers/test_strlen.sh 1 ""
srcs/testers/test_strlen.sh 2 "abcdefghijklmnopqrstuvwxyz"
srcs/testers/test_strlen.sh 3 NULL
