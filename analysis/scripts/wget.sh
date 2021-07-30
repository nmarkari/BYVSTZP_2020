#!/bin/bash

#first convert NeMO manifest (which did not work with portal_client) to a tsv of URL's for wget
TECH=$1
REGION=$2

for manifest_wget in "../../analysis/data_manifests/Yao/Yao_${TECH}_${REGION}_wget.tsv"
do
	while read -r URL
	do
		OUT="../../data/raw/Yao/$TECH/$REGION/"
		wget $URL -P $OUT >> log.txt
	done < $manifest_wget
done