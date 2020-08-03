param($repo)

#Changing ExecutionPolicy
Set-ExecutionPolicy -ExecutionPolicy Bypass -Scope Process -Force
#Change security protocol
[System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072


$repoUrl = "$repo/InstallStreamingTools.ps1"
Write-Host "  Downloading installation script from $repoUrl"
Invoke-WebRequest -Uri $repoUrl -OutFile "~/Desktop/InstallStreamingTools.ps1" -UseBasicParsing
Write-Host "  Done."