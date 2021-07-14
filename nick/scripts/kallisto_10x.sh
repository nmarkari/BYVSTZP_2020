#!/bin/bash


~/usr/local/bin/kallisto bus -i ../../data/ref/index.idx -o ../../data/preprocessed/Yao/10x/ACA  -x 10xv2 -t 16 ../../data/raw/Yao/10x/ACA/*/*R*
bustools count -o ../../data/preprocessed/Yao/10x/ACA/counts/ -m --cm -t ../../data/preprocessed/Yao/10x/ACA/transcripts.txt -g ../../data/ref/t2g.txt -e ../../data/preprocessed/Yao/10x/ACA/matrix.ec ../../data/preprocessed/Yao/10x/ACA/output.bus
~/usr/local/bin/kallisto quant-tcc -o ../../data/preprocessed/Yao/10x/ACA/quant/ -i ../../data/ref/index.idx -e ../../data/preprocessed/Yao/10x/ACA/counts/output.ec.txt -f ../../data/preprocessed/Yao/10x/ACA/flens.txt -t 12 -g ../../data/ref/t2g.txt ../../data/preprocessed/Yao/10x/ACA/counts/output.mtx
cp ../../data/preprocessed/Yao/10x/ACA/counts/output.barcodes.txt ../../data/preprocessed/Yao/10x/ACA/quant/