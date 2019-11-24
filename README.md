Create an organization in Google Cloud
Create a project under that organization



Main Steps:
Package and deploy the app on google kubernatives engine.
  a) Package the app into a Docker image
  b) Run the container
  c) Upload image to a registry
  d) Create container cluster
  e) Deploy the app to the Cluster
  f) Expose the app to the Internet
  g) Scare up the deployment if required.
  h) Deploy new version using CI/CD - Jenkins

  step1:

  setting up project
  Enable the Google cloud API's using the script attached.
  File Name:  enable_api.sh

  Step 2:
  Build the container image:

  export PROJECT_ID=[projectid]
  docker build -t gcr.io/${PROJECT_ID}/myapp:v1

  #verify the command is successfull
  docker images

  step3:
  Upload the container image:

  configure docker to authenticate to container registry.
  gcloud auth configure-docker

  upload the image to container registry
  docker push gcr.io/$PROJECT_ID/myapp:v1

  step4:
  Deploy the application
  kubectl create deployment myapp --image=gcr.io/$PROJECT_ID/myapp:v1

  step5:
  Expose the app to Internet

  kubectl expose deployment myapp -type=loadbalancer --port 80 --target-port 8080


  step6:
  scale up the application
  kubectl scale deployment myapp --replicas=3

  step7:
  use rolling update to the existing deployment with a new version
  kubectl set image deployment/myapp myapp=gcr.io/$PROJECT_ID/myapp:v2

  CI/CD STEPS:


Push docker image to google container registry using Jenkins

step1 #Install
 - required Jenkins Plugins
 - Google Oauth credentials Plugins
 - Docker pipeline Plugins
 - Google container registry Auth Plugins

 step 2 #Create
  - service account in GCP

  Attach roles - storage - storage admin & storage object viewer

  step 3 #Jenkins - credentials- global credentials - Add credentials
  Select kind : Google service account from private key

  we can use the json file which we get when we create a service account

  step 4:
  jenkins project > configure > Build > docker build and publish


  The above steps helps to pull the code and push image to GCR repository.

  The script kube_deploy.sh will deploy the image to kubernatives cluster running on GCP
