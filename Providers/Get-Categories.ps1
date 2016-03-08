Function Get-Categories
    {
	$caps = $geekURL+"api?t=caps"
	$capabilities = Invoke-RestMethod $caps

	$capabilities.caps.categories.category.subcat
	}

Function Set-Categories
    {
	# Figure out categories. run this function and enter your own SabNZBd+ categories as found here: http://localhost:8080/config/categories/

    param(
        [Parameter(Mandatory=$True)]
        [ValidateSet("books","comics","magazines","movies","music","software","tv")]
        $SabCategory
        )
        return $SabCategory
    }

	$sabcats = @{}
	foreach ($category in $capabilities.caps.categories.category.subcat)
		{
		$Parsed = "$($category.description) > $($category.name)"
		$Parsed
		$LocalCat = Set-SabCategory
		$sabcats.Add($parsed,$LocalCat)
		}

	$sabcats | ConvertTo-Json | Out-File $PSScriptRoot\SabCategories.json