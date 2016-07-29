Get-Content ./secretstemplate.txt | % {iex $_}
. ./Create-SettingsObject.ps1 | ConvertTo-Json -Depth 4 | Out-File -FilePath ./AdewaleSettings.config
$env:AdewaleSettingsPath = "$PSScriptRoot\AdewaleSettings.config"

if (test-path $env:AdewaleSettingsPath) {
    Write-Host -foregroundColor Green "Adewale Settings configured Successfully."
    }
else {
    Write-Host -foregroundColor Red "Adewale Settings not configured."
    }