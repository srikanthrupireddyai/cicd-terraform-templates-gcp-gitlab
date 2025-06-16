#!/bin/bash
set -x
rm -rf .terraform/terraform.tfstate
rm -rf terraform.lock.hcl

if [[ $1 = 'dev' ]];then
  echo 'deploying to dev'
  export GOOGLE_PROJECT=possible-fabric-320701
  export GOOGLE_APPLICATION_CREDENTIALS="cred-dev.json"
  terraform init -backend-config=backend.dev.conf
fi

if [[ $1 = 'sit' ]];then
  echo 'deploying to sit'
  export GOOGLE_PROJECT=sample-sit
  export GOOGLE_APPLICATION_CREDENTIALS="cred-sit.json"
  terraform init -backend-config=backend.sit.conf
fi

if [[ $1 = 'uat' ]];then
  echo 'deploying to uat'
  export GOOGLE_PROJECT=sample-uat
  export GOOGLE_APPLICATION_CREDENTIALS="cred-uat.json"
  terraform init -backend-config=backend.uat.conf
fi

if [[ $1 = 'playground' ]];then
  echo 'deploying to playground'
  export GOOGLE_PROJECT=sample-playground-355303
  export GOOGLE_APPLICATION_CREDENTIALS="cred-playground.json"
  terraform init -backend-config=backend.playground.conf
fi

if [[ $1 = 'prod' ]];then
  echo 'deploying to prod'
  export GOOGLE_PROJECT=sample-prod
  export GOOGLE_APPLICATION_CREDENTIALS="cred-prod.json"
  terraform init -backend-config=backend.prod.conf
fi