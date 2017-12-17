Gci "$PSScriptRoot\CouchPotato\*.ps1" | ForEach-Object {. $_.FullName}
Gci "$PSScriptRoot\Notifications\*.ps1" | ForEach-Object {. $_.FullName}
Gci "$PSScriptRoot\Providers\*.ps1" | ForEach-Object {. $_.FullName}
Gci "$PSScriptRoot\Sonarr\*.ps1" | ForEach-Object {. $_.FullName}
Gci "$PSScriptRoot\SabNZBd+\*.ps1" | ForEach-Object {. $_.FullName}
. "$PSScriptRoot\Helpers\Invoke-URLEncoding.ps1"
. "$PSScriptRoot\Helpers\Test-SnatchStatus.ps1"
. "$PSScriptRoot\secrets.ps1"
. "$PSScriptRoot\Get-NewDownload.ps1"


Export-ModuleMember -Function *
Export-ModuleMember -Variable *