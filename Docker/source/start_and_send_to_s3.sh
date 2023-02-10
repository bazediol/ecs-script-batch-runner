#!/bin/bash

python main.py
aws s3 cp Output/  https://S3.url  $BUCKET_NAME --recursive