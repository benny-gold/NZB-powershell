Function Get-Categories
    {
    Param
        (
        # API URL of NewzNab
        [String]
        $NewzNab,

        # API key of NewzNab
        [String]
        $APIKey
        )

	$caps = $geekURL+"api?t=caps"
	$capabilities = Invoke-RestMethod $caps
	$capabilities.caps.categories.category.subcat
	}
