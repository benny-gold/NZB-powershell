$here = Split-Path -Parent $MyInvocation.MyCommand.Path
$sut = (Split-Path -Leaf $MyInvocation.MyCommand.Path).Replace(".Tests.", ".")
Import-Module "$here\..\NZB-Powershell.psm1"


Describe "Get-Categories" {
    It "Should return Categories." {
       Get-Categories -NewzNab $geekURL -APIKey $geekKey | Should not be 0
    }
}
