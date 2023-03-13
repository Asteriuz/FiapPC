$ProgressPreference = 'SilentlyContinue'
Set-Location $PSScriptRoot
Invoke-WebRequest https://github.com/AutoHotkey/AutoHotkey/releases/download/v2.0.2/AutoHotkey_2.0.2_setup.exe -o ahk_setup.exe
Write-Output "AHK Baixado"