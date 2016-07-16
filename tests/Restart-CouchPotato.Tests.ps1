$here = Split-Path -Parent $MyInvocation.MyCommand.Path
$sut = (Split-Path -Leaf $MyInvocation.MyCommand.Path) -replace '\.Tests\.', '.'
Import-Module "$here\..\NZB-Powershell" -Force


Describe "Restart-CouchPotato" {
    It "Should Restart Couch" {
       (Restart-CouchPotato -couchURL $CouchURL -couchApiKey $couchKey).success | Should match "app.restart"
    }
}
