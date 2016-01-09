# Functions for searching and downloading from NewzNab indexers (actually written for GeekSeek, but should work)

function Search-Newznab
    {
    [OutputType([Object])]
    Param
        (
        # API URL of NewzNab
        [String]$NewzNab,

        # API key of NewzNab
        [String]$APIKey,
    
        #String to search for
        [Parameter(Mandatory=$True)]
        [string]$searchString
        )
    
    Write-Verbose "Searching $NewzNab for `"$searchString`""
    $NewzNabURL = $NewzNab+"api?t=search&apikey=$APIKey"
    $encodedSearchString = [System.Web.HttpUtility]::UrlEncode($searchString)

    $searchURL = $NewzNabURL+"&q=$($encodedSearchString)"
    $searchResults = Invoke-RestMethod $searchURL
    return  $searchResults 
    }

