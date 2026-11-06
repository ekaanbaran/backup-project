variable "backup_dir" {
  description = "Folder where the backup is stored"
  default     = "./backup"
}

variable "source_files" {
  description = "Files to back up"
  type        = list(string)
  default     = ["data/file1.txt", "data/file2.txt", "data/file3.txt" ]
}
