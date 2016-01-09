function Get-SabNZBdHistory
    {
    [OutputType([bool])]
    Param
        (
        # URL of SabNZBd+
        [String]
        $SabNZBdplus,

        # API key of SabNZBd+
        [String]
        $APIKey,
    
        # NZB Guid
        [Parameter(Mandatory=$True)]
        [string]
        $NZBGuid

        )
    
    Write-Verbose -Message "Checking $SabNZBdplus for $NZBGuid"
    }

