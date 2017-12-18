function New-NZBSettingsObject {
    [CmdletBinding(DefaultParameterSetName = "none")]

    param(
        [object]
        $NzbSettingsObject,
        
        [string]
        $OutFile,
        
        [string]
        $InFile,


        [Parameter(Mandatory = $true)]
        [validateset("Host", "File", "Object", "Legacy")]
        [string]
        $InputType,


        [validateset("StdOut", "File")]
        [string]
        $OutType = "StdOut",


        [string]
        $PushAuthToken,
        
        [string]
        $GeekURL,
        
        [string]
        $GeekKey,
        
        [string]
        $SabUrl,
        
        [string]
        $SabKey,
        
        [string]
        $SonarrURL,
        
        [string]
        $SonarrKey,
        
        [string]
        $rootFolderPath,
        
        [string]
        $CouchURL,
        
        [string]
        $couchKey,
        
        [string]
        $CouchAPIKey,
        
        [string]
        $omdbApiKey,
        
        [string]
        $mailgunKey,
        
        [string]
        $mailDomain,
        
        [string]
        $mailRecipient1,
        
        [string]
        $mailRecipient2,
        
        [string]
        $TVDBIDKey,
        
        [string]
        $documentDBLocation,
        
        [string]
        $backupFolder,
        
        [string]
        $DBLocation,
        
        [string]
        $slackChannel
        
    )

    . $PSScriptRoot\..\classes.ps1

    switch ($InputType) {
        File { 
            try {
                [NzbSettingsObject]$settingsObject = Get-Content $InFile | ConvertFrom-Json
                $settingsObject.settingsLastModified = Get-Date
            }    
            Catch {
                Throw "Unable to import $InFile - please double check content."
            }
        }
        {($_ -eq "Host") -or ($_ -eq "Legacy")} {
            $settingsObject = New-Object -TypeName NzbSettingsObject
            $settingsObject.settingsCreatedAt = Get-Date
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
            $settingsObject.settingsLastModified = Get-Date
        }
        Object { 
            try {
                [NzbSettingsObject]$settingsObject = $NzbSettingsObject
                $settingsObject.settingsLastModified = Get-Date
            }
            catch {
                Throw "Unable to import Object - please double check content."
            }
        }
        
    }

    
    if ($OutType -like "File") {
        Write-Verbose "Exporting Settings..."
        try {
            $settingsObject | ConvertTo-Json | Out-File $OutFile -Encoding utf8
            return $true
        }
        catch {
            Throw "Could not write settings to File"
        }
    }
    elseif ($OutType -like "StdOut") {
        return $settingsObject
    }
}