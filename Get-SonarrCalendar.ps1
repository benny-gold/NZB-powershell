function Get-SonarrCalendar {
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
            "X-Api-Key"=$sonarrAPIKey
            }

        $apiCall = "$sonarrURL/api/Calendar"
        
        write-verbose $apiCall 
        $Calendar = Invoke-RestMethod -Method Get -Uri $apiCall -Headers $headers
        return $Calendar
}


