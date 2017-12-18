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
            [Parameter(ParameterSetName="ResultsOnly")]
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
            [Parameter(ParameterSetName="ResultsOnly")]
            [Parameter(ParameterSetName="Interactive")]
            [int64]
            $maxSizeInBytes=1288490188,

            # (filepath) Location of JSON documents for previous snatches
            [Parameter(ParameterSetName="LatestSet")] 
            [Parameter(ParameterSetName="LatestOne")]
            [Parameter(ParameterSetName="ResultsOnly")]
            [Parameter(ParameterSetName="Interactive")]
            [Parameter(Mandatory=$true)]
            [string]
            $documentDBLocation,

            # only display results
            [Parameter(ParameterSetName="ResultsOnly")]
            [Parameter(Mandatory=$false)]
            [switch]
            $ResultsOnly,
            
            # Choose notification type
            [ValidateSet("Slack","Pushalot","None")]
            [string]
            $NotificationType="Slack"

        )
        
    # create notification function 
    function Send-GNDNotification ($title, $body) {
        switch ($NotificationType) {
            Slack {
            Send-SlackMessage -Message "$title`n`n$body" -Channel $slackChannel -WebHook $env:SlackWebHookUri
            }
            Pushalot {
            New-PushalotNotification -AuthorizationToken $PushAuthToken -Title $title -body $body
            }
            None {
            Write-Host -ForegroundColor Green "$title `n`n$body"
            }
            
        }        
    }
       
    # Load Resources

    $NZBResults = Search-Newznab -NewzNab $geekURL -APIKey $geekKey -searchString $searchString
    if($NZBResults.count -eq 0){
        $zeroPath = "$documentDBLocation\zero\$searchString.json"
        class ZeroSearch
            {
            [string]$searchString
            [datetime]$searchDate
            }
        $zeroSearchObject = New-Object ZeroSearch
        $zeroSearchObject.searchString = $searchString 
        $zeroSearchObject.searchDate = Get-Date

        if(!(Test-Path $zeroPath))
            {
            $zeroSearch | ConvertTo-Json | Out-File -FilePath $zeroPath
            }

        return "No Results for $searchString"
        }
    # Interactive or automated? Get the download you want. 
    elseif($NZBResults.count -eq 1)
        {
        $SelectedDownloads = $NZBResults
        Write-Warning "Only 1 result. Snatching..."
        }
    else
        {
        switch($PSCmdlet.ParameterSetName)
            {
            "LatestSet" {
                $SelectedDownloads = $NZBResults[0..9]
                }
            "LatestOne" {
                $SelectedDownloads = $NZBResults[0]
                }            
            "ResultsOnly" {
                $SelectedDownloads = $NZBResults
                return $SelectedDownloads
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
                $userSelectedDownload = Read-Host "Which Item(s) do you want to download?"
                [array]$userSelectedDownload = $userSelectedDownload -split "," -split " "

                if($userSelectedDownload.Count -gt 1)
                    {
                    $SelectedDownloads = @()
                    foreach($intUserSelectedDownload in $userSelectedDownload)
                        {
                        Write-Verbose "Adding $($NZBResults[$intUserSelectedDownload].Title) to selection"
                        $SelectedDownloads += $NZBResults[$intUserSelectedDownload]
                        }
                    }
                else
                    {

                    invoke-expression $switch
                    }                   
                }
            }
        }

    Write-Verbose "Downloading $($SelectedDownloads.title)"

    foreach($SelectedDownload in $SelectedDownloads)
        {
            Write-Verbose ($SelectedDownload | ConvertTo-Json)

            # Figure out category

            $sabCategory = Get-DownloadCategory -Category $SelectedDownload.Category
    
            # Convert size to int for comparison

            Write-Verbose "Convert size to int for comparison"

            [string]$strNum = $SelectedDownload.NonFriendlySize
            [long]$intNum = [convert]::ToInt64($strNum, 10)


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

                        Write-Verbose "-SabNZBdplus $sabUrl -APIKey $sabKey -sabCategory $sabCategory -NZBURL $($SelectedDownload.link)"
                        $downloadAdd = Send-Download -SabNZBdplus $sabUrl -APIKey $sabKey -sabCategory $sabCategory -NZBURL $($SelectedDownload.link) 
                        Send-GNDNotification -title "New result for *$searchString* Snatched" -Body "*Title:* $($SelectedDownload.title)`n*Published:* $($SelectedDownload.pubDate)`n*Size:* $($SelectedDownload.friendlySize)mb"
                        
                        $SelectedDownload | ConvertTo-Json | Out-File -FilePath "$documentDBLocation\$($SelectedDownload.guid).json"
                        }
                    catch
                        {
                         Send-GNDNotification -Title "New result for $searchString failed to download!" -Body "$searchString has been found but the download failed. `n*Title:* $($SelectedDownload.title)`n*Link:*$($SelectedDownload.link)`n*Error:*$($_.Exception)"
                        }
                    }
                else
                    {
                    Write-Verbose "Item already Snatched"
                    Write-Output "Download already snatched: $($SelectedDownload.title)"

                    }
                }
                else
                {
                Write-Verbose "Got to cancellation"
                $largePath = "$documentDBLocation\large\$($SelectedDownload.SearchString)_$($SelectedDownload.guid).json"
                if(!(Test-Path $largePath))
                    {
                    $SelectedDownload | ConvertTo-Json | Out-File -FilePath $largePath -Encoding utf8
                    }
                return "Download cancelled due to being too large, It was $($SelectedDownload.FriendlySize)mb and the max is $maxSizeInBytes b"
                }
        }
    

}
