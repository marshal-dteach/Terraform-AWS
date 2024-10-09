# S3 backend for Terraform

Make sure you have awscli and terraform installed.

#Usage
```
#SETTING UP ENV VARS
export AWS_SECRET_ACCESS_KEY=xxxx
export AWS_ACCESS_KEY_ID=xxxx
export AWS_DEFAULT_REGION=us-east-1

#DRY RUN
terraform init
terraform plan

#applying changes
terraform apply
```
