# Backup Automation with Terraform and PowerShell

## Goal
The goal of this project is to automate a simple file backup.
Terraform creates a backup folder and a config file, and a PowerShell
script reads the config, copies the files and verifies the result.

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
| `main.tf` | Creates the config file and an info file |
| `outputs.tf` | Shows the path to the config file |
| `backup.ps1` | Reads config, copies files and verifies the backup |

## How to run
```bash
terraform init
terraform apply
pwsh ./backup.ps1
```
## Result
All three files were copied to the backup folder and verified successfully.

## Reflection
**What went well:**
The chain between Terraform and PowerShell worked as planned. The script copied all files and the verification showed 3 of 3 files OK. It was easy to add a new file by only changing a variable in Terraform.

**What was difficult:**
At first I could not push to GitHub because password login is not supported. I solved it by creating an SSH key and adding it to GitHub. I also learned that bash uses `/` in paths, so `.\backup.ps1` did not work and I had to use `./backup.ps1`. Which is more of like a detail thing which is very important to know to make it possible to work.

## Github
https://github.com/ekaanbaran/backup-project
