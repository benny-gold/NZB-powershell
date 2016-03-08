$here = Split-Path -Parent $MyInvocation.MyCommand.Path
$sut = (Split-Path -Leaf $MyInvocation.MyCommand.Path).Replace(".Tests.", ".")
. "$here\..\$sut"
. "$here\..\secrets.ps1"

Describe "Get-SonarrCalendar" {
    $today = (Get-Date).AddHours(-8)
    $tomorrow = (Get-Date).AddHours(-8).AddDays(1)
    $week = (Get-Date).AddHours(-8).AddDays(7)
    
    It "Should return Today's shows." {
       (Get-SonarrCalendar -sonarrURL $SonarrURL -sonarrAPIKey $SonarrKey)[1].airDate | Should Be $today.ToString("yyyy-MM-dd")
    }

    It "Should return Tomorrow's shows." {
       (Get-SonarrCalendar -sonarrURL $SonarrURL -sonarrAPIKey $SonarrKey -startDate $tomorrow -endDate $tomorrow)[0].airDate | Should Be $tomorrow.ToString("yyyy-MM-dd")
    }

    It "Should return shows a week from now" {
       (Get-SonarrCalendar -sonarrURL $SonarrURL -sonarrAPIKey $SonarrKey -startDate $today -endDate $week)[-1].airDate | Should Be $week.ToString("yyyy-MM-dd")
    }
}
