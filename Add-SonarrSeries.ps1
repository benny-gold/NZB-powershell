﻿function Add-SonarrSeries {
    [OutputType([Object])]
    Param
        (
        [Parameter(Mandatory=$True,Position=0)]
        [string]
        $sonarrURL,

        [Parameter(Mandatory=$True,Position=1)]
        [string]
        $sonarrAPIKey,
                
        [Parameter(Mandatory=$True,Position=2)]
        [string]
        $tvSeries
        )

        $headers = @{
            "X-Api-Key"=$sonarrURL
            }

        $apiCall = "$sonarrURL/api/"

        
}
