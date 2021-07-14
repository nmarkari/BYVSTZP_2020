#!/bin/bash

TECH=$1
REGION=$2 
#~/usr/local/bin/kallisto pseudo --quant -i ../../data/ref/index.idx -o ../../data/preprocessed/DW/SS4/VMH_output  -b ../../data/preprocessed/DW/SS4/VMH/batch.txt -t 16
#~/usr/local/bin/kallisto pseudo --quant -i ../../data/ref/index.idx -o ../../data/preprocessed/DW/SS4/VMHvl_output  -b ../../data/preprocessed/DW/SS4/VMHvl/batch.txt -t 16


#kb count -i ../../data/ref/index.idx -g ../../data/ref/t2g.txt -x SMARTSEQ -o ../../data/preprocessed/DW/SS4/VMH_output -t 16 --h5ad ../../data/preprocessed/DW/SS4/VMH/batch.txt
#kb count -i ../../data/ref/index.idx -g ../../data/ref/t2g.txt -x SMARTSEQ -o ../../data/preprocessed/DW/SS4/VMHvl_output -t 16 --h5ad ../../data/preprocessed/DW/SS4/VMHvl/batch.txt


# make batch.txt file
ls ../../data/raw/Yao/$TECH/$REGION/*/*R1.fastq.gz | sort | awk '{cell=substr($1,0,length($1)-12); print cell, cell"_R1.fastq.gz ", cell"_R2.fastq.gz" }' OFS="\t" > ../../data/preprocessed/Yao/$TECH/$REGION/batch.txt
#run kallisto
~/usr/local/bin/kallisto pseudo --quant -i ../../data/ref/index.idx -o ../../data/preprocessed/Yao/$TECH/$REGION  -b ../../data/preprocessed/Yao/$TECH/$REGION/batch.txt -t 16
