#!/bin/#!/usr/bin/env bash
#Authorizing the project
gcloud auth list
gcloud config list project
gcloud config set project ${projectid}

#Enabling the API's
#To see a list of available services for a project, run:
gcloud services list --available
gcloud services enable $SERVICE_NAME

#Enable the below services
#Google kubernatives engine API
#Google container registry API
#Google container Builder API
#Cloud source repositories API

gcloud services enable container.googleapis.com --async
gcloud services enable containerregistry.googleapis.com --async
gcloud services enable cloudbuild.googleapis.com --async
gcloud services enable sourcerepo.googleapis.com --async

#install google cloud SDK. Install kubectl after that
gcloud components install kubectl

#create kubernatives cluster with nodes
gcloud beta container --project "${PROJECT}" clusters create "your-first-cluster-1" --zone "us-central1-a" --no-enable-basic-auth
--cluster-version "1.14.8-gke.17" --machine-type "g1-small" --image-type "COS" --disk-type "pd-standard" --disk-size "30" --metadata
disable-legacy-endpoints=true --scopes "https://www.googleapis.com/auth/devstorage.read_only","https://www.googleapis.com/auth/logging.write","https://www.googleapis.com/auth/monitoring","https://www.googleapis.com/auth/servicecontrol","https://www.googleapis.com/auth/service.management.readonly","https://www.googleapis.com/auth/trace.append" 
--num-nodes "3" --no-enable-cloud-logging --no-enable-cloud-monitoring --enable-ip-alias --network "projects/google.com:netdesign-demo/global/networks/default" --default-max-pods-per-node "110" --enable-autoscaling
--min-nodes "2" --max-nodes "3" --addons HorizontalPodAutoscaling,HttpLoadBalancing --enable-autoupgrade --enable-autorepair
