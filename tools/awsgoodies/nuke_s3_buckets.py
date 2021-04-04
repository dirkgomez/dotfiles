#!/usr/bin/env python3

# Nuke S3 buckets - pass in bucket names as the arguments

import sys
import boto3
import logging

boto3.set_stream_logger("boto3.resources", logging.DEBUG)

for bucket_name in sys.argv[1:]:
    s3 = boto3.resource('s3')
    bucket = s3.Bucket(bucket_name)
    print(f"About to delete objects in {bucket_name}")
    print(bucket.object_versions.delete())
    print(f"About to delete {bucket_name}")
    print(bucket.delete())
