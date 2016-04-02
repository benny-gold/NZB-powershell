$here = Split-Path -Parent $MyInvocation.MyCommand.Path
$sut = (Split-Path -Leaf $MyInvocation.MyCommand.Path).Replace(".Tests.", ".")
Import-Module "$here\..\NZB-Powershell" -Force


Describe "Test-SnatchStatus" {
    It "Returns false if file doesn't exist" {
        Test-SnatchStatus -guid sj789yt3kjbd80fgs -documentDBLocation $documentDBLocation | Should Be $false
    }
}
