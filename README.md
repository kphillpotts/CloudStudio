# CloudStudio on Windows 10 GPU VM with Skype, NDI Runtime and OBS-NDI installed - [Azure Bastion Managed]

![Best Practice Check](https://azurequickstartsservice.blob.core.windows.net/badges/obs-studio-stream-vm-chocolatey/BestPracticeResult.svg)
![Cred Scan Check](https://azurequickstartsservice.blob.core.windows.net/badges/obs-studio-stream-vm-chocolatey/CredScanResult.svg)

[![Deploy To Azure](https://raw.githubusercontent.com/Azure/azure-quickstart-templates/master/1-CONTRIBUTION-GUIDE/images/deploytoazure.svg?sanitize=true)](https://portal.azure.com/#create/Microsoft.Template/uri/https%3A%2F%2Fraw.githubusercontent.com%2Fkphillpotts%2FCloudStudio%2Fmaster%2Fazuredeploy.json)  

[![Visualize](https://raw.githubusercontent.com/Azure/azure-quickstart-templates/master/1-CONTRIBUTION-GUIDE/images/visualizebutton.svg?sanitize=true)](http://armviz.io/#/?load=https%3A%2F%2Fraw.githubusercontent.com%2Fkphillpotts%2FCloudStudio%2Fmaster%2Fazuredeploy.json)

`Tags: Azure, Virtual Machine, OBS, OBS Studio, Streaming VM`

## Solution Overview

This template deploys a Windows GPU VM (Windows 10) with OBS Studio, OBS Plugins, Skype, and NDI tools Preinstalled. 
All management of the Streaming VM will be facilitated by Azure Bastion.

![topology](topology.png)

## Deployed Resources

Following resources will be created

- Virtual Network
- Public IP Address with DNS
- Network Interface
- Network Security group (with HTTP and SSL port opened)
- Virtual Machine
- Azure Bastion
- Public IP Address with DNS

Notes

- GPU drivers installed via NVIDIA extension for Virtual Machine, more details - <https://docs.microsoft.com/en-us/azure/virtual-machines/windows/n-series-driver-setup>
- Software installation based on custom script extension via chocolatey package manager
- Other software installed via powershell scripts

## Software preinstalled

- Skype - <https://chocolatey.org/packages/skype>
- OBS Studio - <https://chocolatey.org/packages/obs-studio>


## Allowed VM sizes in template

- Standard_NV6_Promo
- Standard_NV12_Promo
- Standard_NV24_Promo
- Standard_NC6_Promo
- Standard_NC12_Promo
- Standard_NC24_Promo
- Standard_NV6
- Standard_NV12
- Standard_NV24
- Standard_NC6
- Standard_NC12
- Standard_NC24
- Standard_NV6s_v2
- Standard_NV12s_v2
- Standard_NV24s_v2
- Standard_NV12s_v3
- Standard_NV24s_v3
- Standard_NV48s_v3
- Standard_NC6
- Standard_NC12
- Standard_NC24

## Credits

- This script is originally based on the Azure Quickstart Template <https://azure.microsoft.com/en-us/resources/templates/obs-studio-stream-vm-chocolatey/>
- Much thanks to Simon Lamb <https://github.com/slamb2k> for adding in the Bastion Components

## TODO

- [  ] - Script installation of Snaz for countdown timer <https://github.com/JimmyAppelt/Snaz/releases>
- [  ] - Script installation of OBS Websocket Plugin <https://github.com/Palakis/obs-websocket/releases>
- [  ] - Script installation of OBS-NDI Plugin <https://github.com/Palakis/obs-ndi/releases>
- [  ] - Script installation of NDI Runtime <https://ndi.tv/tools/>
- [  ] - Update ARM Template to open port for OBS Websocket (with default to 4444)
- [  ] - Guidance page for configuring settings in OBS