$here = Split-Path -Parent $MyInvocation.MyCommand.Path
$sut = (Split-Path -Leaf $MyInvocation.MyCommand.Path).Replace(".Tests.", ".")
Import-Module "$here\..\NZB-Powershell.psd1" -Force

Describe "Get-SonarrSeries" {
    It "should return all your shows" {
        (Get-SonarrSeries -sonarrURL $SonarrURL -sonarrAPIKey $SonarrKey).count | Should not be 0
    }
}