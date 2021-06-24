#!/usr/bin/env python
import csv
with open ('../../data/ref/length_info.txt','w') as ofile:
    tsvwriter = csv.reader(f2,delimiter="\t")
    f = open('../../data/ref/transcriptome.fa','r')
    lines = f.readlines()
    seq = False
    info = []
    for i in lines:
        if seq == False and not line.startswith('>')
            print("error: "+line)
            line = line[1:]
            info = line.split()
            seq = True
        if seq == True and line.startswith('>')
            print("error: "+line)
            length = len(line)
            tsvwriter.writerow(str(length),info[0],info[1],info[2],info[3],info[4],info[5],info[6],info[7])
            
        

