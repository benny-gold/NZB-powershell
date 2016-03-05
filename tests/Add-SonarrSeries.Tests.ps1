$here = Split-Path -Parent $MyInvocation.MyCommand.Path
$sut = (Split-Path -Leaf $MyInvocation.MyCommand.Path).Replace(".Tests.", ".")
. "$here\..\$sut"

Describe "Add-SonarrSeries" {
    It "adds a TV Show" {
        $true | Should Be $false
    }

    It "shouldn't add an existing TV Show" {
        Add-SonarrSeries -sonarrURL $SonarrURL -sonarrAPIKey $SonarrKey -tvSeries "It's Always Sunny in Philadelphia" | Should Throw
    }
}
