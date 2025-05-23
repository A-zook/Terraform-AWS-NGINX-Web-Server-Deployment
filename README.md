# Scalable Web App Deployment on AWS using Terraform

This repository contains Terraform configurations for provisioning a scalable web application infrastructure on AWS. The setup includes deploying NGINX web servers across three environments: **development**, **staging**, and **production**.


## Features

- AWS EC2 instance provisioning
- NGINX installation and configuration via user-data
- Environment-specific configurations (dev, staging, prod)
- Modular Terraform architecture (compute, network, data)
- Remote backend support with S3 (for state management)
- Uses key pair authentication (e.g., `Key-Pair-Name`)

## Requirements

- [Terraform](https://www.terraform.io/downloads.html)
- AWS CLI configured with proper credentials
- An existing AWS S3 bucket for remote backend (e.g., `bucket name`)
- A pre-created AWS key pair (e.g., `Key-Pair-Name`)
