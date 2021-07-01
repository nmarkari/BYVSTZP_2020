#!/bin/bash
  
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
echo 'BEGIN manifest_2_tsv.sh'
bash manifest_2_tsv.sh
echo 'BEGIN WGET.SH'
bash wget.sh
echo 'BEGIN untar'
bash untar.sh



#retrieve reference genome, use kb to preprocess data
echo 'BEGIN retrieve_genome.sh'
bash retrieve_genome.sh
echo 'BEGIN kb_index.sh'
bash kb_index.sh
echo 'BEGIN kb_count.sh'
bash kb_count.sh
echo 'BEGIN make_length_info.py'
python3 make_length_info.py
echo 'BEGIN make_adata.py'
./make_adata.py -m '../../data/preprocessed/Yao/SS4/ACA/matrix.abundance.mtx' -c '../../data/preprocessed/Yao/SS4/ACA/matrix.cells' -t '../../data/preprocessed/Yao/SS4/ACA/transcripts.txt' --outdir '../../data/preprocessed/Yao/SS4/ACA'
