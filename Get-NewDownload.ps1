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

Function Global:Get-NewDownload 
    {
    [CmdletBinding(DefaultParameterSetName='Interactive')]
        Param
        (
            # Item to search for
            [Parameter(Mandatory=$true)]
            [Parameter(ParameterSetName="LatestSet")] 
            [Parameter(ParameterSetName="LatestOne")]
            [Parameter(ParameterSetName="Interactive")]      
            [string]
            $searchString,

            # Only get the latest result
            [Parameter(ParameterSetName="LatestOne")]
            [switch]
            $GetLatest,

            # Only get the latest 4 results and download those matching size params
            [Parameter(ParameterSetName="LatestSet")]            
            [switch]
            $FilterLatest,

            # Maximum Size to download. Default is 1.2gb
            [Parameter(ParameterSetName="LatestSet")] 
            [Parameter(ParameterSetName="LatestOne")]
            [Parameter(ParameterSetName="Interactive")]
            [int]
            $maxSizeInBytes=1288490188,

            # (filepath) Location of JSON documents for previous snatches
            [Parameter(ParameterSetName="LatestSet")] 
            [Parameter(ParameterSetName="LatestOne")]
            [Parameter(ParameterSetName="Interactive")]
            [Parameter(Mandatory=$true)]
            [string]
            $documentDBLocation

        )
    # Load Resources

    $NZBResults = Search-Newznab -NewzNab $geekURL -APIKey $geekKey -searchString $searchString
    if($NZBResults.count -eq 0){
        return "No Results for $searchString"
        }
        

    # Interactive or automated? Get the download you want. 
    if($NZBResults.count -eq 1)
        {
        $SelectedDownloads = $NZBResults
        }
    else
        {
        switch($PSCmdlet.ParameterSetName)
            {
            "LatestSet" {
                $SelectedDownloads = $NZBResults[0..3]
                }
            "LatestOne" {
                $SelectedDownloads = $NZBResults[0]
                }
            "Interactive" {
                $number = 0
                $NZBResults | ft index,friendlySize,Title,pubDate
        
                $switch = 'switch($userSelectedDownload){'
                Foreach ($Download in $NZBResults)
    	            {
                    $number += 1 
                    $switch += "`n`t $($NZBResults.IndexOf($Download)) {`$SelectedDownloads = `$NZBResults[$($NZBResults.IndexOf($Download))]}"
                    }
                $switch += "`n}"
                [int]$userSelectedDownload = Read-Host "Which Item do you want to download?"
                
                invoke-expression $switch
                }
            }
        }

foreach($SelectedDownload in $SelectedDownloads)
    {
        Write-Verbose ($SelectedDownload | ConvertTo-Json)

        # Figure out category

        $sabCategory = Get-DownloadCategory -Category $SelectedDownload.Category
    
        # Convert size to int for comparison

        Write-Verbose "Convert size to int for comparison"

        [string]$strNum = $SelectedDownload.NonFriendlySize
        [int]$intNum = [convert]::ToInt64($strNum, 10)


        if($intNum -lt $maxSizeInBytes)
            {
            # Check it's not already been snatched
       
            Write-Verbose "Item fits max size"

            if(!(Test-SnatchStatus -guid $($SelectedDownload.guid) -documentDBLocation $documentDBLocation))        
                {
                Write-Verbose "Item not snatched..."
                try
                    {
                    # Create new snatch status Item
                    $SelectedDownload | Add-Member -MemberType NoteProperty -Name snatchDate -Value ((Get-Date).ToString("dd/MM/yyyy HH:mm:ss"))
                    $SelectedDownload | ConvertTo-Json | Out-File -FilePath "$documentDBLocation\$($SelectedDownload.guid).json"


                    Write-Verbose "-SabNZBdplus $sabUrl -APIKey $sabKey -sabCategory $sabCategory -NZBURL $($SelectedDownload.link)"
                    $downloadAdd = Send-Download -SabNZBdplus $sabUrl -APIKey $sabKey -sabCategory $sabCategory -NZBURL $($SelectedDownload.link) 
                    New-PushalotNotification -AuthorizationToken $PushAuthToken -Title "New result for $searchString Snatched" -Body "$searchString has been snatched`n$($SelectedDownload.title)"  
                    }
                catch
                    {
                    New-PushalotNotification -AuthorizationToken $PushAuthToken -Title "New result for $searchString failed to download!" -Body "$searchString has been found but the download failed. `n$($SelectedDownload.title)`n$($SelectedDownload.link)`n$($_.Exception)" -IsImportant $True
                    }
                }
            else
                {
                Write-Verbose "Item already Snatched"
                return "Download already snatched: `n$($SelectedDownload | ConvertTo-Json)`n"

                }
            }
            else
            {
            Write-Verbose "Got to cancellation"
            Write-warning "Download cancelled due to being too large:- `n$($SelectedDownload.FriendlySize) | $maxSizeInBytes | $intNum | $($SelectedDownload | ConvertTo-Json)`n"
            $SelectedDownload | ConvertTo-Json | Out-File -FilePath "$documentDBLocation\large\$($SelectedDownload.SearchString)_$($SelectedDownload.guid).json"
            return "Download cancelled due to being too large"
            }
    }
        

}
