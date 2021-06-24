#!/usr/bin/env python
import csv
with open ('../../data/ref/length_info.txt','w') as ofile:
    tsvwriter = csv.writer(ofile,delimiter="\t")
    f = open('../../data/ref/transcriptome.fa','r')
    lines = f.readlines()
    seq = False
    info = []
    for line in lines:
        if seq == False:
            if not line.startswith('>'):
                print("error: "+line)
            line = line[1:]
            info = line.split()
            seq = True
        else:
            if line.startswith('>'):
                print("error: "+line)
            length = len(line.strip())
            newline = [str(length)] + info
            tsvwriter.writerow(newline)
            info = []
            seq = False