#!/bin/bash

REPO=$1
MAX_DATE=$2

ALL_IMAGE_TAGS=$(aws ecr describe-images --repository-name $REPO --query "imageDetails[?imagePushedAt<\`$MAX_DATE\`].imageTags[0]" --output text | sed -e 's/[[:space:]^]/ imageTag=/g' -e 's/^/imageTag=/')

#for IMAGE_TAGS in "$(echo $ALL_IMAGE_TAGS|cut -d ' ' -f1-20)"; do

while [ -n "$ALL_IMAGE_TAGS" ]; do
    IMAGE_TAGS="$(echo $ALL_IMAGE_TAGS|cut -d ' ' -f1-100)"
    aws ecr batch-delete-image --repository-name $REPO --image-ids $IMAGE_TAGS
    ALL_IMAGE_TAGS="$(echo $ALL_IMAGE_TAGS|cut -d ' ' -f101-)"
done