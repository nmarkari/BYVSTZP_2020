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
bash manifest_2_tsv.sh
bash wget.sh


#retrieve reference genome, use kb to preprocess data
bash retrieve_genome.sh
bash kb_index.sh
bash kb_count.sh