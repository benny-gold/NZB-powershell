# Functions for searching and downloading from NewzNab indexers (actually written for GeekSeek, but should work)

function Search-Newznab
    {
    [CmdletBinding(DefaultParameterSetName="General")] 
    [OutputType([array])]
    Param
        (
        # API URL of NewzNab
        [String]
        $NewzNab,

        # API key of NewzNab
        [String]
        $APIKey,
    
        #String to search for
        [Parameter(Mandatory=$false)]
        [string]
        $searchString,

        # amount of days of retention you have
        [int]
        $retentionDays=2000,
        
        # Params for TV Episodes
        [parameter(Mandatory=$false,ParameterSetName = "TV")] 
        [switch]$TV,
                
        # Season string, e.g S13 or 13 for the item being queried - forcing an int for simplicity
        [parameter(Mandatory=$false,ParameterSetName = "TV")] 
        [int]
        $Season,
           
        # Episode string, e.g E13 or 13 for the item being queried - forcing an int for simplicity
        [parameter(Mandatory=$false,ParameterSetName = "TV")] 
        [int]
        $Episode,
            
        # TVRage id of the item being queried   
        [parameter(Mandatory=$false,ParameterSetName = "TV")] 
        $TVRageId, 
        
        
        #TVDB id of the item being queried   
        [parameter(Mandatory=$false,ParameterSetName = "TV")] 
        $TVDBId, 
            
        
        # Params for Movies
        [parameter(Mandatory=$false,ParameterSetName = "Movie")] 
        [switch]
        $Movie,

        # IMDB id of the item being queried e.g. 0058935    
        [parameter(Mandatory=$false,ParameterSetName = "Movie")] 
        [int]
        $IMDBId,
        
        # Params for Music
        # Artist name (URL/UTF-8 encoded). Case insensitive   
        [parameter(Mandatory=$false, ParameterSetName = "Music")] 
        [switch]
        $Music,

        [parameter(Mandatory=$false, ParameterSetName = "Music")] 
        [string]
        $Artist,
         
        # Album title (URL/UTF-8 encoded). Case insensitive    
        [parameter(Mandatory=$false, ParameterSetName = "Music")] 
        [string]
        $Album,

        # Publisher/Label name (URL/UTF-8 encoded). Case insensitive    
        [parameter(Mandatory=$false, ParameterSetName = "Music")] 
        [string]
        $Label,
        
        #Four digit year of release    
        [parameter(Mandatory=$false, ParameterSetName = "Music")] 
        [ValidateRange(1000,2525)] 
        [int]
        $Year,

        # Genre of Release 
        [parameter(Mandatory=$false, ParameterSetName = "Movie")] 
        [parameter(ParameterSetName = "Music")]
        [string]
        $Genre,

        # Params for Books
        
        [parameter(Mandatory=$false, ParameterSetName = "Book")] 
        [switch]
        $Book,

        # Author name (URL/UTF-8 encoded). Case insensitive   
        [parameter(Mandatory=$false, ParameterSetName = "Book")] 
        [string]
        $Author 

        )
    

    Write-Verbose "Searching $NewzNab for `"$searchString`""
    $NewzNabURL = $NewzNab+"api?apikey=$APIKey"



    # Build out query string
    if($searchString -ne $null)
        {
        $encodedSearchString = Invoke-URLEncoding -unencodedString $searchString
        $searchURL = $NewzNabURL+"&q=$($encodedSearchString)"
        }

    $ParamSet = @{
        book = "&t=book"
        movie = "&t=movie"
        music = "&t=music"
        tv = "&t=tvsearch"
        general = "&t=search"
        }
    

    $searchURL += $ParamSet.($psCmdlet.ParameterSetName)

    $SearchOptions = @{
        TVDBId = 'tvdbid'
        TVRageId = 'rid'
        Season = 'season'
        Episode = 'ep'
        Author = 'Author'
        imdbid = 'imdbid'
        genre = 'genre'
        artist = 'artist'
        album = 'album'
        label = 'label'
        year = 'year'
        }

    foreach($key in $PSBoundParameters.keys)
        {
            if($SearchOptions.($key))
            {
                Write-Verbose "Adding $($SearchOptions.($key))"
                $searchURL += "&{0}={1}" -f $SearchOptions.($key), $PSBoundParameters.($key)
            }
        }


    Write-Verbose "SearchURL = $searchURL"
    $searchResults = Invoke-RestMethod $searchURL 

    # Clean up the metadata and create a new array
    $cleanResults = @()
    $newznabRegex = "http(s)?:\/\/[\s\S]+\/"

    foreach($searchResult in $searchResults)
        {
        $cleanObject = New-Object System.Object
        $cleanObject | Add-Member -type NoteProperty -name Index -Value $searchResults.indexOf($searchResult)
        $cleanObject | Add-Member -type NoteProperty -name title -Value $searchResult.title      
        $cleanObject | Add-Member -type NoteProperty -name link -Value $searchResult.link       
        $cleanObject | Add-Member -type NoteProperty -name pubDate -Value $([DateTime]::Parse($searchResult.pubDate))
        $cleanObject | Add-Member -type NoteProperty -name category -Value $searchResult.category 
        $cleanObject | Add-Member -type NoteProperty -name Description -Value $searchResult.description
        $cleanObject | Add-Member -type NoteProperty -name NonFriendlySize -Value $($searchResult).attr[2].value
        $cleanObject | Add-Member -type NoteProperty -name FriendlySize -Value ("{0:N0}" -f (($($searchResult).attr[2].value)/1Mb))
        $cleanObject | Add-Member -type NoteProperty -name guid -Value ($searchResult.guid.'#text' -replace $newznabRegex,"")
        $cleanResults += $cleanObject  
        }

    $cleanResults = ($cleanResults | Where-Object {$_.pubDate -gt ((Get-Date).AddDays("-$retentionDays"))})
    return $cleanResults
    }

