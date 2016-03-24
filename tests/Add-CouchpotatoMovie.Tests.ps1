$here = Split-Path -Parent $MyInvocation.MyCommand.Path
$sut = (Split-Path -Leaf $MyInvocation.MyCommand.Path).Replace(".Tests.", ".")
Import-Module "$here\..\NZB-Powershell.psm1"

Describe "Add-CouchpotatoMovie" {
    It "Doesn't error" {
        Add-CouchpotatoMovie -CouchURL $CouchURL -CouchAPIKey $couchKey | Should not Be $null
    }  
    It "Successfully adds movie" {
        (Add-CouchpotatoMovie -CouchURL $CouchURL -CouchAPIKey $couchKey -MovieID 0086250).Success | Should Be $true
    }
    It "Successfully finds movie" {
        (Add-CouchpotatoMovie -CouchURL $CouchURL -CouchAPIKey $couchKey -MovieID 0086250).movie.type | Should Be movie
    }
}

