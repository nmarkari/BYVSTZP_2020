#!/bin/bash

#convert NeMO manifest (which did not work with portal_client) to a tsv of URL's for wget

#for manifest_wget in "../../data/raw/data_manifests/Dong-Wook/DW_SS4_VMH_manifest_wget.tsv"
#do
#	while read -r URL
#	do
#		OUT="../../data/raw/DW/SS4/VMH"
#		wget $URL -P $OUT >> log.txt
#	done < $manifest_wget
#done

#for manifest_wget in "../../data/raw/data_manifests/Dong-Wook/DW_SS4_VMHvl_manifest_wget.tsv"
#do
#	while read -r URL
#	do
#		OUT="../../data/raw/DW/SS4/VMHvl"
#		wget $URL -P $OUT >> log.txt
#	done < $manifest_wget
#done
for manifest_wget in "../../nick/data_manifests/Yao/Yao_SS4_ACA_wget.tsv"
do
	while read -r URL
	do
		OUT="../../data/raw/Yao/SS4/ACA/"
		wget $URL -P $OUT >> log.txt
	done < $manifest_wget
done
