$here = Split-Path -Parent $MyInvocation.MyCommand.Path
$sut = (Split-Path -Leaf $MyInvocation.MyCommand.Path).Replace(".Tests.", ".")
. "$here\..\$sut"

Describe "Add-CouchpotatoMovie" {
    It "Doesn't error" {
        Add-CouchpotatoMovie -CouchURL $CouchURL -CouchAPIKey $couchKey | Should not Be $null
    }  
    It "Finds the movie" {
        (Add-CouchpotatoMovie -CouchURL $CouchURL -CouchAPIKey $couchKey -MovieID (Get-IMDBId -MovieName scarface).imdbid).Success | Should Be $true
    } 
    It "Successfully adds movie" {
        (Add-CouchpotatoMovie -CouchURL $CouchURL -CouchAPIKey $couchKey).Success | Should Be $true
    }

}


Add-CouchpotatoMovie -CouchURL $CouchURL -CouchAPIKey $couchKey -MovieID tt0086250