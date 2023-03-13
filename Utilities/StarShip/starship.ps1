$ProgressPreference = 'SilentlyContinue'
Invoke-WebRequest https://github.com/starship/starship/releases/download/v1.13.1/starship-x86_64-pc-windows-msvc.msi -o starship.msi
Write-Output "Starship Baixado"
Start-Process starship.msi -ArgumentList "/quiet /passive"
Write-Output "Starship Instalado"
Set-Location $PSScriptRoot
$ProfileTxt = Get-Content Microsoft.PowerShell_profile.ps1
npm install --global git-open
Write-Output $ProfileTxt > $PROFILE
Write-Output "Profile Mudado"