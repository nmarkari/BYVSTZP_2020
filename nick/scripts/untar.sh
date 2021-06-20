#!/bin/bash

#untar
#for f in ../../data/raw/DW/SS4/VMH/*.tar
#do 
#	tar -xvf $f -C ../../data/raw/DW/SS4/VMH/
#	rm $f
#done

for d in ../../data/raw/DW/SS4/VMH/TEST
do 
	gunzip -r $d -C $d
done

#for f in ../../data/raw/DW/SS4/VMHvl/*.tar
#do 
#	tar -xvf $f -C ../../data/raw/DW/SS4/VMHvl/
#	rm $f
#done

