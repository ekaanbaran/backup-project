# Backup Automation with Terraform and PowerShell

## Goal
The goal of this project is to automate a simple file backup.
Terraform creates a backup folder and a config file, and a PowerShell
script reads the config, copies the files and verifies the result.

## Requirements
- Windows with WSL2 (Ubuntu)
- Terraform
- PowerShell 7
- Git

## Method
**Tools used:**
- **Terraform** (local provider) – creates the backup folder and config file
- **PowerShell 7** – copies the files and verifies the backup
- **Git & GitHub** – version control
- **WSL2 (Ubuntu) & VS Code** – development environment

**How the chain works:**
1. Terraform creates `backup/config.json` with a list of files to back up
2. `backup.ps1` reads the config file
3. The script copies each file to the backup folder
4. The script verifies that all files exist in the backup folder

**Files:**
| File | Purpose |
|---|---|
| `variables.tf` | Backup folder and list of files to back up |
| `main.tf` | Creates the config file |
| `outputs.tf` | Shows the path to the config file |
| `backup.ps1` | Reads config, copies files and verifies the backup |
| `data/` | Test files that are backed up |

## Why these tools
- **Terraform** creates the folder and config file as code, so the setup is the same every time
- **PowerShell** is used for the actual work: copying files and checking the result.
- **WSL2** was used because it is free, works on Windows 11 Home and was used during the course.

## How to run
```bash
terraform init
terraform apply
pwsh ./backup.ps1
```

## How to test
Run `pwsh ./backup.ps1` and check that it prints `Verification: 3 of 3 files OK`.

To test error handling, run:
```bash
pwsh ./backup.ps1 -ConfigPath ./wrong.json
```
The script shows an error message and stops in a controlled way.

## Result
All three files were copied to the backup folder and verified successfully.

## Limitations
- The project only backs up files locally, not to another server or the cloud.
- The script overwrites old backups and does not keep versions.

## Reflection
**What went well:**
The chain between Terraform and PowerShell worked as planned. The script copied all files and the verification showed 3 of 3 files OK. It was easy to add a new file by only changing a variable in Terraform.

**What was difficult:**
At first I could not push to GitHub because password login is not supported. I solved it by creating an SSH key and adding it to GitHub. I also learned that bash uses `/` in paths, so `.\backup.ps1` did not work and I had to use `./backup.ps1`. It is a small detail, but it is very important to know when working in Linux.


## Github
https://github.com/ekaanbaran/backup-project
