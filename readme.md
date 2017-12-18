# NZB-Powershell

A bunch of powershell scripts to manipulate some common media automation Products

## Requirements
------------

You require some or all of the following applications & accounts:

*   [Sonarr (Formally NZBDrone)](https://sonarr.tv/)
    * URL
    * API key
*   [SabNZBd+](http://sabnzbd.org/)
    * URL
    * API key 
*   [CouchPotato](https://couchpota.to/)
    * URL
    * API key
*   [Newznab Provider](https://nzbgeek.info/index.php)
    * URL
    * API key
*   [Pushalot](https://pushalot.com/)
    * API key
*	[Mailgun](https://mailgun.com/)
    * API key
	* Domain
*   [Usenet Provider](http://www.easynews.com/fromafriend.html?ref_key=e96e22bf5aeaf18c0c4133680e31199abe2fa8d0
)
*   [TVDB Id](http://thetvdb.com/?tab=xml)
    * API key

### Setup Secrets & Keys

all Settings are optional. 

If you have an old secrets.ps1, dot source it then run `New-NZBSettingsObject -InputType Legacy` to create the new settings object.

To create a new settings object from scratch:

```powershell
New-NZBSettingsObject -PushAuthToken `
        -GeekURL `
        -GeekKey `
        -SabUrl `
        -SabKey `
        -SonarrURL `
        -SonarrKey `
        -rootFolderPath `
        -CouchURL `
        -couchKey `
        -CouchAPIKey <>`
        -omdbApiKey <OMDB API Key> `
        -mailgunKey <Mailgun API Key>`
        -mailDomain <Mail Domain>`
        -mailRecipient1 <First Mail Recipient>`
        -mailRecipient2 <Second Mail Recipient> `
        -TVDBIDKey <TVDBID API Keyt> `
        -documentDBLocation <Document DB Location> `
        -backupFolder `
        -DBLocation `
        -slackChannel <Channel to post Slack notifications to>
```

Usage
=====

**CouchPotato**

Add-CouchpotatoMovie

    Add-CouchpotatoMovie [-CouchURL] <string> [-CouchAPIKey <string>] [-MovieID <int>]

**Sonarr**
		
Get-SonarrSeries

    Get-SonarrSeries [-sonarrURL] <string> [-sonarrAPIKey] <string>  [<CommonParameters>]

Add-SonarrSeries

    Add-SonarrSeries [-sonarrURL] <string> [-sonarrAPIKey] <string> [-tvSeriesTitle] <string> [-TVDBID] <int>
    [-qualityProfileId] <int> [-seasons] <array> [-rootFolderPath] <string>  [<CommonParameters>]
	

**Providers**

Get-IMDBId

    Get-IMDBId [-MovieName] <string>  [<CommonParameters>]
	
	
Get-TVDBId

    Get-TVDBId [-APIKey] <string> [-show] <string>  [<CommonParameters>]
	
Get-Categories	

    Get-Categories [[-NewzNab] <string>] [[-APIKey] <string>] 
	

Search-NewzNab

    Search-Newznab [-NewzNab <string>] [-APIKey <string>] [-searchString <string>] [-retentionDays <int>]
    [<CommonParameters>]

    Search-Newznab [-NewzNab <string>] [-APIKey <string>] [-searchString <string>] [-retentionDays <int>] [-TV]
    [-Season <int>] [-Episode <int>] [-TVRageId <Object>] [-TVDBId <Object>]  [<CommonParameters>]

    Search-Newznab [-NewzNab <string>] [-APIKey <string>] [-searchString <string>] [-retentionDays <int>] [-Movie]
    [-IMDBId <int>] [-Genre <string>]  [<CommonParameters>]

    Search-Newznab [-NewzNab <string>] [-APIKey <string>] [-searchString <string>] [-retentionDays <int>] [-Music]
    [-Artist <string>] [-Album <string>] [-Label <string>] [-Year <int>] [-Genre <string>]  [<CommonParameters>]

    Search-Newznab [-NewzNab <string>] [-APIKey <string>] [-searchString <string>] [-retentionDays <int>] [-Book]
    [-Author <string>]  [<CommonParameters>]


**Notifications**

New-PushalotNotification

    New-PushalotNotification [-Title] <string> -Body <string> [-AuthorizationToken <string>] [-LinkTitle <string>]
    [-Link <string>] [-IsImportant <bool>] [-IsSilent <bool>] [-Image <string>] [-Source <string>] [-TimeToLive <int>]
     [<CommonParameters>]

Send-MailgunMessage
	 
    Send-MailgunMessage [-APIKey] <string> [-fromName] <string> [-Domain] <string> [-sender <string>] [-Subject <string>] [-html <Object>]  [<CommonParameters>]


**SabNZBd+**

Get-DownloadCategory

    Get-DownloadCategory [-Category] <string>  [<CommonParameters>]
	
Send-Download

    Send-Download [[-SabNZBdplus] <string>] [[-APIKey] <string>] [-NZBURL] <string> [[-NZBTitle] <string>]
    [-sabCategory] <string> {books | comics | magazines | movies | music | software | tv | jizzles}
    [<CommonParameters>]

Get-SabNZBdHistory

    Get-SabNZBdHistory [[-SabNZBdplus] <string>] [[-APIKey] <string>] [-NZBId] <string>  [<CommonParameters>]

**Multi-Tool**
	
Get-NewDownload

    Get-NewDownload [[-searchString] <String>] [-GetLatest] [[-maxSize] <Int32>] [<CommonParameters>]

