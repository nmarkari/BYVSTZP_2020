import os
import sys
import wget


url = 'https://data.mendeley.com/public-files/datasets/ypx3sw2f7c/files/c6138323-c7bc-4a85-86e9-add61912eb06/file_downloaded'
metadata = wget.download(url,'../../data/ref/DW_SS4_metadata.csv')
