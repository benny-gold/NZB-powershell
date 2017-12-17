function Get-CouchSettings {
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
        
        
    $settingsEndpoint = "settings"


    $settings = Invoke-RestMethod "$CouchURL/api/$couchApiKey/$settingsEndpoint"
    return $settings 
}
