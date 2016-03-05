$here = Split-Path -Parent $MyInvocation.MyCommand.Path
$sut = (Split-Path -Leaf $MyInvocation.MyCommand.Path).Replace(".Tests.", ".")
. "$here\..\$sut"
. "$here\..\secrets.ps1"


Describe "Send-Download" {
    It "Drops NZB to SabNZBd+" {
        Send-Download -SabNZBdplus $sabUrl -APIKey $sabKey -NZBURL "NZB" -NZBTitle "Not an NZB" -sabCategory jizzles | Should Match "ok"
    }
}
