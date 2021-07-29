#!/bin/bash
set -o errexit 
#executes other scripts in this folder from start to finish


#SS: HIP, ORB, ENTm, ENTl, SUB-ProS done. PAR POST Pre made an empty manifest
#ORB SM-GE66Z_S370_E1-50_R2.fastq.gz did not exist, deleted it and it worked, but havent made adata yet
#for REGION in 'RSP' 'TEa-PERI-ECT' 'AI' 'PL-ILA'
#for REGION in 'HIP'
#for REGION in 'VIS' 'PTLp' 'SSs' 'GU' 'AUD' 'ACA'
for REGION in 'HIP'
do
	if [ ! -d "../../data/raw/Yao/SS4/$REGION" ]; then
		mkdir "../../data/raw/Yao/SS4/$REGION"
	fi
		#mkdir "../../data/raw/Yao/10x/$REGION"
		#mkdir "../../data/preprocessed/Yao/10x/$REGION"
	if [ ! -d "../../data/preprocessed/Yao/SS4/$REGION" ]; then
		mkdir "../../data/preprocessed/Yao/SS4/$REGION"
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

	#SMARTSEQ
	##echo "BEGIN manifest_2_tsv.sh SS4 $REGION" #DEPRECATED
	##bash manifest_2_tsv.sh $REGION
	echo "BEGIN make_manifest.py SS4 $REGION"
	./make_manifest.py -tech "SS4" -region $REGION
	echo "BEGIN wget.sh SS4 $REGION"
	bash wget.sh SS4 $REGION
	echo "BEGIN untar.sh SS4 $REGION"
	bash untar.sh SS4 $REGION
	echo "BEGIN kallisto_count.sh SS4 $REGION"
	bash kallisto_count.sh SS4 $REGION
	echo "BEGIN make_adata.py SS4 $REGION"
	./make_adata.py -m "../../data/preprocessed/Yao/SS4/$REGION/matrix.abundance.mtx" \
		-c "../../data/preprocessed/Yao/SS4/$REGION/matrix.cells" -t "../../data/preprocessed/Yao/SS4/$REGION/transcripts.txt" \
		-meta "../metadata_files/CTX_Hip_anno_SSv4.csv" --outdir "../../data/preprocessed/Yao/SS4/$REGION" -region $REGION
	echo "DELETING fastqs for SS4 $REGION"
	rm -r ../../data/raw/Yao/SS4/$REGION/*
	
done
