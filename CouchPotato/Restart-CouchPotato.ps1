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


        $restartEndpoint = "app.restart"
      
        $restart = Invoke-RestMethod "$CouchURL/api/$couchApiKey/$restartEndpoint"
        return $restartEndpoint
}
