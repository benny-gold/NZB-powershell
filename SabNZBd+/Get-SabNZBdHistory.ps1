function Get-SabNZBdHistory {
    [OutputType([bool])]
    Param
    (
        # URL of SabNZBd+
        [String]
        $SabNZBdplus,

        # API key of SabNZBd+
        [String]
        $APIKey,
    
        # NZB ID
        [Parameter(Mandatory = $True)]
        [string]
        $NZBId

    )
    
    Write-Verbose -Message "Checking $SabNZBdplus for $NZBId"

    # load the history into memory

    $sabHistory = $SabNZBdplus + "/api?mode=history&start=0&limit=100000&output=json&apikey=$($APIKey)"
    $History = Invoke-RestMethod -Method Get $sabHistory

    if ($History.history.slots.url -contains $NZBId) {
        return $true
    }
    Else {
        return $false
    }

    # cleanup
    $History = $null

}

