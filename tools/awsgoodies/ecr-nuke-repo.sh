#!/bin/bash
REPOSITORY_NAME=$1

export AWS_PAGER=""
IMAGES_TO_DELETE=$(aws ecr list-images --repository-name $REPOSITORY_NAME --query 'imageIds[0:100]' --output json )

while [ "$IMAGES_TO_DELETE" != "[]" ]; do
	echo $IMAGES_TO_DELETE
    echo "Deleting another batch"
    aws ecr batch-delete-image --repository-name $REPOSITORY_NAME --image-ids "$IMAGES_TO_DELETE" || true
    IMAGES_TO_DELETE=$(aws ecr list-images --repository-name $REPOSITORY_NAME --query 'imageIds[0:100]' --output json )
done
aws ecr delete-repository --repository-name $REPOSITORY_NAME

