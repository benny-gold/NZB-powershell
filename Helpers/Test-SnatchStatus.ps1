function Test-SnatchStatus {
    [OutputType([bool])]
    Param
        (
        [Parameter(Mandatory=$True,Position=0)]
        [string]$guid,

        [Parameter(Mandatory=$True,Position=1)]
        [string]$documentDBLocation


        )
    
    if(!(Test-Path $documentDBLocation)) {
        md $documentDBLocation
        }
    
    $documentLocation = "$documentDBLocation\$guid.json"

    Write-Verbose  "testing for $documentLocation"

    if(!(Test-Path $documentLocation))
        {
        return $false
        }
    else
        {
        return $True
        }

}
