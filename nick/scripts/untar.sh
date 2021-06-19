#!/bin/bash


for f in ../../data/raw/DW/SS4/VMH/*.tar
do 
	tar -xvf $f -C ../../data/raw/DW/SS4/VMH/
	rm $f
done

for f in ../../data/raw/DW/SS4/VMHvl/*.tar
do 
	tar -xvf $f -C ../../data/raw/DW/SS4/VMHvl/
	rm $f
done

