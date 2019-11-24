#!/bin/#!/usr/bin/env bash

#gke credentials
gcloud container clusters get-credentials $clustername --zone $zonename --project $projectname

DOCKERIMAGE = $DOCKERIMAGE
kubectl apply -f xyz.yaml

#rolling update
kubectl rollout status deployment options

#rolling back
kubectl rollout undo deployment options
