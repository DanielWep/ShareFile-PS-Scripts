# Sharefile-UpdateUser

Powershell Scripte um die Benutzer-Attribute im ShareFile anzupassen.

## Getting Started

Die PS-Scripte können lokale ausgeführt werden aber setzen das ShareFile PowerShell SDK voraus.

### Prerequisites

Download und Installation des ShareFile PowerShell SDK. Unter folgenden Link kann die aktuellste Version heruntergeladen werden: https://github.com/citrix/ShareFile-PowerShell/releases

## Running the scripts

### SF-UpdateUserMail.ps1

Dieses PS-Script ändert die Maildomain für alle ShareFile-Benutzer.

```
SF-UpdateUserMail.ps1 -sfUserNewMailDomain “@newdomain.com” -sfAdminMail “admin@domain.com”
```

### SF-UpdateUserRoles.ps1

Mit dieses PS-Script ist es möglich die ShareFile-Rollen/Feature für alle Benutzer zu ändern. Zum Beispiel: Für alle Benutzer "CanUseFileBox" aktivieren. Die zu setzenden Rollen/Feature müssen in dem PS-Script definiert werden.

```
SF-UpdateUserRoles.ps1 -sfAdminMail “admin@domain.com”
```

#