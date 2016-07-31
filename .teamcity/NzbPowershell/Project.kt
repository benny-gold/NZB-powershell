package NzbPowershell

import NzbPowershell.buildTypes.*
import NzbPowershell.vcsRoots.*
import NzbPowershell.vcsRoots.NzbPowershell_NZBPowershell
import jetbrains.buildServer.configs.kotlin.v10.*
import jetbrains.buildServer.configs.kotlin.v10.Project
import jetbrains.buildServer.configs.kotlin.v10.ProjectFeature
import jetbrains.buildServer.configs.kotlin.v10.ProjectFeature.*
import jetbrains.buildServer.configs.kotlin.v10.projectFeatures.VersionedSettings
import jetbrains.buildServer.configs.kotlin.v10.projectFeatures.VersionedSettings.*
import jetbrains.buildServer.configs.kotlin.v10.projectFeatures.versionedSettings

object Project : Project({
    uuid = "45848e0d-45a6-4bd3-b4a0-b95c95876466"
    extId = "NzbPowershell"
    parentId = "_Root"
    name = "NZB Powershell"

    vcsRoot(NzbPowershell_NZBPowershell)
    vcsRoot(NzbPowershell_Adewale)

    buildType(NzbPowershell_PerformSearches)
    buildType(NzbPowershell_RunTests)

    features {
        feature {
            id = "PROJECT_EXT_1"
            type = "OAuthProvider"
            param("clientId", "053e397faa5637e35a56")
            param("displayName", "GitHub.com")
            param("gitHubUrl", "https://github.com/")
            param("providerType", "GitHub")
            param("secure:clientSecret", "zxx3c7203959580b35a19a8422918b6c7b83fd8038d8d806a0af893a970ea839480975e5c635568c796775d03cbe80d301b")
        }
        feature {
            id = "PROJECT_EXT_2"
            type = "IssueTracker"
            param("authType", "anonymous")
            param("name", "GH NZB Issues")
            param("pattern", """#(\d+)""")
            param("repository", "https://github.com/benny-gold/NZB-powershell")
            param("secure:accessToken", "zxx775d03cbe80d301b")
            param("secure:password", "zxx775d03cbe80d301b")
            param("type", "GithubIssues")
            param("username", "")
        }
        versionedSettings {
            id = "PROJECT_EXT_5"
            mode = VersionedSettings.Mode.ENABLED
            buildSettingsMode = VersionedSettings.BuildSettingsMode.PREFER_CURRENT_SETTINGS
            rootExtId = NzbPowershell_NZBPowershell.extId
            showChanges = true
            settingsFormat = VersionedSettings.Format.KOTLIN
        }
    }
    buildTypesOrder = arrayListOf(NzbPowershell.buildTypes.NzbPowershell_RunTests, NzbPowershell.buildTypes.NzbPowershell_PerformSearches)
})
