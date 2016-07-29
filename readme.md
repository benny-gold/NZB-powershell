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
*	[Mailgun](https://mailgun.com/)
    * API key
	* Domain
*   [Usenet Provider](http://www.easynews.com/fromafriend.html?ref_key=e96e22bf5aeaf18c0c4133680e31199abe2fa8d0)
*   [TVDB](http://thetvdb.com/?tab=xml)
    * API key

**Setup Secrets & Keys**

Fill out the information in secretstemplate.txt and run: 

    .\bootstrap.ps1

Usage
=====

**CouchPotato**

1. Add-CouchpotatoMovie

**Sonarr**
		
1. Get-SonarrSeries
2. Add-SonarrSeries

**Providers**

1. Get-IMDBId
2. Get-TVDBId
3. Get-Categories
4. Search-NewzNab

**Notifications**

1. New-PushalotNotification
2. Send-MailgunMessage

**SabNZBd+**

1. Get-DownloadCategory	
2. Send-Download
3. Get-SabNZBdHistory

**Multi-Tool**
	
1. Get-NewDownload