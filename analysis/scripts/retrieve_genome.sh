#!/bin/bash

#retrieve grcm39 genome and gene annotations from ensembl on 6/18/2021

OUT="../../data/ref/"

wget http://ftp.ensembl.org/pub/release-104/fasta/mus_musculus/dna/Mus_musculus.GRCm39.dna.primary_assembly.fa.gz -P $OUT
wget http://ftp.ensembl.org/pub/release-104/gtf/mus_musculus/Mus_musculus.GRCm39.104.gtf.gz -P $OUT

gunzip -c ${OUT}Mus_musculus.GRCm39.dna.primary_assembly.fa.gz > $OUT/genome.fa
gunzip -c ${OUT}Mus_musculus.GRCm39.104.gtf.gz > $OUT/genes.gtf