# Data Science Environment

Solution based on Azure Storage Blob, Azure VNet and AKS Container Deployment, Databricks Workspace, Salesforce Connection, Teradata Connection, PFNA Data Lake Connection, Data Hub Connection, Oracle Database Connection in Production reference architecture deployed on Azure

## Running the automation

There are three different options for how to configure and run the automation:

- Interactive prompts
- Yaml configuration
- Terraform configuration

### Interactive prompts

In this mode, you will be prompted interactively for the variables required to run the automation.

1. Run the `apply.sh` script
2. At each prompt, provide a value for the variable.
3. Once all the variables are collected, you will be asked to apply the automation. Enter `y` to continue or `n` to stop. Either way, the values provided have been collected and written to two sets of files so that next time you can skip the prompts.

The `apply.sh` script will generate credentials.yaml and variables.yaml input files that can be used
for future deployments as well as generating the credentials.auto.tfvars and terraform.tfvars files
used by the terraform. The variables.yaml and terraform.tfvars files can be checked in with the terraform
templates. However, credentials.yaml and credentials.auto.tfvars should be excluded since they contain
sensitive information. Those files should already be included in the .gitignore file.

### Yaml configuration

In this mode, you provide the configuration for your instance in yaml configuration files and avoid
the prompts.

1. Copy the variables.template.yaml file to variables.yaml and credentials.template.yaml to credentials.yaml.
2. Provide values for each of the variables in variables.yaml and credentials.yaml.
3. Run `apply.sh --ci` to kick off the automation. You will not be prompted for input variables and the automation will start immediately

The `apply.sh` script will generate the credentials.auto.tfvars and terraform.tfvars files from the
values provided in the yaml files. The variables.yaml and terraform.tfvars files can be checked in with the terraform
templates. However, credentials.yaml and credentials.auto.tfvars should be excluded since they contain
sensitive information. Those files should already be included in the .gitignore file.

### Terraform configuration

In situations where you are comfortable working with the terraform directly, you can skip the yaml
configuration files and directly configure the automation with the terraform configuration files.

1. Copy the variables.template.tfvars file and credentials.auto.template.tfvars to variables.tfvars and credentials.auto.tfvars, respectively.
2. Provide values for the different variables in variables.tfvars and credentials.auto.tfvars.
3. Kick off the automation with `apply.sh --ci` or skip the script and run `terragrunt run-all apply --terragrunt-parallelism 1 --terragrunt-non-interactive`

The terraform.tfvars file can be checked in with the terraform templates. However, credentials.auto.tfvars
should be excluded since it contains sensitive information. The credentials.auto.tfvars file should
already be in .gitignore.

## Contents

### Layers

| Name | Layer | Description | Version |
|------|-------|-------------|---------|
| [101-azure-vnet-std](./101-azure-vnet-std) | infrastructure | Azure base infrastructure | v1.0.1 |
| [150-azure-storage-blob](./150-azure-storage-blob) | infrastructure | Provision a storage blob on Azure | v1.0.0 |
| [350-data-hub-connection](./350-data-hub-connection) | software | Data Hub Connection | v1.0.0 |
| [350-oracle-database-connection](./350-oracle-database-connection) | software | Oracle Database Connection | v1.0.0 |
| [350-pfna-data-lake-connection](./350-pfna-data-lake-connection) | software | PFNA Data Lake Connection | v1.0.0 |
| [350-salesforce-connection](./350-salesforce-connection) | software | Salesforce Connection | v1.0.0 |
| [350-teradata-connection](./350-teradata-connection) | software | Teradata Connection | v1.0.0 |
| [470-databricks-workspace](./470-databricks-workspace) | software | Databricks Workspace | v1.0.0 |
| [540-aks-container-deployment](./540-aks-container-deployment) | software | AKS Container Deployment | v1.0.0 |

### Variables

| Name | Description | Sensitive | Default value |
|------|-------------|-----------|---------------|
| aks-container-deployment_name | The name of the resource group |  |  |
| azure-storage-blob_storage_account_name | The name of the Azure Storage Account |  |  |
| blob_resource_group_name | The name of the resource group |  |  |
| client_id |  |  |  |
| client_secret |  | true |  |
| data-hub-connection_name | The name of the resource group |  |  |
| databricks-workspace_name | The name of the resource group |  |  |
| oracle-database-connection_name | The name of the resource group |  |  |
| pfna-data-lake-connection_name | The name of the resource group |  |  |
| region | The Azure location where the resource group will be provisioned |  |  |
| resource_group_name | The name of the resource group |  |  |
| salesforce-connection_name | The name of the resource group |  |  |
| subscription_id |  |  |  |
| tenant_id |  |  |  |
| teradata-connection_name | The name of the resource group |  |  |

## Troubleshooting

