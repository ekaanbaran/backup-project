# Creates a config file that tells PowerShell which files to back up
resource "local_file" "config" {
  filename = "${var.backup_dir}/config.json"
  content  = jsonencode({ files = var.source_files })
}

# Creates an info file in the backup folder
resource "local_file" "info" {
  filename = "${var.backup_dir}/INFO.txt"
  content  = "Backup folder created by Terraform"
}
