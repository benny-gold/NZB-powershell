function New-NZBSettingsObject {
    . $PSScriptRoot\classes.ps1

    $settingsObject = New-Object -TypeName NzbSettingsObject



    
    $settingsObject.PushAuthToken = $PushAuthToken
    
    $settingsObject.geekURL = $geekURL
    $settingsObject.geekKey = $geekKey
    

    $settingsObject.sabUrl = $sabUrl
    $settingsObject.sabKey = $sabKey
    
    $settingsObject.SonarrURL = $SonarrURL
    $settingsObject.SonarrKey = $SonarrKey
    $settingsObject.rootFolderPath = $rootFolderPath
    

    $settingsObject.CouchURL = $CouchURL
    $settingsObject.couchKey = $couchKey
    $settingsObject.CouchAPIKey = $CouchAPIKey
    
    $settingsObject.omdbApiKey = $omdbApiKey
    
    $settingsObject.mailgunKey = $mailgunKey
    $settingsObject.mailDomain = $mailDomain
    $settingsObject.mailRecipient1 = $mailRecipient1
    $settingsObject.mailRecipient2 = $mailRecipient2
    $settingsObject.mailRecipients = $mailRecipients
    $settingsObject.mailRecipientsForTest = $mailRecipientsForTest
    
    $settingsObject.TVDBIDKey = $TVDBIDKey
    
    $settingsObject.documentDBLocation = $documentDBLocation
    
    $settingsObject.backupFolder = $backupFolder
    
    $settingsObject.DBLocation = $DBLocation
    
    $settingsObject.slackChannel = $slackChannel

    return $settingsObject
}
