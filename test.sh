#!/bin/bash

make testers

printf	"strlen\n"
srcs/testers/test_strlen.sh 1 ""
srcs/testers/test_strlen.sh 1 "nwrjihnowrnhwrnohnwor"
srcs/testers/test_strlen.sh 1 NULL
