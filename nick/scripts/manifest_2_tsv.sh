#!/bin/bash

#convert object from google chrome to a tsv of URL's for wget

for manifest in "../../nick/data_manifests/Yao/Yao_SS4_ACA.csv"
do
	IN="${manifest}"
	#OUT="${manifest}_wget.tsv"
	OUT = "../../nick/data_manifests/Yao/Yao_SS4_ACA_wget.tsv"
	#removing quotation marks, comma so just the URL is left
	awk '{s=index($0,"http");e=index($0,".tar");print substr($0,s,e+4-s)}' $IN > $OUT
done
