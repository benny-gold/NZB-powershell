# Module for newznab searching and downloading

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
    
    
    }

