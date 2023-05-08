# powershell install
brew install powershell --cask
pwsh

# Azure mofule install
Install-Module -Name Az -AllowClobber -Repository PSGallery -Force
Get-InstalledModule -Name Az -AllVersions | Select-Object -Property Name, Version

# Connect to Azure account and check it
Connect-AzAccount
Update-AzConfig -DisplayBreakingChangeWarning $false

Get-AzVM
Get-AzSubscription

# change context to proper Azure subscription
$context = Get-AzSubscription -SubscriptionId xxxxxxxx-yyyy-yyyy-yyyy-zzzzzzzzz
Set-AzContext $context

# check Storage account ( cloud shell storage account as example)
Get-AzStorageAccount
Get-AzStorageAccount | Select-Object -Property StorageAccountName, Kind, CreationTime