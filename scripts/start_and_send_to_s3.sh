#!bin/bash

python ../source/main.py -t "hello my little ponny"
aws s3 cp ../Output/ --recursive https://S3.url