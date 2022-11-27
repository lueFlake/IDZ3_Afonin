#!/bin/sh
cd randomTesting
gcc ../compute.s ../main.s ../genFloat.s -o ../asm_work.exe
../asm_work.exe % ./results.s.txt