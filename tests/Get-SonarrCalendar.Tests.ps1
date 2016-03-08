$here = Split-Path -Parent $MyInvocation.MyCommand.Path
$sut = (Split-Path -Leaf $MyInvocation.MyCommand.Path).Replace(".Tests.", ".")
. "$here\..\Sonarr\$sut"
. "$here\..\secrets.ps1"

Describe "Get-SonarrCalendar" {
    [datetime]$today = (Get-Date).AddHours(-8)
    [datetime]$tomorrow = (Get-Date).AddHours(-8).AddDays(2)
    [datetime]$week = (Get-Date).AddHours(-8).AddDays(7)
    
    It "Should return Today's shows." {
       (Get-SonarrCalendar -sonarrURL $SonarrURL -sonarrAPIKey $SonarrKey)[1].airDate | Should Be $today.ToString("yyyy-MM-dd")
    }

    It "Should return Tomorrow's shows." {
       (Get-SonarrCalendar -sonarrURL $SonarrURL -sonarrAPIKey $SonarrKey -startDate $today.AddDays(1) -endDate $tomorrow)[-1].airDate | Should Be $today.ToString("yyyy-MM-dd")
    }

    It "Should return shows a week from now" {
       (Get-SonarrCalendar -sonarrURL $SonarrURL -sonarrAPIKey $SonarrKey -startDate $week.AddDays(-1) -endDate $week)[-1].airDate | Should Be $today.AddDays(5).ToString("yyyy-MM-dd")
    }
}
