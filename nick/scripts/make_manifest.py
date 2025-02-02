#!/usr/bin/env python3

import pandas as pd
import argparse

def main(tech, region):
	all_metadata = pd.read_csv('../metadata_files/CTX_Hip_anno_SSv4.csv')
	all_metadata = all_metadata.rename(columns={'exp_component_name':'cell_id'})
	metadata = all_metadata.loc[lambda df: df['region_label'] == region, :]

	all_fastqs = pd.read_csv('../manifest_complete_and_mostly_complete_regions.tsv', sep='\t', header=None, names=['url'])
	all_fastqs['cell_id'] = all_fastqs['url'].apply(lambda x: x.split("/")[13])
	all_fastqs['cell_id'] = all_fastqs['cell_id'].apply(lambda x: x.split(".")[0])
	all_fastqs

	set_intersection = all_fastqs.merge(metadata[['cell_id']], how='inner', on='cell_id')
	set_intersection

	manifest = set_intersection.url
	manifest

	return manifest

if __name__ == "__main__":
	p = argparse.ArgumentParser(description="generates manifest for biccn ftp site")
	p.add_argument("-tech", action="store", dest="tech",help="sequencing technology")
	p.add_argument("-region", action="store", dest="region",help="brain region")
	args = p.parse_args()
	manifest = main(args.tech, args.region)
	manifest.to_csv('../../nick/data_manifests/Yao/Yao_'+args.tech+'_'+args.region+'_wget.tsv',sep='\t',index=False,header=False)
