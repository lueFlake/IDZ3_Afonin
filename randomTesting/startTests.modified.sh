#!/bin/sh
cd randomTesting
gcc ../modified/compute.s ../modified/main.s ../modified/genFloat.s -o ../modified/asm_work.exe
../modified/asm_work.exe % ./results.modified.txt