function Get-DownloadCategory
    {
    Param

        (
        [Parameter(Mandatory=$True)]
        [validateSet(
                    "tv",
                    "movies",
                    "music",
                    "jizzles"
                    )]
        [string]
        $Category
        )

    
    }