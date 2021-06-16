#!/bin/bash

#convert NeMO manifest (which did not work with portal_client) to a tsv of URL's for wget

for manifest in "../data_manifests/Dong-Wook/NeMO_manifest_DW_SMARTseqv4"
do
	IN="${manifest}.tsv"
	OUT="${manifest}_wget.tsv"
	awk 'NR>1 {p=index($5,",");print $1, substr($5,p+1)}' $IN > $OUT
done