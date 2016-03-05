$here = Split-Path -Parent $MyInvocation.MyCommand.Path
$sut = (Split-Path -Leaf $MyInvocation.MyCommand.Path).Replace(".Tests.", ".")
. "$here\..\$sut"
. "$here\..\secrets.ps1"

Describe "Get-SonarrSeries" {
    It "should return all your shows" {
        (Get-SonarrSeries -sonarrURL $SonarrURL -sonarrAPIKey $SonarrKey).count | Should not be 0
    }
    It "should return a specific show" {
        (Get-SonarrSeries -sonarrURL $SonarrURL -sonarrAPIKey $SonarrKey -id).title | Should match Sunny
    }
}
