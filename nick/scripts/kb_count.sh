#!/bin/bash

#need to put in a script to make batch.txt files

~/usr/local/bin/kallisto pseudo --quant -i ../../data/ref/index.idx -o ../../data/preprocessed/DW/SS4/VMH_output  -b ../../data/preprocessed/DW/SS4/VMH/batch.txt -t 16
~/usr/local/bin/kallisto pseudo --quant -i ../../data/ref/index.idx -o ../../data/preprocessed/DW/SS4/VMHvl_output  -b ../../data/preprocessed/DW/SS4/VMHvl/batch.txt -t 16

kb count -i ../../data/ref/index.idx -g ../../data/ref/t2g.txt -x SMARTSEQ -o ../../data/preprocessed/DW/SS4/VMH -t 16 --h5ad ../../data/preprocessed/DW/SS4/VMH/batch.txt
kb count -i ../../data/ref/index.idx -g ../../data/ref/t2g.txt -x SMARTSEQ -o ../../data/preprocessed/DW/SS4/VMHvl -t 16 --h5ad ../../data/preprocessed/DW/SS4/VMHvl/batch.txt
