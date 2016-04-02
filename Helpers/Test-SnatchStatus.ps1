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
    
    $documentLocation = "$documentDBLocation\$($SelectedDownload.guid).json"

    if(!(Test-Path $documentLocation))
        {
        return $false
        }
    else
        {
        return $True
        }

}
