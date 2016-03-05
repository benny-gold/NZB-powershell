function Get-SonarrSeries {
    [OutputType([Object])]
    Param
        (
        [Parameter(Mandatory=$True,Position=0)]
        [string]
        $sonarrURL,

        [Parameter(Mandatory=$True,Position=1)]
        [string]
        $sonarrAPIKey
               
        )

        $headers = @{
            "X-Api-Key"=$sonarrURL
            }

        $apiCall = "$sonarrURL/api/series"
}
