# Backup script - reads config from Terraform, copies files and verifies the result

param(
    [string]$ConfigPath = "./backup/config.json"
)

# Reads the config file that Terraform created
function Get-BackupConfig {
    param([string]$Path)
    try {
        $config = Get-Content $Path -Raw -ErrorAction Stop | ConvertFrom-Json
        Write-Host "Config loaded from $Path"
        return $config
    }
    catch {
        Write-Host "ERROR: Could not read config file: $_"
        exit 1
    }
}

# Copies each file to the backup folder
function Invoke-Backup {
    param([string[]]$Files, [string]$Destination)
    foreach ($file in $Files) {
        if (Test-Path $file) {
            Copy-Item $file $Destination
            Write-Host "Copied: $file"
        }
        else {
            Write-Host "Missing: $file"
        }
    }
}

# Checks that every file exists in the backup folder
function Test-Backup {
    param([string[]]$Files, [string]$Destination)
    [int]$okCount = 0
    foreach ($file in $Files) {
        $fileName = Split-Path $file -Leaf
        if (Test-Path (Join-Path $Destination $fileName)) {
            $okCount++
        }
    }
    Write-Host "Verification: $okCount of $($Files.Count) files OK"
}

# Main program
$config = Get-BackupConfig -Path $ConfigPath
$destination = Split-Path $ConfigPath
Invoke-Backup -Files $config.files -Destination $destination
Test-Backup   -Files $config.files -Destination $destination
