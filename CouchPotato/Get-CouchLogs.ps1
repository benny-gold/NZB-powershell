function Get-CouchLogs {
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


        $loggingEndpoint = "logging.partial"

        $logs = Invoke-RestMethod "$CouchURL/api/$couchApiKey/$($loggingEndpoint)"
        $logs.log
}
