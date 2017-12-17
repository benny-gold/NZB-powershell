$here = Split-Path -Parent $MyInvocation.MyCommand.Path
$sut = (Split-Path -Leaf $MyInvocation.MyCommand.Path) -replace '\.Tests\.', '.'
Import-Module "$here\..\NZB-Powershell.psd1" -Force

Describe "Get-CouchSettings" {
    It "Should get couch settings" {
        Get-CouchSettings -couchUrl $couchUrl -couchApiKey $couchApiKey | Should not be $null
    }
}
