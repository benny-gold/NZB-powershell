$here = Split-Path -Parent $MyInvocation.MyCommand.Path
$sut = (Split-Path -Leaf $MyInvocation.MyCommand.Path).Replace(".Tests.", ".")
Import-Module "$here\..\NZB-Powershell.psm1"

Describe "Get-SabNZBdHistory" {
    $link = "https://api.nzbgeek.info/api?t=get&id=75fc16fb24f31f48d29102994ce6d670&apikey=85490c5bff3d1a707daa276eda7f5311"
    
    It "Returns false if download not already snatched" {
    Get-SabNZBdHistory -SabNZBdplus $sabUrl -APIKey $sabKey -NZBId $link | Should Be $false
    }
    
    $link = "The.Inbetweeners-S03E02-The.Gig.and.the.Girlfriend.SDTV.XviD.MP3-Obfuscated.nzb"
    It "Returns true if download already snatched" {
    Get-SabNZBdHistory -SabNZBdplus $sabUrl -APIKey $sabKey -NZBId $link | Should Be $true
    }
}
