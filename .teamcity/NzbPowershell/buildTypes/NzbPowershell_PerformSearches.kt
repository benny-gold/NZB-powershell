package NzbPowershell.buildTypes

import jetbrains.buildServer.configs.kotlin.v10.*
import jetbrains.buildServer.configs.kotlin.v10.buildSteps.PowerShellStep
import jetbrains.buildServer.configs.kotlin.v10.buildSteps.PowerShellStep.*
import jetbrains.buildServer.configs.kotlin.v10.buildSteps.powerShell
import jetbrains.buildServer.configs.kotlin.v10.triggers.ScheduleTrigger
import jetbrains.buildServer.configs.kotlin.v10.triggers.ScheduleTrigger.*
import jetbrains.buildServer.configs.kotlin.v10.triggers.schedule

object NzbPowershell_PerformSearches : BuildType({
    uuid = "28a12096-86cc-4dec-996f-b945ac0d1d1d"
    extId = "NzbPowershell_PerformSearches"
    name = "Perform Searches"

    buildNumberPattern = "1.0.0.%build.counter%"

    vcs {
        checkoutMode = CheckoutMode.ON_SERVER
    }

    steps {
        powerShell {
            executionMode = BuildStep.ExecutionMode.RUN_ON_FAILURE
            platform = PowerShellStep.Platform.x64
            scriptMode = script {
                content = """${'$'}newjobs  = get-content C:\tweets\searches.txt
Import-Module .\NZB-Powershell.psd1 -force
${'$'}documentDBLocation = "C:\tweets\downloads"
foreach (${'$'}newjob in ${'$'}newjobs)
{
Get-NewDownload -searchString ${'$'}newjob -FilterLatest -documentDBLocation ${'$'}documentDBLocation 
}"""
            }
            noProfile = false
        }
    }

    triggers {
        schedule {
            schedulingPolicy = cron {
                hours = "0/3"
            }
            triggerBuild = always()
            withPendingChangesOnly = false
            param("revisionRule", "lastFinished")
            param("dayOfWeek", "Sunday")
        }
    }

    dependencies {
        artifacts(NzbPowershell.buildTypes.NzbPowershell_RunTests) {
            buildRule = lastSuccessful("<default>")
            artifactRules = """CouchPotato => CouchPotato
Helpers => Helpers
Notifications => Notifications
Providers => Providers
SabNZBd+ => SabNZBd+
Sonarr => Sonarr
Get-NewDownload.ps1
NZB-Powershell.psm1
NZB-Powershell.psd1
secrets.ps1
Classes.ps1"""
        }
    }
})
