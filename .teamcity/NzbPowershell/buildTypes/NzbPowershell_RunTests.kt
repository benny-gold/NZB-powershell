package NzbPowershell.buildTypes

import jetbrains.buildServer.configs.kotlin.v10.*
import jetbrains.buildServer.configs.kotlin.v10.BuildFeature
import jetbrains.buildServer.configs.kotlin.v10.BuildFeature.*
import jetbrains.buildServer.configs.kotlin.v10.buildSteps.PowerShellStep
import jetbrains.buildServer.configs.kotlin.v10.buildSteps.PowerShellStep.*
import jetbrains.buildServer.configs.kotlin.v10.buildSteps.powerShell
import jetbrains.buildServer.configs.kotlin.v10.triggers.VcsTrigger
import jetbrains.buildServer.configs.kotlin.v10.triggers.VcsTrigger.*
import jetbrains.buildServer.configs.kotlin.v10.triggers.vcs

object NzbPowershell_RunTests : BuildType({
    uuid = "6fc9bd07-e9d7-421d-bbc6-9c25660714ed"
    extId = "NzbPowershell_RunTests"
    name = "Run Tests"

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
    buildNumberPattern = "1.0.0.%build.counter%"

    vcs {
        root(NzbPowershell.vcsRoots.NzbPowershell_NZBPowershell)

        checkoutMode = CheckoutMode.ON_SERVER
    }

    steps {
        powerShell {
            name = "Setup Secrets"
            platform = PowerShellStep.Platform.x64
            scriptMode = script {
                content = """Copy-Item "C:\Git\Repos\NZB-powershell\secrets.ps1" %system.teamcity.build.checkoutDir%"""
            }
            noProfile = true
        }
        powerShell {
            name = "Run Tests"
            platform = PowerShellStep.Platform.x64
            scriptMode = script {
                content = """Import-Module "C:\Users\ben\Documents\WindowsPowerShell\Modules\Pester-master\Pester.psm1"
Invoke-Pester -OutputFormat NUnitXml -OutputFile Tests.xml"""
            }
            noProfile = true
        }
    }

    triggers {
        vcs {
        }
    }

    features {
        feature {
            type = "xml-report-plugin"
            param("xmlReportParsing.reportDirs", "Tests.xml")
            param("xmlReportParsing.reportType", "nunit")
        }
        feature {
            type = "commit-status-publisher"
            param("github_authentication_type","token")
            param("github_host","https://api.github.com")
            param("github_username","benny-gold")
            param("publisherId","githubStatusPublisher")
            param("vcsRootId","NzbPowershell_NZBPowershell")
        }
    }
})
