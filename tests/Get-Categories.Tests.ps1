$here = Split-Path -Parent $MyInvocation.MyCommand.Path
$sut = (Split-Path -Leaf $MyInvocation.MyCommand.Path).Replace(".Tests.", ".")
. "$here\..\Providers\$sut"
. "$here\..\secrets.ps1"

Describe "Get-Categories" {
    It "Should return Categories." {
       Get-Categories -NewzNab $geekURL -APIKey $geekKey | Should not be 0
    }
}
