function Invoke-URLEncoding {
    [OutputType([string])]
    Param
        (
        [Parameter(Mandatory=$True,Position=1)]
        [string]$unencodedString
        )
        Add-Type -AssemblyName System.Web
        $encodedString = [System.Web.HttpUtility]::UrlEncode($unencodedString)
        return $encodedString
}


