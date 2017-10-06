#!/bin/bash
java -version 1>log.txt 2>&1
cat log.txt
printf "\n"
read -p "Press any key to continue... " -n1 -s
printf "\n"
