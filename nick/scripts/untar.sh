#!/bin/bash

TECH=$1
REGION=$2
#untar
for f in ../../data/raw/Yao/$TECH/$REGION/*.tar
do 
	tar -xvf $f -C ../../data/raw/Yao/$TECH/$REGION/
	rm $f
done

#for d in ../../data/raw/DW/SS4/VMH/*
#do
#        for f in $d/*
#        do
#                gunzip -c $f > ${f%.gz}
#                rm $f
#        done
#done


#for f in ../../data/raw/DW/SS4/VMHvl/*.tar
#do 
#	tar -xvf $f -C ../../data/raw/DW/SS4/VMHvl/
#	rm $f
#done

#for d in ../../data/raw/DW/SS4/VMHvl/*
#do
#        for f in $d/*
#        do
#                gunzip -c $f > ${f%.gz}
#                rm $f
#        done
#done
#for d in ../../data/raw/Yao/$TECH/$REGION/*
#do
#        for f in $d/*
#        do
#                gunzip -c $f > ${f%.gz}
#                rm $f
#        done
#done

