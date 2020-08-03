# Call the script like this:
# powershell -ExecutionPolicy bypass -File ./PostDeployment.ps1 -repo https://raw.githubusercontent.com/kphillpotts/CloudStudio/master
param($repo)

#Changing ExecutionPolicy
Set-ExecutionPolicy -ExecutionPolicy Bypass -Scope Process -Force
#Change security protocol
[System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072

Set-Location ~/Desktop
New-Item CloudStudio -type directory -force
Set-Location ~/Desktop/CloudStudio

# Download the script, which installs all the tooling, to the desktop.
$repoUrl = "$repo/CloudStudioInstallScript.ps1"
Write-Host "  Downloading CloudStudio installation script from $repoUrl"
Invoke-WebRequest -Uri $repoUrl -OutFile "./installscript.ps1" -UseBasicParsing

# Create a CMD file users can executo to run the script. That's because PS1 files cannot be executed directly.
# By putting a CMD in front of it, we can make this a one-click-experience.
# Create an empty file.
New-Item ./RUNME.cmd -ItemType file -force
# Write the PowerShell execution command into it.
Set-Content ./RUNME.cmd 'powershell -noprofile -executionpolicy bypass -file ./installscript.ps1'
Add-Content ./RUNME.cmd 'echo Installation done. You can close this window.'
Add-Content ./RUNME.cmd 'pause'


Write-Host "  Done."