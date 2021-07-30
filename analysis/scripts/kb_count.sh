#!/bin/bash

#need to put in a script to make batch.txt files

#ls ../../data/raw/Yao/SS4/10x/*/*R1.fastq | sort | awk '{cell=substr($1,0,length($1)-9); print cell, cell"_R1.fastq ", cell"_R2.fastq" }' OFS="\t" > ../../data/preprocessed/Yao/10x/ACA/batch.txt
#kb count -i ../../data/ref/index.idx -g ../../data/ref/t2g.txt -x 10xv2 -o ../../data/preprocessed/Yao/10x/ACA -t 16 --h5ad ../../data/preprocessed/Yao/10x/ACA
kb count --tcc -i ../../data/ref/index.idx -g ../../data/ref/t2g.txt -x 10xv2 -o ../../data/preprocessed/Yao/10x/ACA -t 16 --h5ad ../../data/raw/Yao/10x/ACA/*/*R*


