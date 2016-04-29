$here = Split-Path -Parent $MyInvocation.MyCommand.Path
$sut = (Split-Path -Leaf $MyInvocation.MyCommand.Path).Replace(".Tests.", ".")
Import-Module "$here\..\NZB-Powershell" -Force

Describe "Search-NewzNab" {
    It "Finds a Movie by Name" {
    (Search-Newznab -NewzNab $geekURL -APIKey $geekKey -searchString "Avengers" -Movie).count | Should not be 0
    }
    It "Finds a Movie by IMDB ID" {
    (Search-Newznab -NewzNab $geekURL -APIKey $geekKey -Movie -IMDBId 3659388 -language English)[1].description | Should Match Martian
    }
    It "Finds an Album by Artist" {
    (Search-Newznab -NewzNab $geekURL -APIKey $geekKey -Music -Artist Kanye).count | Should not be 0
    }
    It "Finds a TV show by TVDB ID" {
    (Search-Newznab -NewzNab $geekURL -APIKey $geekKey -TV -TVDBId 75805)[0].description | Should match Sunny
    }
    It "Finds a TV show by TVRage ID" {
    (Search-Newznab -NewzNab $geekURL -APIKey $geekKey -TV -TVRageId 23658)[0].description | Should match Workaholics
    }
    It "Finds a Thing" {
    (Search-Newznab -NewzNab $geekURL -APIKey $geekKey -searchString "Xbox").count| Should not be 0
    }
}
