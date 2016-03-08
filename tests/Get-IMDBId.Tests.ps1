$here = Split-Path -Parent $MyInvocation.MyCommand.Path
$sut = (Split-Path -Leaf $MyInvocation.MyCommand.Path).Replace(".Tests.", ".")
. "$here\..\Providers\$sut"

Describe "Get-IMDBId" {
    It "Returns the correct movie" {
         (Get-IMDBId -MovieName Scarface).title | Should Be Scarface
    }
    It "Returns an IMDB Id" {
         (Get-IMDBId -MovieName "Die Hard").imdbID | Should Be 0095016
    }
}
