Class AdewaleSonarrSettings{
    [string]$SonarrURL
    [string]$SonarrKey
    [string]$rootFolderPath
    }


Class AdewaleSabSettings{
    [string]$sabUrl
    [string]$sabKey
    }

Class AdewaleCouchSettings{
    [string]$couchURL
    [string]$couchKey
    }

Class AdewaleHelperSettings{
    [string]$TVDBIDKey
    [string]$PushalotAuthToken
    [string]$IndexerUri
    [string]$IndexerKey
    [string]$mailgunKey
    [string]$mailDomain
    [array]$mailRecipients
    [string]$documentDBLocation
    [string]$backupFolder
    }

Class AdewaleSettings{
    [AdewaleSonarrSettings]$SonarrSettings
    [AdewaleSabSettings]$SabSettings
    [AdewaleCouchSettings]$CouchSettings
    [AdewaleHelperSettings]$HelperSettings
    }


$sonarrSettings = New-Object -TypeName AdewaleSonarrSettings
$sonarrSettings.SonarrURL = $SonarrURL
$sonarrSettings.SonarrKey = $SonarrKey
$sonarrSettings.rootFolderPath = $rootFolderPath

$sabSettings = New-Object -TypeName AdewaleSabSettings
$sabSettings.sabKey = $sabKey
$sabSettings.sabUrl = $sabUrl

$couchSettings = New-Object -TypeName AdewaleCouchSettings
$couchSettings.CouchURL = $CouchURL
$couchSettings.couchKey = $couchKey

$AdewaleHelperSettings = New-Object -TypeName AdewaleHelperSettings
$AdewaleHelperSettings.backupFolder = $backupFolder
$AdewaleHelperSettings.documentDBLocation = $documentDBLocation
$AdewaleHelperSettings.IndexerKey = $geekKey
$AdewaleHelperSettings.IndexerUri = $geekURL
$AdewaleHelperSettings.mailDomain = $mailDomain
$AdewaleHelperSettings.mailgunKey = $mailgunKey
$AdewaleHelperSettings.mailRecipients = $mailRecipients
$AdewaleHelperSettings.PushalotAuthToken = $PushAuthToken
$AdewaleHelperSettings.TVDBIDKey = $TVDBIDKey

$AdewaleSettings = New-Object -TypeName AdewaleSettings
$AdewaleSettings.CouchSettings = $couchSettings
$AdewaleSettings.HelperSettings = $HelperSettings
$AdewaleSettings.SabSettings = $sabSettings
$AdewaleSettings.SonarrSettings = $sonarrSettings


return $AdewaleSettings
