module "pfna-data-lake-connection" {
  source = "github.com/Client-Engineering-Industry-Squad-1/terraform-pfna-data-lake-connection?ref=v1.0.0"

  provision = var.pfna-data-lake-connection_provision
  region = var.region
  resource_group_name = var.pfna-data-lake-connection_name
}
