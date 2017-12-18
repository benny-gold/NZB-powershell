$here = Split-Path -Parent $MyInvocation.MyCommand.Path
$sut = (Split-Path -Leaf $MyInvocation.MyCommand.Path) -replace '\.Tests\.', '.'
. "$here\..\Helpers\$sut"

Describe "New-NZBSettingsObject" {
    context "Import a file" {
        It "Does not Error" {

        }
        It "Does a thing" { 

        }
    }
    Context "Export as File" {
        It "Does not Error" {
            
        }
        It "Does a thing" { 
            
        }
    }
    Context "Out as Object" {
        It "Does not Error" {
            
        }
        It "Does a thing" { 
            
        }
    }
    Context "Import an Object" {
        It "Does not Error" {
            
        }
        It "Does a thing" { 
            
        }
    }
}
