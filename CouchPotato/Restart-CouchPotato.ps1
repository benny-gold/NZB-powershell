function Restart-CouchPotato {
    [OutputType([Object])]
        Param
        (
        [Parameter(Mandatory=$True,Position=0)]
        [string]
        $couchUrl,

        [Parameter(Mandatory=$True,Position=1)]
        [string]
        $couchApiKey,

        [Parameter(Mandatory=$True,Position=2)]
        [switch]
        $whatif
        )

        # Couchpotato's renamer doesn't work. This function forces a restart after each item is moved. It stops when the "From" path is empty.


        $onlineEndpoint = "app.available"
        $settingsEndpoint = "settings"
        $restartEndpoint = "app.restart"
        $loggingEndpoint = "logging.partial"

        $logs = Invoke-RestMethod "$CouchURL/api/$couchApiKey/$endpoint"
}
