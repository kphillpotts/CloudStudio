# ---------------------------------------------------------------------------------------
# Install Chocolatey (Script based on https://raw.githubusercontent.com/Azure/azure-quickstart-templates/master/visual-studio-dev-vm-chocolatey/scripts/SetupChocolatey.ps1)
# ---------------------------------------------------------------------------------------
#Changing ExecutionPolicy
Set-ExecutionPolicy -ExecutionPolicy Bypass -Scope Process -Force
#Change security protocol
[System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072

# Install Choco
$sb = { Invoke-Expression ((new-object net.webclient).DownloadString('https://chocolatey.org/install.ps1')) }
Invoke-Command -ScriptBlock $sb 

$sb = { Set-ItemProperty -path HKLM:\Software\Microsoft\Windows\CurrentVersion\Policies\System -name EnableLua -value 0 }
Invoke-Command -ScriptBlock $sb 


# ---------------------------------------------------------------------------------------
# Install Chocolatey Packages
# ---------------------------------------------------------------------------------------
choco install obs-studio -y -force 
choco install skype -y -force 
choco install microsoft-edge -y -force 
Write-Host "Packages from choco.org were installed"



# ---------------------------------------------------------------------------------------
# Install additional software (Snaz, NDI, web socket extension, ...)
# ---------------------------------------------------------------------------------------

# Location of OBS installation.
$obsInstallationFolder = "C:\Program Files\obs-studio"

Set-Location ~/Desktop
New-Item CloudStudio -type directory -force
Set-Location ~/Desktop/CloudStudio 

Write-Host "Downloading and installing Snaz"
$url = "https://github.com/JimmyAppelt/Snaz/releases/download/1.12.7.0/SnazSetup.exe"
$outpath = "./SnazSetup.exe"
Write-Host "  Downloading from $url"
Invoke-WebRequest -Uri $url -OutFile $outpath -UseBasicParsing
Write-Host "  Running installer silently"
Start-Process -Filepath $outpath -ArgumentList "/verysilent" -Wait

Write-Host "Downloading and installing OBS-WebSocket"
$obswebsocketUrl = "https://github.com/Palakis/obs-websocket/releases/download/4.8.0/obs-websocket-4.8.0-Windows-Installer.exe"
$obswebsockPath = "./obs-websocket.exe"
Write-Host "  Downloading from $obswebsocketUrl"
Invoke-WebRequest -Uri $obswebsocketUrl -OutFile $obswebsockPath -UseBasicParsing
Write-Host "  Running installer silently"
Start-Process -FilePath $obswebsockPath -ArgumentList "/verysilent" -Wait

Write-Host "Downloading and installing OBS-NDI plugin"
$obsndiUrl = "https://github.com/Palakis/obs-ndi/releases/download/4.9.1/obs-ndi-4.9.0-Windows.zip"
Write-Host "  Downloading from $obsndiUrl"
Invoke-WebRequest -Uri $obsndiUrl -OutFile "$PSScriptRoot/ndi.zip" -UseBasicParsing
Write-Host "  Unzipping plugin content to $PSScriptRoot/ndi_content"
Expand-Archive -Path "$PSScriptRoot/ndi.zip" -DestinationPath "$PSScriptRoot/ndi_content" -Force
Write-Host "  Copying extracted content to OBS installation folder at $obsInstallationFolder"
Copy-Item -Path "$PSScriptRoot/ndi_content/*" -Destination "$obsInstallationFolder" -Recurse -Force

Write-Host "Downloading and installing NDI runtime"
$ndiRuntimeUrl = "https://ndi.palakis.fr/runtime/ndi-runtime-4.5.1-Windows.exe"
$ndiRuntimePath = "$PSScriptRoot/ndi-runtime.exe"
Write-Host "  Downloading from $ndiRuntimeUrl"
Invoke-WebRequest -Uri $ndiRuntimeUrl -OutFile $ndiRuntimePath -UseBasicParsing
Write-Host "  Running installer silently"
Start-Process -FilePath $ndiRuntimePath -ArgumentList "/verysilent" -Wait

Write-Host "Downloading and installing Move Transition Plugin"
$obsmoveUrl = "https://obsproject.com/forum/resources/move-transition.913/version/2713/download?file=60710"
Write-Host "  Downloading from $obsmoveUrl"
Invoke-WebRequest -Uri $obsmoveUrl -OutFile "$obsInstallationFolder/move-transition-1.7.8-windows.zip" -UseBasicParsing
Write-Host "  Unzipping plugin content to $obsInstallationFolder"
Expand-Archive -Path "$obsInstallationFolder/move-transition-1.7.8-windows.zip" -DestinationPath "$obsInstallationFolder" -Force
Write-Host "  Running installer silently"
Start-Process -FilePath "$obsInstallationFolder/move-transition-installer.exe" -ArgumentList "/verysilent" -Wait

Write-Host "We are done."
