#!/bin/sh
gcc ./compute.c ./main.c ./genFloat.c -o c_work.exe
./c_work.exe ./input.txt ./output.txt