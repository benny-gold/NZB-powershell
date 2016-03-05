function Get-IMDBId {
    [OutputType([xml])]
    Param
    (
    [Parameter(Mandatory=$True,Position=1)]
    [string]$MovieName
    )

    $movieResults = Invoke-RestMethod "http://www.omdbapi.com/?t=$($MovieName)&type=movie&plot=full"
    
    $movieObject = New-Object System.Object
    $movieObject | Add-Member -type NoteProperty -name Title -value $movieResults.Title
    $movieObject | Add-Member -type NoteProperty -name Year -value $movieResults.Year
    $movieObject | Add-Member -type NoteProperty -name Rated -value $movieResults.Rated
    $movieObject | Add-Member -type NoteProperty -name Released -value $movieResults.Released
    $movieObject | Add-Member -type NoteProperty -name Runtime -value $movieResults.Runtime
    $movieObject | Add-Member -type NoteProperty -name Director -value $movieResults.Director
    $movieObject | Add-Member -type NoteProperty -name Plot -value $movieResults.Plot
    $movieObject | Add-Member -type NoteProperty -name Language -value $movieResults.Language
    $movieObject | Add-Member -type NoteProperty -name Actors -value $movieResults.Actors
    $movieObject | Add-Member -type NoteProperty -name Poster -value $movieResults.Poster
    $movieObject | Add-Member -type NoteProperty -name imdbRating -value $movieResults.imdbRating
    $movieObject | Add-Member -type NoteProperty -name imdbID -value ($movieResults.imdbID -replace "tt","")

    $movieObject
}

