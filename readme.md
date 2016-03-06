NZB-Powershell
==============

A bunch of powershell scripts to manipulate some common media automation Products

Requirements
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
*   [Usenet Provider](http://www.easynews.com/fromafriend.html?ref_key=e96e22bf5aeaf18c0c4133680e31199abe2fa8d0
)
*   [TVDB Id](http://thetvdb.com/?tab=xml)
    * API key

**Setup Secrets.ps1**

Fill in the information in secretstemplate.txt and resave it as secrets.ps1 in the root directory.


Usage
=====

Add-CouchpotatoMovie

    Add-CouchpotatoMovie [-CouchURL] <string> [-CouchAPIKey <string>] [-MovieID <int>]
	
Add-SonarrSeries

    Add-SonarrSeries [-sonarrURL] <string> [-sonarrAPIKey] <string> [-tvSeriesTitle] <string> [-TVDBID] <int>
    [-qualityProfileId] <int> [-seasons] <array> [-rootFolderPath] <string>  [<CommonParameters>]
	
Get-DownloadCategory

    Get-DownloadCategory [-Category] <string>  [<CommonParameters>]
	
Get-IMDBId

    Get-IMDBId [-MovieName] <string>  [<CommonParameters>]
	
Get-SabNZBdHistory

    Get-SabNZBdHistory [[-SabNZBdplus] <string>] [[-APIKey] <string>] [-NZBId] <string>  [<CommonParameters>]
	
Get-SonarrSeries

    Get-SonarrSeries [-sonarrURL] <string> [-sonarrAPIKey] <string>  [<CommonParameters>]
	
Get-TVDBId

    Get-TVDBId [-APIKey] <string> [-show] <string>  [<CommonParameters>]
	
New-PushalotNotification

    New-PushalotNotification [-Title] <string> -Body <string> [-AuthorizationToken <string>] [-LinkTitle <string>]
    [-Link <string>] [-IsImportant <bool>] [-IsSilent <bool>] [-Image <string>] [-Source <string>] [-TimeToLive <int>]
     [<CommonParameters>]
	 
	 
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

Send-Download

    Send-Download [[-SabNZBdplus] <string>] [[-APIKey] <string>] [-NZBURL] <string> [[-NZBTitle] <string>]
    [-sabCategory] <string> {books | comics | magazines | movies | music | software | tv | jizzles}
    [<CommonParameters>]
	
Get-NewDownload

    Get-NewDownload [[-searchString] <String>] [-GetLatest] [[-maxSize] <Int32>] [<CommonParameters>]


DESCRIPTION

    Provide this script with an item to download and it will check for it and download if it hasn't already been
    snatched, notifying your phone & laptops.
