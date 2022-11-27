#!/bin/sh
cd tests
gcc ../optimized/compute.s ../optimized/main.s ../optimized/genFloat.s -o ../optimized/asm_work.exe
> ./results.optimized.txt 
for i in $(seq 1 5);
do
	../optimized/asm_work.exe ./test$i.txt out
	cat ./results.optimized.txt > tmp
	cat tmp out > ./results.optimized.txt
	rm -f tmp
	rm -f out
done