function Get-SonarrCalendar {
    Param
        (
        [Parameter(Mandatory=$True,Position=0)]
        [string]
        $sonarrURL,

        [Parameter(Mandatory=$True,Position=1)]
        [string]
        $sonarrAPIKey,

        [datetime]
        $startDate,

        [datetime]
        $endDate  
        )

        $headers = @{
            "X-Api-Key"=$sonarrAPIKey
            }
        




        $apiCall = "$sonarrURL/api/Calendar"

        $dateFormat = "yyyy-MM-dd"

        
        write-verbose $bodyJSON
        
        $Calendar = Invoke-RestMethod -Method Get -Uri $apiCall -Headers $headers
        return $Calendar
}


