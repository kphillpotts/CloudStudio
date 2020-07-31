Write-Host "Downloading and installing Snaz"
$url = "https://github.com/JimmyAppelt/Snaz/releases/download/1.12.7.0/SnazSetup.exe"
$outpath = "$PSScriptRoot/SnazSetup.exe"
Write-Host "  Downloading from $url"
Invoke-WebRequest -Uri $url -OutFile $outpath
Write-Host "  Running installer silently"
Start-Process -Filepath $outpath -ArgumentList "/verysilent" -Wait

Write-Host "Downloading and installing OBS-WebSocket"
$obswebsocketUrl = "https://github.com/Palakis/obs-websocket/releases/download/4.8.0/obs-websocket-4.8.0-Windows-Installer.exe"
$obswebsockPath = "$PSScriptRoot/obs-websocket.exe"
Write-Host "  Downloading from $obswebsocketUrl"
Invoke-WebRequest -Uri $obswebsocketUrl -OutFile $obswebsockPath
Write-Host "  Running installer silently"
Start-Process -FilePath $obswebsockPath -ArgumentList "/verysilent" -Wait

Write-Host "Downloading and installing OBS-NDI"
$obsndiUrl = "https://github.com/Palakis/obs-ndi/releases/download/4.9.0/obs-ndi-4.9.0-Windows-Installer.exe"
$obsndiPath = "$PSScriptRoot/obs-ndi-4.9.0-Windows-Installer.exe"
Write-Host "  Downloading from $obsndiUrl"
Invoke-WebRequest -Uri $obsndiUrl -OutFile $obsndiPath
Write-Host "  Running installer silently"
Start-Process -FilePath $obsndiPath -ArgumentList "/verysilent" -Wait

Write-Host "We are done"
