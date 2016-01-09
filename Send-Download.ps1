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
        [validateSet("tv","movies","music","jizzles")]
        [string]
        $sabCategory

        )
    Write-Verbose -Message "Sending $NZBURL to $SabNZBdplus/$sabCategory"
  

    $sabCategory = "music"
    $sabAddDownload = $SabNZBdplus+"/api?mode=addurl&name=$([System.Web.HttpUtility]::UrlEncode($NZBURL))&cat=$($sabCategory)&output=JSON&apikey=$($APIKey)"
    Write-Verbose -Message $sabAddDownload
    Invoke-RestMethod -Uri $sabAddDownload


    }

