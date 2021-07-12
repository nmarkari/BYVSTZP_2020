#!/bin/bash


#~/usr/local/bin/kallisto pseudo --quant -i ../../data/ref/index.idx -o ../../data/preprocessed/DW/SS4/VMH_output  -b ../../data/preprocessed/DW/SS4/VMH/batch.txt -t 16
#~/usr/local/bin/kallisto pseudo --quant -i ../../data/ref/index.idx -o ../../data/preprocessed/DW/SS4/VMHvl_output  -b ../../data/preprocessed/DW/SS4/VMHvl/batch.txt -t 16


#kb count -i ../../data/ref/index.idx -g ../../data/ref/t2g.txt -x SMARTSEQ -o ../../data/preprocessed/DW/SS4/VMH_output -t 16 --h5ad ../../data/preprocessed/DW/SS4/VMH/batch.txt
#kb count -i ../../data/ref/index.idx -g ../../data/ref/t2g.txt -x SMARTSEQ -o ../../data/preprocessed/DW/SS4/VMHvl_output -t 16 --h5ad ../../data/preprocessed/DW/SS4/VMHvl/batch.txt


# make batch.txt file
ls ../../data/raw/Yao/SS4/ACA/*/*R1.fastq | sort | awk '{cell=substr($1,0,length($1)-9); print cell, cell"_R1.fastq ", cell"_R2.fastq" }' OFS="\t" > ../../data/preprocessed/Yao/SS4/ACA/batch.txt
#run kallisto
~/usr/local/bin/kallisto pseudo --quant -i ../../data/ref/index.idx -o ../../data/preprocessed/Yao/SS4/ACA  -b ../../data/preprocessed/Yao/SS4/ACA/batch.txt -t 16
