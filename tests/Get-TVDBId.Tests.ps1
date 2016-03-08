$here = Split-Path -Parent $MyInvocation.MyCommand.Path
$sut = (Split-Path -Leaf $MyInvocation.MyCommand.Path).Replace(".Tests.", ".")
. "$here\..\Providers\$sut"
. "$here\..\secrets.ps1"

Describe "Get-TVDBId" {
    It "returns a TV Show" {
        Get-TVDBId -Show Workaholics -APIKey $TVDBIDKey | Should Not Be $null
    }
    It "returns a TV Show with a space in the name" {
        Get-TVDBId -Show "Rick and Morty" -APIKey $TVDBIDKey | Should Not Be $null
    }
    It "should Throw an Error if the show doesn't exist" {
        Get-TVDBId -Show "ae;kflhjs y09u098h spodnfkn" -APIKey $TVDBIDKey | Should Throw
    }
}