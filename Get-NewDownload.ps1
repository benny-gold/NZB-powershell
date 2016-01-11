<#
.Synopsis
   NewzNab Automation tool
.DESCRIPTION
   Provide this script with an item to download and it will check for it and download if it hasn't already been snatched, notifying your phone & laptops.
.EXAMPLE
   Get-NewDownload -searchString UFC
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

$NZBResults = Search-Newznab -NewzNab $geekURL -APIKey $geekKey -searchString $searchString

$NZBResults[0]

# Figure out category

switch($($NZBResults.Category))
    {

    }


#Check in history

if($NZBResults -ne $null)
    {
    if((Get-SabNZBdHistory -SabNZBdplus $sabUrl -APIKey $sabKey -NZBId $($NZBResults[0].link)) -eq $false)        
        {
        Write-Verbose "Item not snatched..."
        try
            {
            $downloadAdd = Send-Download -SabNZBdplus $sabUrl -APIKey $sabKey -sabCategory $searchString -NZBURL $($NZBResults[0].link)
            }
        catch
            {
            New-PushalotNotification -AuthorizationToken $PushAuthToken -Title "New result for $searchString failed to download!" -Body "$searchString has been found but the download failed. `n$($NZBResults[0].name)" -IsImportant $True
            }
        }
    else
        {
        Write-Verbose "Item already Snatched"
        }

            New-PushalotNotification -AuthorizationToken $PushAuthToken -Title "New result for $searchString Snatched" -Body "$searchString has been snatched/n$($NZBResults[0].name)"  
         
                
        }
    }

    
}
