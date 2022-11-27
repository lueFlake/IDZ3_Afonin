#!/bin/sh
gcc ./compute.s ./main.s ./genFloat.s -o asm_work.exe
./asm_work.exe ./input.txt ./output.txt