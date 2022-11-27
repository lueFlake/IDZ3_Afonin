#!/bin/sh
cd randomTesting
gcc ../compute.c ../main.c ../genFloat.c -o ../asm_work.exe
../asm_work.exe % ./results.c.txt