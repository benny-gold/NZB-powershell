class CleanObject
    {
    [int]$index
    [string]$SearchString
    [string]$title
    [string]$link
    [datetime]$pubDate
    [string]$category
    [string]$Description
    [long]$NonFriendlySize
    [string]$FriendlySize
    [string]$guid
    }
    
class ZeroSearch
    {
    [string]$searchString
    [datetime]$searchDate
    }
    
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
