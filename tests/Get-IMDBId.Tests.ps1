$here = Split-Path -Parent $MyInvocation.MyCommand.Path
$sut = (Split-Path -Leaf $MyInvocation.MyCommand.Path).Replace(".Tests.", ".")
Import-Module "$here\..\NZB-Powershell.psd1" -Force

Describe "Get-IMDBId" {
    It "Returns the correct movie" {
         (Get-IMDBId -MovieName Scarface -OmdbApiKey $omdbApiKey).title | Should Be Scarface
    }
    It "Returns an IMDB Id" {
         (Get-IMDBId -MovieName "Die Hard" -OmdbApiKey $omdbApiKey).imdbID | Should Be 0095016
    }
}
