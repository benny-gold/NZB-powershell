$here = Split-Path -Parent $MyInvocation.MyCommand.Path
$sut = (Split-Path -Leaf $MyInvocation.MyCommand.Path) -replace '\.Tests\.', '.'
Import-Module "$here\..\NZB-Powershell" -Force


Describe "Get-CouchLogs" {
    It "Should return log entries" {
        $true | Should Be $false
    }
    It "Should change entries into objects" {
        $true | Should Be $false
    }
}
