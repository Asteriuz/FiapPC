$ProgressPreference = 'SilentlyContinue'
Set-Location $PSScriptRoot
Invoke-WebRequest https://github.com/microsoft/terminal/releases/download/v1.16.10261.0/Microsoft.WindowsTerminal_Win10_1.16.10261.0_8wekyb3d8bbwe.msixbundle -o terminal.msixbundle
Add-AppPackage -path "terminal.msixbundle"
Copy-Item "C:\Program Files\WindowsApps\Microsoft.WindowsTerminal_1.16.10261.0_x64__8wekyb3d8bbwe" "$PSScriptRoot" -Recurse