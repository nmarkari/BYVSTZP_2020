#!/bin/bash
set -o errexit 
#executes other scripts in this folder from start to finish

#retrieve data

#the following code was pasted into the google chrome console from this site http://data.nemoarchive.org/biccn/grant/u19_zeng/zeng/transcriptome/scell/ (in the VMH and VMHvl folders)
#the object outputted by that was copied and pasted to make the manifest.tsv files
#var arr = [], l = document.links;
#for(var i=0; i<l.length; i++) {
#if (l[i].href.split(".").slice(-2).join(".") === "fastq.tar"){
#        arr.push(l[i].href);
#    }
#}
#SS: HIP, ORB, ENTm, ENTl, SUB-ProS done. PAR POST Pre made an empty manifest
#ORB SM-GE66Z_S370_E1-50_R2.fastq.gz did not exist, deleted it and it worked, but havent made adata yet
for REGION in 'HIP'
do
	if [ ! -d "../../data/raw/Yao/10x/$REGION" ]; then
		mkdir "../../data/raw/Yao/10x/$REGION"
	fi
	if [ ! -d "../../data/preprocessed/Yao/10x/$REGION" ]; then
		mkdir "../../data/preprocessed/Yao/10x/$REGION"
	fi
	echo "BEGIN REGION: " $REGION

	#BUILD REF
	if [ ! -d "../../data/ref" ]; then
		mkdir ../../data/ref
	    echo "BEGIN retrieve_genome.sh"
		bash retrieve_genome.sh
		echo "BEGIN kb_index.sh"
		bash kb_index.sh
		echo "BEGIN make_length_info.py"
		python3 make_length_info.py
	fi

	#10x
	#echo "BEGIN manifest_2_tsv.sh SS4 $REGION"
	#bash manifest_2_tsv.sh $REGION
	echo "BEGIN make_manifest.py 10x $REGION"
	./make_manifest.py -tech "10x" -region $REGION
	echo "BEGIN wget.sh SS4 $REGION"
	bash wget.sh SS4 $REGION
	echo "BEGIN untar.sh SS4 $REGION"
	bash untar.sh SS4 $REGION
	echo "BEGIN kallisto_count.sh SS4 $REGION"
	bash kallisto_count.sh SS4 $REGION
	#echo "BEGIN make_adata.py SS4 $REGION"
	#./make_adata.py -m "../../data/preprocessed/Yao/SS4/$REGION/matrix.abundance.mtx" \
	#	-c "../../data/preprocessed/Yao/SS4/$REGION/matrix.cells" -t "../../data/preprocessed/Yao/SS4/$REGION/transcripts.txt" \
	#	-meta "../metadata_files/CTX_Hip_anno_SSv4.csv" --outdir "../../data/preprocessed/Yao/SS4/$REGION" -region $REGION
	echo "DELETING fastqs for SS4 $REGION"
	rm -r ../../data/raw/Yao/SS4/$REGION/*
	
done
