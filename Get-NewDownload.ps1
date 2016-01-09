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
    if((Get-SabNZBdHistory -SabNZBdplus $sabUrl -APIKey $sabKey -NZBId $testNZB) -eq $false)        
        {
        Write-Verbose "Item not snatched..."
        try
            {
            $downloadAdd = Send-Download -SabNZBdplus $sabUrl -APIKey $sabKey -sabCategory music -NZBURL $testNZB
            }
        catch
            {
            New-PushalotNotification -AuthorizationToken $PushAuthToken -Title "New result for $searchString failed to download!" -Body "$searchString has been found but the download failed. /n$($NZBResults[0].name)" -IsImportant 
            }
    else
        {
        Write-Verbose "Item already Snatched"
        }

            New-PushalotNotification -AuthorizationToken $PushAuthToken -Title "New result for $searchString Snatched" -Body "$searchString has been snatched/n$($NZBResults[0].name)"  
         
                
        }
    }

    
}
