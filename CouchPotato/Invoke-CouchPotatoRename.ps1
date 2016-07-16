function Invoke-CouchPotatoRename 
    {
    [OutputType([Object])]
        Param
        (
        [Parameter(Mandatory=$True,Position=0)]
        [string]
        $couchUrl,

        [Parameter(Mandatory=$True,Position=1)]
        [string]
        $couchApiKey
        )

        # Couchpotato's renamer doesn't work. This function forces a restart after each item is moved. It stops when the "From" path is empty.


        $onlineEndpoint = "app.available"
        $settingsEndpoint = "settings"
        $restartEndpoint = "app.restart"
        $loggingEndpoint = "logging.partial"

        $logs = Invoke-RestMethod "$CouchURL/api/$couchApiKey/$endpoint"

}






$online= Invoke-RestMethod http://10.124.10.70:5050/api/72ab356eb38049efbf0c996e4ba80c68/app.available
$online.success
