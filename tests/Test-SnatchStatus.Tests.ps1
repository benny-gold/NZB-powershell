$here = Split-Path -Parent $MyInvocation.MyCommand.Path
$sut = (Split-Path -Leaf $MyInvocation.MyCommand.Path).Replace(".Tests.", ".")
Import-Module "$here\..\NZB-Powershell.psd1" -Force


Describe "Test-SnatchStatus" {
    It "Returns false if item doesn't exist" {
        Test-SnatchStatus -guid sj789yt3kjbd80fgs -documentDBLocation $documentDBLocation | Should Be $false
    }   
    It "Returns true if item exists" {
        $testGuid = "hbg87g432gvhjb"
        New-Item -ItemType file -Path "$PSScriptRoot\$testGuid.json"
        Test-SnatchStatus -guid $testGuid -documentDBLocation $PSScriptRoot | Should Be $true
        Remove-Item -Path "$PSScriptRoot\$testGuid.json"
    }
}
