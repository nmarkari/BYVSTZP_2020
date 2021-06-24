#!/bin/bash

kb count -i ../../data/ref/index.idx -g ../../data/ref/t2g.txt -x SMARTSEQ -o ../../data/preprocessed/DW/SS4/VMH -t 16 --h5ad ../../data/raw/DW/SS4/VMH/*/*.fastq
kb count -i ../../data/ref/index.idx -g ../../data/ref/t2g.txt -x SMARTSEQ -o ../../data/preprocessed/DW/SS4/VMHvl -t 16 --h5ad ../../data/raw/DW/SS4/VMHvl/*/*.fastq
