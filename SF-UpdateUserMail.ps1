param( [Parameter(Mandatory=$true)] [string]$sfUserNewMailDomain="", [Parameter(Mandatory=$true)][string]$sfAdminMail="")
# ShareFile API Script for migrate User accounts to new Email domain
# (c) Daniel Weppeler 23.01.2018 v1.05 @_DanielWep
# freeware license

# Prerequirements
# Download and install ShareFile PowerShell SDK 
# Latest Version: https://github.com/citrix/ShareFile-PowerShell/releases
Add-PSSnapIn ShareFile
# $sfUserNewDomain = "@new-domain.com"
# $sfAdminMail = "admin@old-domain.com"

# Authentication
$sfClient = New-SfClient

# Get all of the Account Employees or Clients
$sfUsers = Send-SfRequest -Client $sfClient -Entity Accounts\Employees

# Loop through each of the users and set new email parameter
foreach($sfUser in $sfUsers) {
  if($sfuser.Email -eq $sfAdminMail) {
    'ShareFile Admin ID = ' + $sfUser.Id
    
    } Else {

    $temp = Send-SfRequest -Client $sfClient -Entity Users -Id $sfUser.Id
    $sfUserMail = $sfUser.Email.Split("@")
    $sfUserNewMail = $sfUserMail[0] + $sfUserNewMailDomain
    Send-SFRequest –Client $sfClient -Method PATCH –Entity Users -Id $sfUser.Id -BodyText ('{"Email":"' + $sfUserNewMail + '"}')
	}
}