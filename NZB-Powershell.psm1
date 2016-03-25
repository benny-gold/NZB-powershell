Gci "$PSScriptRoot\CouchPotato\*.ps1" | ForEach-Object {. $_.FullName}
Gci "$PSScriptRoot\Notifications\*.ps1" | ForEach-Object {. $_.FullName}
Gci "$PSScriptRoot\Providers\*.ps1" | ForEach-Object {. $_.FullName}
Gci "$PSScriptRoot\Sonarr\*.ps1" | ForEach-Object {. $_.FullName}
Gci "$PSScriptRoot\SabNZBd+\*.ps1" | ForEach-Object {. $_.FullName}
. "$PSScriptRoot\secrets.ps1"


# Export-ModuleMember -Function *
# Export-ModuleMember -Variable PushAuthToken,geekURL,geekKey,sabUrl,sabKey,SonarrURL,SonarrKey,rootFolderPath,CouchURL,couchKey,CouchAPIKey,mailgunKey,mailDomain,mailRecipient1,mailRecipient2,mailRecipients,mailRecipientsForTest,TVDBIDKey