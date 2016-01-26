function Get-IMDBId {
    [OutputType([xml])]
    Param
    (
    [Parameter(Mandatory=$True,Position=1)]
    [string]$MovieName
    )

    $movieResults = Invoke-RestMethod "http://www.omdbapi.com/?t=$($MovieName)&type=movie&plot=full"
    $movieResults
}