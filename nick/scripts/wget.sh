#!/bin/bash

#convert NeMO manifest (which did not work with portal_client) to a tsv of URL's for wget

for manifest_wget in "../data_manifests/Dong-Wook/NeMO_manifest_DW_SMARTseqv4_wget.tsv"
do
	while read -r URL
	do
	   wget $URL -P "../../data/DW/SS4"
	done < $manifest_wget
done