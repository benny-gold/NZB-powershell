$here = Split-Path -Parent $MyInvocation.MyCommand.Path
$sut = (Split-Path -Leaf $MyInvocation.MyCommand.Path).Replace(".Tests.", ".")
Import-Module "$here\..\NZB-Powershell" -Force

Describe "Invoke-URLEncoding" {
    It "Encodes &" {
        $true | Should Be $false
    }
}
