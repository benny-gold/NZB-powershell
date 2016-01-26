function Add-CouchpotatoMovie {
    Param
    (
    #Couchpotato location
    [Parameter(Mandatory=$True,Position=1)]
    [string]$CouchURL,

    #Couchpotato API Key
    [string]
    $CouchAPIKey,

    #Movie to Add
    [string]
    $MovieID
    )

    $720pID = "5134126972314a04b61327958cf28a8a"
    $couchRequest = $CouchURL+"/api/"+$CouchAPIKey+"/movie.add?profile_id=$($720pID)&identifier=$($MovieID)"


    $results = Invoke-RestMethod -Uri $couchRequest
    $results
}
