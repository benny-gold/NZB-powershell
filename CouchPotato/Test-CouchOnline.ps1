function Test-CouchOnline {
    [OutputType([Object])]
    Param
    (
        [Parameter(Mandatory = $True, Position = 0)]
        [string]
        $couchUrl,

        [Parameter(Mandatory = $True, Position = 1)]
        [string]
        $couchApiKey
    )

    $onlineEndpoint = "app.available"


    $online = Invoke-RestMethod "$CouchURL/api/$couchApiKey/$onlineendpoint"
    return $online 
}


