#!/bin/sh
cd tests
gcc ../compute.c ../main.c ../genFloat.c -o ../asm_work.exe
> ./results.c.txt 
for i in $(seq 1 5);
do
	../asm_work.exe ./test$i.txt out
	cat ./results.c.txt > tmp
	cat tmp out > ./results.c.txt
	rm -f tmp
	rm -f out
done