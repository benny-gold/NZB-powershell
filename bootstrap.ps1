Get-Content ./secretstemplate.txt | % {iex $_}
. ./Create-SettingsObject.ps1 | ConvertTo-Json -Depth 4 | Out-File -FilePath ./AdewaleSettings.config

if ($AdewaleSettings.SabSettings.sabKey -eq $null) {
    Write-Warning "Please ensure you have filled out all the settings in secretstemplate.txt"
    }


$env:AdewaleSettingsPath = "$PSScriptRoot\AdewaleSettings.config"


if (test-path $env:AdewaleSettingsPath) {
    Write-Host -foregroundColor Green "Adewale Settings configured Successfully."
    }
else {
    Write-Host -foregroundColor Red "Adewale Settings not configured."
    }