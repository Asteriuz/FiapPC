# Settings
Clear-Host
$ProgressPreference = 'SilentlyContinue'
$currentPrincipal = New-Object Security.Principal.WindowsPrincipal([Security.Principal.WindowsIdentity]::GetCurrent())
if ($currentPrincipal.IsInRole([Security.Principal.WindowsBuiltInRole]::Administrator)) {
    $Host.UI.RawUI.WindowTitle = "Admnistrator: Asteriuz's Shell"
} else {
    $Host.UI.RawUI.WindowTitle = "Asteriuz's Shell"
}


# Functions
function openExplorer { Start-Process . }

# Commands

Set-Alias grep Select-String
Set-Alias locate Get-ChildItem
Set-Alias open openExplorer


# Theme
Invoke-Expression (&starship init powershell)
