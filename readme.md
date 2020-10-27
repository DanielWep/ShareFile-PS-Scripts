# Sharefile-UpdateUser

Powershell script to update user sharefile properties.

## Getting Started

The PS scripts can be perform locally but the ShareFile Powershell SDK is required.

### Prerequisites

Download and install the ShareFile PowerShell SDK. You find the latest verison under the following link: https://github.com/citrix/ShareFile-PowerShell/releases

## Running the scripts

### SF-UpdateUserMail.ps1

This powershell script changes the mail address for all ShareFile users. 

```
SF-UpdateUserMail.ps1 -sfUserNewMailDomain “@newdomain.com” -sfAdminMail “admin@domain.com”
```

### SF-UpdateUserRoles.ps1

This script allows to change the ShareFile role/function for all ShareFile users. For example you can enable this feature "CanUseFileBox" for all users. You must define the roles/features in the PowerShell script.

```
SF-UpdateUserRoles.ps1 -sfAdminMail “admin@domain.com”
```

#
Cheers,
[Daniel Weppeler](https://danielweppeler.de)
