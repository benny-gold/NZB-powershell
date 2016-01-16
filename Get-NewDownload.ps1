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

Function Get-NewDownload 
    {
        Param
        (
            # Item to search for
            [string]
            $searchString,

            # Only get the latest result
            [switch]
            $GetLatest

        )
    # Load Resources
    Gci "$PSScriptRoot\*.ps1" | ForEach-Object {. $_.FullName}
    
    

    $NZBResults = Search-Newznab -NewzNab $geekURL -APIKey $geekKey -searchString $searchString


    # Interactive or automated? Get the download you want. 

    if($GetLatest.IsPresent)
        {
        $SelectedDownload = $NZBResults[0]
        }
    else 
        {
        $number = 0
        InlineScript{
            $NZBResults | ft index,friendlySize,Title,pubDate
            }
        $switch = 'switch($userSelectedDownload){'
        Foreach ($Download in $NZBResults)
    	    {
            $number += 1 
            $switch += "`n`t $($NZBResults.IndexOf($Download)) {`$SelectedDownload = `$NZBResults[$($NZBResults.IndexOf($Download))]}"
            }
        $switch += "`n}"
        InlineScript{
            [int]$userSelectedDownload = Read-Host "Which Item do you want to download?"
            }
        invoke-expression $switch
        }


    # Figure out category

    $categories = Get-Content "$PSScriptRoot\Helpers\SabCategories.json" | ConvertFrom-Json
    if($categories.($SelectedDownload.Category))
        {
        Write-Verbose "Setting $($categories.($SelectedDownload.Category))"
        $sabCategory += "{0}" -f $categoriess.($SelectedDownload.Category)
        }
    else
        {
        $sabCategory = "jizzles"
        }


    #Check in history

    if($SelectedDownload -ne $null)
        {
        if((Get-SabNZBdHistory -SabNZBdplus $sabUrl -APIKey $sabKey -NZBId $($SelectedDownload.link)) -eq $false)        
            {
            Write-Verbose "Item not snatched..."
            try
                {
                $downloadAdd = Send-Download -SabNZBdplus $sabUrl -APIKey $sabKey -sabCategory $sabCategory -NZBURL $($SelectedDownload.link) 
                }
            catch
                {
                New-PushalotNotification -AuthorizationToken $PushAuthToken -Title "New result for $searchString failed to download!" -Body "$searchString has been found but the download failed. `n$($SelectedDownload.name)" -IsImportant $True
                }
            }
        else
            {
            Write-Verbose "Item already Snatched"
            }

                New-PushalotNotification -AuthorizationToken $PushAuthToken -Title "New result for $searchString Snatched" -Body "$searchString has been snatched/n$($SelectedDownload.name)"  
         
                
            }
        }

    
    
