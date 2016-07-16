$here = Split-Path -Parent $MyInvocation.MyCommand.Path
$sut = (Split-Path -Leaf $MyInvocation.MyCommand.Path) -replace '\.Tests\.', '.'
Import-Module "$here\..\NZB-Powershell" -Force


Describe "Test-CouchOnline" {
    It "Should check if CouchPotato is available" {
        (Test-CouchOnline -couchURL $CouchURL -couchApiKey $couchKey).success | Should Be $true
    }
}
