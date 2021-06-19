#!/bin/bash


for f in ../../data/raw/DW/SS4/VMH/TEST/*.tar
do 
	tar -xvf $f -C ../../data/raw/DW/SS4/VMH/TEST
	rm $f
done


