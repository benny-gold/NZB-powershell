$here = Split-Path -Parent $MyInvocation.MyCommand.Path
$sut = (Split-Path -Leaf $MyInvocation.MyCommand.Path).Replace(".Tests.", ".")
. "$here\..\Notifications\$sut"
. "$here\..\secrets.ps1"


Describe "Send-MailgunMessage" {
    It "Sends Test Email" {
        $successMessage =  "Queued. Thank you."
        (Send-MailgunMessage -to $mailRecipient1 -fromName UnitTest -sender "Unit Test" -Domain $mailDomain -APIKey $mailgunKey -html "This is a Unit Test").Message | Should Be $successMessage
    }

}

