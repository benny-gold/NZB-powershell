<#
.Synopsis
   NewzNab Automation tool
.DESCRIPTION
   Provide this script with an item to download and it will check for it and download if it hasn't already been snatched, notifying your phone & laptops.
.EXAMPLE
   Get-NewDownload
.NOTES
   2016 refactor of add-TVShow
#>
workflow Get-NewDownload 
{
    Param
    (
        # Item to search for
        [string]
        $searchString

    )


$VerbosePreference = "Continue"
$NZBResults = Search-Newznab -searchString $searchString
if($NZBResults -ne $null)
    {
    try
        {
        Get-SabNZBdHistory 
        }
    catch
        {
        $downloadIsSnatched = Send-Download -SabNZBdplus $sabUrl -APIKey $sabKey -sabCategory music -NZBURL $testNZB
            if($downloadIsSnatched -eq $true)
                {
                New-PushalotNotification -AuthorizationToken $PushAuthToken -Title "New result for $searchString Snatched" -Body "$searchString has been snatched/n$($results[0].name)"  
                }
            else
                {
                New-PushalotNotification -AuthorizationToken $PushAuthToken -Title "New result for $searchString failed!" -Body "$searchString has been found but the download failed. /n$($results[0].name)" -IsImportant 
                }
        }
    }

    
}
