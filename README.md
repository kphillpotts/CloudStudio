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

The following resources will be created

- Virtual Machine
- Network Interface
- Virtual Network
- VM public IP address with DNS
- Network Security group (with HTTP, SSL and OBS web socket ports opened)
- Azure Bastion
- Azure Bastion public IP address with DNS

GPU drivers are installed via NVIDIA extension for Virtual Machines. More details at https://docs.microsoft.com/en-us/azure/virtual-machines/windows/n-series-driver-setup.

Software installation is based on custom script extension via chocolatey package manager and additional software is installed via powershell scripts.

The virtual machine and all resources will be **deployed into the same region as the resource group** specified. The selection of a different region has no effect on the deployment.

Make sure to deploy the resource group into a region supporting NV-Series VMs. You can find a [complete list here](https://azure.microsoft.com/global-infrastructure/services/?products=virtual-machines&regions=non-regional,us-east,us-east-2,us-central,us-north-central,us-south-central,us-west-central,us-west,us-west-2,canada-east,canada-central,europe-north,europe-west,australia-central,australia-central-2,australia-east,australia-southeast,brazil-south,china-non-regional,china-east,china-east-2,china-north,china-north-2,south-africa-north,south-africa-west). By the time of writing, this is the list of supported regions. The ones we actively tested are shown in **bold**:

* Australia East
* **West Europe**
* North Europ
* **East US**
* East US 2
* North Central US
* **South Central US**
* West US 2

## Software preinstalled

- Skype - <https://chocolatey.org/packages/skype>
- OBS Studio - <https://chocolatey.org/packages/obs-studio>

## How to choose a VM size

We recommend using a `Standard_NV6` size VM. We found this powerful enough to handle the streaming infrastructure.
The ARM template allows you to select a different size, if needed.

## Credits

- This script is originally based on the Azure Quickstart Template <https://azure.microsoft.com/en-us/resources/templates/obs-studio-stream-vm-chocolatey/>
- Much thanks to Simon Lamb <https://github.com/slamb2k> for adding in the Bastion Components

## TODO

- [ ] Script installation of Snaz for countdown timer <https://github.com/JimmyAppelt/Snaz/releases>
- [ ] Script installation of OBS Websocket Plugin <https://github.com/Palakis/obs-websocket/releases>
- [ ] Script installation of OBS-NDI Plugin <https://github.com/Palakis/obs-ndi/releases>
- [ ] Script installation of NDI Runtime <https://ndi.tv/tools/>
- [x] Update ARM Template to open port for OBS Websocket (with default to 4444)
- [ ] Guidance page for configuring settings in OBS
- [ ] Import default scene collection into OBS