#!/bin/bash

TECH=$1
REGION=$2
#untar
for f in ../../data/raw/Yao/$TECH/$REGION/*.tar
do 
	tar -xvf $f -C ../../data/raw/Yao/$TECH/$REGION/
	rm $f
done

#for d in ../../data/raw/Yao/$TECH/$REGION/*
#do
#        for f in $d/*
#        do
#                gunzip -c $f > ${f%.gz}
#                rm $f
#        done
#done


