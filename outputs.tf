# Prints the path to the config file to the terminal once `terraform apply` is complete.
output "config_path" {
  value = local_file.config.filename
}
