#!/usr/bin/env bash

## Show commands (if you want to check, uncomment it)
##set -x

## Stop on errors
set -e

## Include config
source config.sh

## Set GCP compute zone
gcloud config set project ${PROJECT}
gcloud config set compute/zone ${ZONE}TAGS

## Create instance
gcloud compute instances create ${INSTANCE_NAME} \
--image-family ${IMAGE_FAMILY} \
--image-project ${IMAGE_PROJECT} \
--machine-type ${MACHINE_TYPE} \
--zone ${ZONE} \
--tags ${TAGS} \
--${DELETION_PROTECTION}
