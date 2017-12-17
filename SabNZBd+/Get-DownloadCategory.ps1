function Get-DownloadCategory {
    Param

    (
        [Parameter(Mandatory = $True)]
        [string]
        $Category
    )

    $categories = Get-Content "$PSScriptRoot\..\Helpers\SabCategories.json" | ConvertFrom-Json
    if ($categories.($Category)) {
        Write-Verbose "Setting Category to $($categories.($Category))"
        $sabCategory += "{0}" -f $categories.($Category)
    }
    else {
        $sabCategory = "jizzles"
    }
    
    return $sabCategory

}