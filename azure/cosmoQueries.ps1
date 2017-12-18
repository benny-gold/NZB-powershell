Connect-Mdbc -ConnectionString $mongoConnectionString

$downloads = gci $documentDBLocation -File -Filter "*.json"
$downloadData = @()
foreach ($download in $downloads) {
    $downloadData += Get-Content $download.FullName | ConvertFrom-Json
}


[int]$cosmosId = 0
foreach ($object in $downloadData ) {
    $object | Add-MdbcData
}




Get-MdbcData -Count

$titlePattern = "Snatch"
$data = Get-MdbcData (New-MdbcQuery title -Matches $titlePattern)
$data
$data.Count

#Get-Command -Module Mdbc