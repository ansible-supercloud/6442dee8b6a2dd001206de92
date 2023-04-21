output "pfna-data-lake-connection_name" {
  description = "The name of the resource group"
  value = module.pfna-data-lake-connection.name
}
output "pfna-data-lake-connection_id" {
  description = "The id of the resource group"
  value = module.pfna-data-lake-connection.id
}
output "pfna-data-lake-connection_group" {
  description = "The resource group object"
  value = module.pfna-data-lake-connection.group
}
output "pfna-data-lake-connection_provision" {
  description = "Flag indicating whether the resource group was provisioned"
  value = module.pfna-data-lake-connection.provision
}
output "pfna-data-lake-connection_region" {
  description = "the value of pfna-data-lake-connection_region"
  value = module.pfna-data-lake-connection.region
}
