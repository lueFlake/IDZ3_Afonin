#!/bin/sh
cd tests
gcc ../modified/compute.s ../modified/main.s ../modified/genFloat.s -o ../modified/asm_work.exe
> ./results.modified.txt 
for i in $(seq 1 5);
do
	../modified/asm_work.exe ./test$i.txt out
	cat ./results.modified.txt > tmp
	cat tmp out > ./results.modified.txt
	rm -f tmp
	rm -f out
done