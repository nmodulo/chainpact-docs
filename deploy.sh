#!/bin/bash 
mkdocs build
bucket=docs.chainpact.xyz
# -m: parallel, -q: quiet, -r: recursive
gsutil -m -q rsync -r site gs://$bucket
echo "Synced with gs://$bucket"