# my-pc-setup
Scripts to setup new computers when I wipe my daily driver

## Overview
This repository contains PowerShell scripts to automate PC setup, making it easy to configure a new or freshly wiped computer with essential software and settings.

## Features
- Automated installation of popular software packages
- Windows Subsystem for Linux (WSL) setup
- System configuration using DSC v3
- Dark mode configuration
- Security hardening (e.g., disabling SMBv1)

## Software Installed
The script automatically installs the following software:
- PowerShell 7
- Firefox
- Visual Studio Code
- Git
- 7-Zip
- Notepad++
- Chocolatey package manager
- Anaconda Python distribution
- Microsoft Teams
- Discord
- 1Password

## Requirements
- Windows 10 or 11
- PowerShell 5.1 or higher
- Administrative privileges
- Internet connection

## Usage
To configure a new PC using the `cake-pc.ps1` script:

1. Open PowerShell with administrative privileges
2. Navigate to the directory containing the script
3. Run the script:
   ```powershell
   .\cake-pc.ps1
   ```

## What the Script Does
- Creates a setup directory at `C:\pc-setup\`
- Installs DSC v3 and required software packages using `winget`
- Enables Windows Subsystem for Linux (WSL)
- Configures dark mode
- Disables SMBv1 protocol for security

## Logs
All installation logs are saved in the `C:\pc-setup\` directory for troubleshooting.
