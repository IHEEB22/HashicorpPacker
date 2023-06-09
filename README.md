# HachicorpPacker
[![License](https://img.shields.io/badge/License-HashiCorp-blue.svg)](LICENSE)



## Description

Packer is an open source tool for creating identical machine images for multiple platforms from a single source configuration. Packer is lightweight, runs on every major operating system, and is highly performant, creating machine images for multiple platforms in parallel.

This project demonstrates how to use Packer, Ansible, and Terraform to automate the creation and deployment of a custom image on Azure. The custom image is built using Packer with Ansible provisioner for configuration management, and then deployed on Azure using Terraform.

## Prerequisites

- Azure subscription
- Azure CLI
- Packer
- Ansible
- Terraform

## Usage

Follow the steps below to use this project:

1. Clone the repository:

   ```bash
   git clone https://github.com/yourusername/your-repo.git
2. Navigate to the packer templates directory:

   ```bash
   cd packer_templates
3. Run packer format :

   ```bash
   packer fmt <file_name>
4. validate the pakcer template file :

   ```bash
   packer validate <file_name>
5. Build the packer template file :

   ```bash
   packer build <file_name>
5. Inspect the template file :

   ```bash
   packer inspect <file_name> 
 
