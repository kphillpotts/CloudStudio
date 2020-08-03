# Call the script like this:
# powershell -ExecutionPolicy bypass -File ./PostDeployment.ps1 -repo https://raw.githubusercontent.com/kphillpotts/CloudStudio/master -account streamboss
param ([Parameter(Mandatory)]$repo, [Parameter(Mandatory)]$account)


#Changing ExecutionPolicy
Set-ExecutionPolicy -ExecutionPolicy Bypass -Scope Process -Force
#Change security protocol
[System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072

$tempLoc = "c:/users/$account/Desktop/CloudStudio"
New-Item $tempLoc -type directory -force

# Download the script, which installs all the tooling, to the desktop.
$repoUrl = "$repo/CloudStudioInstallScript.ps1"
Write-Host "  Downloading CloudStudio installation script from $repoUrl"
Invoke-WebRequest -Uri $repoUrl -OutFile "$tempLoc/installscript.ps1" -UseBasicParsing

# Create a CMD file users can executo to run the script. That's because PS1 files cannot be executed directly.
# By putting a CMD in front of it, we can make this a one-click-experience.
# Create an empty file.
New-Item $tempLoc/RUNME.cmd -ItemType file -force
# Write the PowerShell execution command into it.
Set-Content $tempLoc/RUNME.cmd 'powershell -noprofile -executionpolicy bypass -file ./installscript.ps1'
Add-Content $tempLoc/RUNME.cmd 'echo Installation done. You can close this window.'
Add-Content $tempLoc/RUNME.cmd 'pause'


Write-Host "  Done."