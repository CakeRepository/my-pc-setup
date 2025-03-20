# Description: Configure a new PC using DSC v3
# Usage: cake .\cake-pc.ps1

# Create setup directory
if (!(Test-Path -Path "c:\pc-setup\")) {
  Write-Host "Creating directory c:\pc-setup\"
  New-Item -ItemType Directory -Path "c:\pc-setup\"
}

# Create auto-login user
Write-Host "Creating auto-login user..."

# Install DSC v3
Write-Host "Installing DSC v3..."
winget install --id 9NVTPZWRC6KQ --accept-source-agreements --accept-package-agreements --silent > C:\pc-setup\DSCInstall.log 2>&1

Write-Host "Install Powershell 7"
winget install --id Microsoft.PowerShell --source winget --accept-source-agreements --accept-package-agreements > C:\pc-setup\PowerShell7Install.log 2>&1

#install firefox
Write-Host "Install Firefox"
winget install --id Mozilla.Firefox --source winget --accept-source-agreements --accept-package-agreements > C:\pc-setup\FirefoxInstall.log 2>&1

#install vscode
Write-Host "Install Visual Studio Code"
winget install --id Microsoft.VisualStudioCode --source winget --accept-source-agreements --accept-package-agreements > C:\pc-setup\VSCodeInstall.log 2>&1

#install git
Write-Host "Install Git"
winget install --id Git.Git --source winget --accept-source-agreements --accept-package-agreements > C:\pc-setup\GitInstall.log 2>&1

#install 7zip
Write-Host "Install 7zip"
winget install --id 7zip.7zip --source winget --accept-source-agreements --accept-package-agreements > C:\pc-setup\7zipInstall.log 2>&1

#install notepad++
Write-Host "Install Notepad++"
winget install --id NotepadPlusPlus.NotepadPlusPlus --source winget --accept-source-agreements --accept-package-agreements > C:\pc-setup\NotepadPlusPlusInstall.log 2>&1

#install chocolatey
Write-Host "Install Chocolatey"
winget install --id Chocolatey.Chocolatey --source winget --accept-source-agreements --accept-package-agreements > C:\pc-setup\ChocolateyInstall.log 2>&1

#install anadonda
Write-Host "Install Anaconda"
winget install --id Anaconda.Anaconda3 --source winget --accept-source-agreements --accept-package-agreements > C:\pc-setup\AnacondaInstall.log 2>&1

#install teams
Write-Host "Install Microsoft Teams"
winget install --id Microsoft.Teams --source winget --accept-source-agreements --accept-package-agreements > C:\pc-setup\TeamsInstall.log 2>&1

#install discord
Write-Host "Install Discord"
winget install --id Discord.Discord --source winget --accept-source-agreements --accept-package-agreements > C:\pc-setup\DiscordInstall.log 2>&1

#install 1password
Write-Host "Install 1Password"
winget install --id AgileBits.1Password --source winget --accept-source-agreements --accept-package-agreements > C:\pc-setup\1PasswordInstall.log 2>&1

#enable WSL
Write-Host "Enable WSL"
wsl --install > C:\pc-setup\WSLInstall.log 2>&1

$dscConfig = @"
`$schema: 'https://raw.githubusercontent.com/PowerShell/DSC/main/schemas/2023/08/config/document.json'
resources: 
  - name: Sets Darkmode
    type: Microsoft.Windows/Registry
    properties:
      keyPath:   HKCU\Software\Microsoft\Windows\CurrentVersion\Themes\Personalize
      valueName: SystemUsesLightTheme
      valueData:
        DWord: 0
  - name: Enable Long Paths
    type: Microsoft.Windows/Registry
    properties:
      keyPath:   HKLM\SYSTEM\CurrentControlSet\Control\FileSystem
      valueName: LongPathsEnabled
      valueData:
        DWord: 1
  - name: Disable SMBv1
    type: Microsoft.Windows/Registry
    metadata:
      area: Network Access
      severity: Critical
    properties:
      keyPath: HKLM\SYSTEM\CurrentControlSet\Services\LanmanServer\Parameters
      valueName: SMB1
      valueData:
        DWord: 0
"@
dsc config set -i $dscConfig -o pretty-json > C:\pc-setup\DSCConfig.log 2>&1

Write-Host "PC setup completed successfully!" -ForegroundColor Green