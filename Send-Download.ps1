function Send-Download
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
    
        # URL of NZB
        [Parameter(Mandatory=$True)]
        [string]
        $NZBURL,

        # Category to place download in
        [Parameter(Mandatory=$True)]
        [validateSet("tv","movies","music")]
        [string]
        $sabCategory

        )
    Write-Verbose -Message "Sending $NZBURL to $SabNZBdplus/$sabCategory"

    
    $TestAPI = $NZBURL -replace "https://nzbgeek.info/geeknzb.php\?guid=","https://api.nzbgeek.info/api?t=get&id=" -replace "\?", "%3F" -replace "=", "%3D" -replace "&", "%26"
        

    # [System.Web.HttpUtility]::UrlEncode($TestAPI) # doesn't work... too overboard?

    $sabCategory = "music"
    $sabAddDownload = $sabUrl+"/api?mode=addurl&name=$($TestAPI)&cat=$($sabCategory)&output=JSON&apikey=$($sabKey)"
    Invoke-RestMethod -Uri $sabAddDownload


    }

