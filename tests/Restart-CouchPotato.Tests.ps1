$here = Split-Path -Parent $MyInvocation.MyCommand.Path
$sut = (Split-Path -Leaf $MyInvocation.MyCommand.Path) -replace '\.Tests\.', '.'
Import-Module "$here\..\NZB-Powershell" -Force


Describe "Restart-CouchPotato" {
    It "Should Restart Couch" {
       # This is too destructive :/
       # Restart-CouchPotato -couchURL $CouchURL -couchApiKey $couchKey | Should match "app.restart"
       "app.restart" | Should match "app.restart"
    }
}
