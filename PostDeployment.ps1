# Call the script like this:
# powershell -ExecutionPolicy bypass -File ./PostDeployment.ps1 -repo https://raw.githubusercontent.com/kphillpotts/CloudStudio/master
param($repo)

#Changing ExecutionPolicy
Set-ExecutionPolicy -ExecutionPolicy Bypass -Scope Process -Force
#Change security protocol
[System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072

Set-Location ~/Desktop
New-Item TempCloudStudio -type directory

# Download the script, which installs all the tooling, to the desktop.
$repoUrl = "$repo/CloudStudioInstallScript.ps1"
Write-Host "  Downloading CloudStudio installation script from $repoUrl"
Invoke-WebRequest -Uri $repoUrl -OutFile "~/Desktop/TempCloudStudio/CloudStudioInstallScript.ps1" -UseBasicParsing

# Create a CMD file users can execute to run the script. That's because PS1 files cannot be executed directly.
# By putting a CMD in front of it, we can make this a one-click-experience.
# Create an empty file.
New-Item ./InstallStreamingTools.cmd -ItemType file
# Write the PowerShell execution command into it.
Set-Content ./InstallStreamingTools.cmd 'powershell -noprofile -executionpolicy bypass -file ./TempCloudStudio/CloudStudioInstallScript.ps1'

Write-Host "  Done."