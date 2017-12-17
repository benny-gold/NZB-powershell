class CleanObject {
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
    
class ZeroSearch {
    [string]$searchString
    [datetime]$searchDate
}
    
class Movie {
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




class NzbSettingsObject {
    [string]$PushAuthToken
    [string]$geekURL
    [string]$geekKey
    [string]$sabUrl
    [string]$sabKey
    [string]$SonarrURL
    [string]$SonarrKey
    [string]$rootFolderPath
    [string]$CouchURL
    [string]$couchKey
    [string]$CouchAPIKey
    [string]$omdbApiKey
    [string]$mailgunKey
    [string]$mailDomain
    [string]$mailRecipient1
    [string]$mailRecipient2
    [string]$mailRecipients
    [string]$mailRecipientsForTest
    [string]$TVDBIDKey
    [string]$documentDBLocation
    [string]$backupFolder
    [string]$DBLocation
    [string]$slackChannel
}
