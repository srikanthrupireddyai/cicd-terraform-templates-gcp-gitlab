#!/bin/bash
if [[ $1 = 'dev' ]];then
  echo 'deploying to dev'
  terraform plan -var-file dev.tfvars -var-file version.tfvars.json -out plan.cache
fi

if [[ $1 = 'sit' ]];then
  echo 'deploying to sit'
  terraform plan -var-file sit.tfvars -var-file version.tfvars.json -out plan.cache
fi

if [[ $1 = 'uat' ]];then
  echo 'deploying to uat'
  terraform plan -var-file uat.tfvars -var-file version.tfvars.json -out plan.cache
fi

if [[ $1 = 'playground' ]];then
  echo 'deploying to playground'
  terraform plan -var-file playground.tfvars -var-file version.tfvars.json -out plan.cache
fi

if [[ $1 = 'prod' ]];then
  echo 'deploying to prod'
  terraform plan -var-file prod.tfvars -var-file version.tfvars.json -out plan.cache
fi

terraform apply plan.cache
