#!/bin/sh
cd randomTesting
gcc ../optimized/compute.s ../optimized/main.s ../optimized/genFloat.s -o ../optimized/asm_work.exe
../optimized/asm_work.exe % ./results.optimized.txt