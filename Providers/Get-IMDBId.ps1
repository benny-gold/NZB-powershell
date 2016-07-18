function Get-IMDBId {
    [OutputType([xml])]
    Param
    (
    [Parameter(Mandatory=$True,Position=1)]
    [string]$MovieName
    )

    class Movie
        {
        [string]$Title
        [int]$Year
        [string]$Rated
        [datetime]$Released
        [string]$Runtime
        [string]$Director
        [string]$Plot
        [string]$Language
        [string]$Actors
        [string]$Poster
        [double]$imdbRating
        [int]$imdbID
        }

    $movieResults = Invoke-RestMethod "http://www.omdbapi.com/?t=$($MovieName)&type=movie&plot=full"
    if($movieResults.count -eq 0) {
        "No Results Found"
        return
        }
    $movieObject = New-Object Movie
    $movieObject.Title = $movieResults.Title
    $movieObject.Year = $movieResults.Year
    $movieObject.Rated = $movieResults.Rated
    $movieObject.Released = $movieResults.Released
    $movieObject.Runtime = $movieResults.Runtime
    $movieObject.Director = $movieResults.Director
    $movieObject.Plot = $movieResults.Plot
    $movieObject.Language = $movieResults.Language
    $movieObject.Actors = $movieResults.Actors
    $movieObject.Poster = $movieResults.Poster
    $movieObject.imdbRating = $movieResults.imdbRating
    $movieObject.imdbID = ($movieResults.imdbID -replace "tt","")

    return $movieObject
}

