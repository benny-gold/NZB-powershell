function Get-SonarrSeries {
    [OutputType([Object])]
    Param
    (
        [Parameter(Mandatory = $True, Position = 0)]
        [string]
        $sonarrURL,

        [Parameter(Mandatory = $True, Position = 1)]
        [string]
        $sonarrAPIKey
               
    )

    $headers = @{"X-Api-Key" = $sonarrAPIKey}

    $apiCall = "$sonarrURL/api/series"
        
    write-verbose $apiCall 
    $shows = Invoke-RestMethod -Method Get -Uri $apiCall -Headers $headers
    return $shows
}