#!/bin/bash

#convert object from google chrome to a tsv of URL's for wget

TECH=$1
REGION=$2
for manifest in "../../nick/data_manifests/Yao/Yao_$TECH_$REGION.csv"
do
	IN="${manifest}"
	#OUT="${manifest}_wget.tsv"
	OUT="../../nick/data_manifests/Yao/Yao_$TECH_$REGION_wget.tsv"
	#removing quotation marks, comma so just the URL is left
	awk '{s=index($0,"http");e=index($0,".tar"); if ($0 != "]" && $0 != "[") print substr($0,s,e+4-s)}' $IN > $OUT
done
