#!/bin/bash

python main.py

aws s3 cp Output/  s3://$BUCKET_NAME --recursive