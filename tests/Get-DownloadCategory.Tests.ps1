$here = Split-Path -Parent $MyInvocation.MyCommand.Path
$sut = (Split-Path -Leaf $MyInvocation.MyCommand.Path).Replace(".Tests.", ".")
Import-Module "$here\..\NZB-Powershell"

Describe "Get-DownloadCategory" {
    It "Matches no Category" {
        Get-DownloadCategory -Category "Best Movie Ever" | Should Be Jizzles
    }
         It "Matches Console > WiiWare/VC Category" {
        Get-DownloadCategory -Category "Console > WiiWare/VC" | Should Be software
    }
     It "Matches Movies > Other Category" {
        Get-DownloadCategory -Category "Movies > Other" | Should Be movies
    }
     It "Matches Audio > Lossless Category" {
        Get-DownloadCategory -Category "Audio > Lossless" | Should Be music
    }
     It "Matches Console > Xbox 360 Category" {
        Get-DownloadCategory -Category "Console > Xbox 360" | Should Be software
    }
     It "Matches XXX > XviD Category" {
        Get-DownloadCategory -Category "XXX > XviD" | Should Be jizzles
    }
     It "Matches TV > Anime Category" {
        Get-DownloadCategory -Category "TV > Anime" | Should Be tv
    }
     It "Matches Movies > 3D Category" {
        Get-DownloadCategory -Category "Movies > 3D" | Should Be movies
    }
     It "Matches Audio > Audiobook Category" {
        Get-DownloadCategory -Category "Audio > Audiobook" | Should Be music
    }
     It "Matches Audio > MP3 Category" {
        Get-DownloadCategory -Category "Audio > MP3" | Should Be music
    }
     It "Matches Console > Xbox One Category" {
        Get-DownloadCategory -Category "Console > Xbox One" | Should Be software
    }
     It "Matches Console > PS4 Category" {
        Get-DownloadCategory -Category "Console > PS4" | Should Be software
    }
     It "Matches TV > SD Category" {
        Get-DownloadCategory -Category "TV > SD" | Should Be tv
    }
     It "Matches Console > PS3 Category" {
        Get-DownloadCategory -Category "Console > PS3" | Should Be software
    }
     It "Matches Console > XBOX 360 DLC Category" {
        Get-DownloadCategory -Category "Console > XBOX 360 DLC" | Should Be software
    }
     It "Matches PC > Mac Category" {
        Get-DownloadCategory -Category "PC > Mac" | Should Be software
    }
     It "Matches Audio > Video Category" {
        Get-DownloadCategory -Category "Audio > Video" | Should Be music
    }
     It "Matches Console > NDS Category" {
        Get-DownloadCategory -Category "Console > NDS" | Should Be software
    }
     It "Matches Other > Misc Category" {
        Get-DownloadCategory -Category "Other > Misc" | Should Be jizzles
    }
     It "Matches TV > Sport Category" {
        Get-DownloadCategory -Category "TV > Sport" | Should Be tv
    }
     It "Matches Movies > HD Category" {
        Get-DownloadCategory -Category "Movies > HD" | Should Be movies
    }
     It "Matches TV > Foreign Category" {
        Get-DownloadCategory -Category "TV > Foreign" | Should Be tv
    }
     It "Matches PC > Mobile-Other Category" {
        Get-DownloadCategory -Category "PC > Mobile-Other" | Should Be software
    }
     It "Matches PC > 0day Category" {
        Get-DownloadCategory -Category "PC > 0day" | Should Be software
    }
     It "Matches Movies > BluRay Category" {
        Get-DownloadCategory -Category "Movies > BluRay" | Should Be movies
    }
     It "Matches Console > Xbox Category" {
        Get-DownloadCategory -Category "Console > Xbox" | Should Be software
    }
     It "Matches Books > Comics Category" {
        Get-DownloadCategory -Category "Books > Comics" | Should Be comics
    }
     It "Matches XXX > Pack Category" {
        Get-DownloadCategory -Category "XXX > Pack" | Should Be jizzles
    }
     It "Matches Books > Ebook Category" {
        Get-DownloadCategory -Category "Books > Ebook" | Should Be books
    }
     It "Matches Books > Mags Category" {
        Get-DownloadCategory -Category "Books > Mags" | Should Be magazines
    }
     It "Matches XXX > DVD Category" {
        Get-DownloadCategory -Category "XXX > DVD" | Should Be jizzles
    }
     It "Matches XXX > x264 Category" {
        Get-DownloadCategory -Category "XXX > x264" | Should Be jizzles
    }
     It "Matches Movies > Foreign Category" {
        Get-DownloadCategory -Category "Movies > Foreign" | Should Be movies
    }
     It "Matches PC > Games Category" {
        Get-DownloadCategory -Category "PC > Games" | Should Be software
    }
     It "Matches XXX > Other Category" {
        Get-DownloadCategory -Category "XXX > Other" | Should Be jizzles
    }
     It "Matches Movies > SD Category" {
        Get-DownloadCategory -Category "Movies > SD" | Should Be movies
    }
     It "Matches TV > Other Category" {
        Get-DownloadCategory -Category "TV > Other" | Should Be tv
    }
     It "Matches TV > Documentary Category" {
        Get-DownloadCategory -Category "TV > Documentary" | Should Be tv
    }
     It "Matches PC > Mobile-Android Category" {
        Get-DownloadCategory -Category "PC > Mobile-Android" | Should Be software
    }
     It "Matches Console > Wii Category" {
        Get-DownloadCategory -Category "Console > Wii" | Should Be software
    }
     It "Matches XXX > ImgSet Category" {
        Get-DownloadCategory -Category "XXX > ImgSet" | Should Be jizzles
    }
     It "Matches TV > HD Category" {
        Get-DownloadCategory -Category "TV > HD" | Should Be tv
    }
     It "Matches PC > ISO Category" {
        Get-DownloadCategory -Category "PC > ISO" | Should Be software
    }
     It "Matches XXX > WMV Category" {
        Get-DownloadCategory -Category "XXX > WMV" | Should Be jizzles
    }
     It "Matches PC > Mobile-iOS Category" {
        Get-DownloadCategory -Category "PC > Mobile-iOS" | Should Be software
    }
     It "Matches Console > PSP Category" {
        Get-DownloadCategory -Category "Console > PSP" | Should Be software
    }
}
