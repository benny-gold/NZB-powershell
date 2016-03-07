$here = Split-Path -Parent $MyInvocation.MyCommand.Path
$sut = (Split-Path -Leaf $MyInvocation.MyCommand.Path).Replace(".Tests.", ".")
. "$here\..\$sut"

Describe "Get-SonarrCalendar" {
    It "Should return tomorrow's shows." {
        $tomorrow = (Get-Date).AddDays(1).ToString("yyyy-MM-dd")
       (Get-SonarrCalendar -sonarrURL $SonarrURL -sonarrAPIKey $SonarrKey).airDate | Should Be $tomorrow
    }
}
