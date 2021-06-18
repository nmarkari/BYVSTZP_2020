#!/bin/bash

#retrieve grcm39 genome and gene annotations

OUT="../../data/ref/"

wget https://ftp.ncbi.nlm.nih.gov/genomes/all/annotation_releases/10090/109/GCF_000001635.27_GRCm39/GCF_000001635.27_GRCm39_genomic.fna.gz -P $OUT
wget https://ftp.ncbi.nlm.nih.gov/genomes/all/annotation_releases/10090/109/GCF_000001635.27_GRCm39/GCF_000001635.27_GRCm39_genomic.gtf.gz -P $OUT

gunzip -c ${OUT}GCF_000001635.27_GRCm39_genomic.fna.gz > $OUT/genome.fa
gunzip -c ${OUT}GCF_000001635.27_GRCm39_genomic.gtf.gz > $OUT/genes.gtf