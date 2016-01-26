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
    $Movie
    
    )


}
