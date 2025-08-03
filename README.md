# Terraform-AWS Infrastructure

This repository contains Terraform configurations implementing AWS infrastructure with best practices. The project includes configurations for setting up a secure S3 backend for Terraform state management and a production-ready ECS Fargate cluster.

## Project Structure

```
├── s3-backend/          # Terraform state backend configuration
│   ├── main.tf         # S3 bucket and DynamoDB table for state management
│   ├── outputs.tf      # Backend resource outputs
│   └── README.md       # Backend-specific documentation
├── fargate-cluster/    # ECS Fargate cluster configuration
│   ├── main.tf         # Core infrastructure resources
│   ├── variables.tf    # Input variables
│   └── provider.tf     # AWS provider configuration
```

## Features

### S3 Backend Configuration
- Secure S3 bucket for state storage with:
  - Server-side encryption (AES256)
  - Versioning enabled
  - Public access blocking
  - Lifecycle rules for state management
- DynamoDB table for state locking
- Account-specific unique naming

### ECS Fargate Cluster
- High Availability Architecture:
  - Multi-AZ deployment
  - Auto-scaling capable
  - Load balanced with ALB
- Network Security:
  - VPC with public and private subnets
  - NAT Gateways for private subnet access
  - Security groups with least privilege
- Container Infrastructure:
  - Fargate for serverless container management
  - Task definitions with proper resource allocation
  - Service discovery enabled
- Monitoring and Logging:
  - CloudWatch logging configuration
  - ALB access logging
  - Container health checks

## Prerequisites

- Terraform >= 0.12
- AWS CLI configured with appropriate credentials
- AWS account with required permissions

## Usage

### 1. Setting up the Backend

First, deploy the S3 backend:

```bash
cd s3-backend
terraform init
terraform plan
terraform apply
```

### 2. Deploying the Fargate Cluster

Update the backend configuration in `fargate-cluster/provider.tf` with the S3 bucket name, then:

```bash
cd fargate-cluster
terraform init
terraform plan
terraform apply
```

## Configuration Variables

### Fargate Cluster

| Variable | Description | Default |
|----------|-------------|---------|
| aws_region | AWS region | us-east-1 |
| environment | Environment name | dev |
| az_count | Number of AZs to use | 2 |
| app_port | Application port | 80 |
| app_count | Number of containers | 2 |
| fargate_cpu | Fargate instance CPU units | 256 |
| fargate_memory | Fargate instance memory | 512 |

## Security Features

- VPC security groups with least privilege access
- Private subnets for container workloads
- Encrypted state storage
- No public S3 bucket access
- ALB with configurable security rules

## Best Practices Implemented

- Infrastructure as Code using Terraform
- State management with versioning and locking
- Resource tagging for better management
- Proper resource naming conventions
- Modular architecture
- Security-first approach

## Contributing

1. Fork the repository
2. Create a feature branch
3. Commit your changes
4. Push to the branch
5. Create a Pull Request
