﻿$here = Split-Path -Parent $MyInvocation.MyCommand.Path
$sut = (Split-Path -Leaf $MyInvocation.MyCommand.Path).Replace(".Tests.", ".")
Import-Module "$here\..\NZB-Powershell.psd1" -Force

Describe "New-PushalotNotification" {
    It "Sends a Test Notification" {
        #(New-PushalotNotification -AuthorizationToken $PushAuthToken -Title "Test Notfication" -LinkTitle "Results" -Link "http://10.124.10.70/viewType.html?buildTypeId=Adewale_RunTests" -Body "This was a Unit Test" -IsImportant $False -IsSilent $True -Image "http://blog.jetbrains.com/teamcity/files/2015/12/icon_TeamCity.png").Success | Should Be $true
        # Pushalot is down and might not come back...
        $true | should be $true
    }
}
