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

        $dateFormat = "yyyy-MM-dd"

        $apiCall = "$sonarrURL/api/Calendar?startDate=$($startDate.ToString($dateFormat))&endDate=$($endDate.ToString($dateFormat))"

        $headers = @{"X-Api-Key"=$sonarrAPIKey}

        Write-Verbose $apiCall

        $Calendar = Invoke-RestMethod -Method Get -Uri $apiCall -Headers $headers -Body $bodyJson

        return $Calendar
    }