#!/bin/bash
REPOSITORY_NAME=$1

IMAGES_TO_DELETE=$(aws ecr list-images --repository-name $REPOSITORY_NAME --query 'imageIds[0:100]' --filter "tagStatus=UNTAGGED" --output json )

while [ "$IMAGES_TO_DELETE" != "[]" ]; do
	echo $IMAGES_TO_DELETE
    echo "Deleting another batch"
    aws ecr batch-delete-image --repository-name $REPOSITORY_NAME --image-ids "$IMAGES_TO_DELETE" || true
    IMAGES_TO_DELETE=$(aws ecr list-images --repository-name $REPOSITORY_NAME --query 'imageIds[0:100]' --filter "tagStatus=UNTAGGED" --output json )
done

