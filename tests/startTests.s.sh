#!/bin/sh
cd tests
gcc ../compute.s ../main.s ../genFloat.s -o ../asm_work.exe
> ./results.s.txt 
for i in $(seq 1 5);
do
	../asm_work.exe ./test$i.txt out
	cat ./results.s.txt > tmp
	cat tmp out > ./results.s.txt
	rm -f tmp
	rm -f out
done