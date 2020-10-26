param([Parameter(Mandatory=$true)][string]$sfAdminMail="")
# ShareFile API Script for migrate User accounts to new Email domain
# (c) Daniel Weppeler 22.11.2019 v1.10 @_DanielWep
# freeware license

# Prerequirements
# Download and install ShareFile PowerShell SDK 
# Latest Version: https://github.com/citrix/ShareFile-PowerShell/releases

#Prerequirements
Add-PSSnapIn ShareFile

#Authentication
$sfClient = New-SfClient

#Get all of the Account Employees or Clients
$sfUsers = Send-SfRequest -Client $sfClient -Entity Accounts\Employees

#Set Default User Roles
$JSONBody = '
{ "Roles" : [
    "CanUseFileBox",
    "CanManageUsers",
]}'

<# User Role Options
$JSONBody = '
{ "Roles" : [
    "CanChangePassword",
    "CanManageMySettings",
    "CanUseFileBox",
    "CanManageUsers",
    "CanCreateFolders",
    "CanUseDropBox",
    "CanSelectFolderZone",
    "CreateNetworkShareConnectors",
    "CreateSharePointConnectors",
]}' #>


#Loop through each of the users and set new user roles
foreach($sfUser in $sfUsers) {
    if($sfuser.Email -eq $sfAdminMail) {
    'This is Admin ID = ' + $sfUser.Id
    
    } Else {
    
    $temp = Send-SfRequest -Client $sfClient -Method GET -Entity Users -Id $sfUser.Id
    Send-SfRequest -Client $sfClient -Method PUT -Entity Users -Navigation Roles -Id $sfUser.Id -BodyText $JSONBody
    }
}