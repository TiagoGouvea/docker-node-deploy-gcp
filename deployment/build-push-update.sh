#!/usr/bin/env bash
echo -e "\nDeploy  remote instance"

echo -e "\n# 1/X - Loading and setting options..."
## Show commands (if you want to check, uncomment it)
set -x

## Stop on errors
set -e

## Include config
source config.sh

## Set GCP compute zone
gcloud config set project ${PROJECT}
gcloud config set compute/zone ${ZONE}

#echo -e "\n# 2/X - Building (and tagging) docker image..."
## Build and push backend
#cd ../backend/
#docker build -f Dockerfile -t ${IMAGE_TAG}  .
#docker tag ${IMAGE_TAG} ${CONTAINER_IMAGE}
#
#echo -e "\n# 3/X - Pushing image to Google Container Registry..."
#docker push ${CONTAINER_IMAGE}
#
#echo -e "\n# 4/X - Updating remote config files..."
#cd ../deployment/

echo -e "\n# 4/X - Pulling and starting remote container..."
gcloud beta compute --project ${PROJECT} ssh ${INSTANCE_NAME} --zone ${ZONE} --command="cd ${REMOTE_PATH} && docker stop \$(docker ps -aq) && docker rm \$(docker ps -aq) && docker run -d -p 80:8080 --name=${IMAGE_TAG} ${CONTAINER_IMAGE} "

echo -e "\nInstance updated!"
