#!/usr/bin/env python

import requests
import json
import sys

img_id = sys.argv[1]
x      = sys.argv[2]
y      = sys.argv[3]
w      = sys.argv[4]
h      = sys.argv[5]

img_loc = "http://quip-data:9099/services/Camicroscope_DataLoader/DataLoader/query/getFileLocationByIID" 
payload = { "TCGAId" : str(img_id) }
r = requests.get(img_loc,params=payload)
img_meta = r.json()
img_file = str(img_meta[0]["file-location"])

tile_url = "http://quip-oss:5000/"+str(img_meta[0]["file-location"])
tile_url = tile_url+"/"+x+","+y+","+w+","+h+"/full/0/default.tif"
fr = requests.get(tile_url,stream=True)
f = open('image.tif','wb')
for chunk in fr:
   f.write(chunk)
f.close()

