# HachicorpPacker


## Description

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
2. Navigate to the packer directory:

   ```bash
   cd packer_templates
3. Run packer format :

   ```bash
   packer fmt <file_name>
4. Run packer validate :

   ```bash
   packer validate <file_name>
5. Build the packer template file :

   ```bash
   packer build <file_name>
 
