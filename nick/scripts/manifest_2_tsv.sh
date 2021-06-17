#!/bin/bash

#convert object from google chrome to a tsv of URL's for wget

for manifest in "../data_manifests/Dong-Wook/DW_SS4_VMH_manifest" "../data_manifests/Dong-Wook/DW_SS4_VMHvl_manifest"
do
	IN="${manifest}"
	OUT="${manifest}_wget.tsv"
	awk '{s=index($0,"http");e=index($0,".tar");print substr($0,s,e+4-s)}' $IN > $OUT
done