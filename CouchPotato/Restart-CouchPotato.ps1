function Restart-CouchPotato {
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


        $restartEndpoint = "app.restart"
      
        $restart = Invoke-RestMethod "$CouchURL/api/$couchApiKey/$restartEndpoint"
        return $restartEndpoint
}
