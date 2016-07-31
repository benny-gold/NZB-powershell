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
            param("secure:clientSecret", "%gihtub.client.secret%")
        }
        feature {
            id = "PROJECT_EXT_2"
            type = "IssueTracker"
            param("authType", "anonymous")
            param("name", "GH NZB Issues")
            param("pattern", """#(\d+)""")
            param("repository", "https://github.com/benny-gold/NZB-powershell")
            param("secure:accessToken", "%github.access.key.public%")
            param("secure:password", "%github.access.key.public%")
            param("type", "GithubIssues")
            param("username", "")
        }
        versionedSettings {
            id = "PROJECT_EXT_5"
            mode = VersionedSettings.Mode.ENABLED
            buildSettingsMode = VersionedSettings.BuildSettingsMode.VCS
            rootExtId = NzbPowershell_NZBPowershell.extId
            showChanges = true
            settingsFormat = VersionedSettings.Format.KOTLIN
        }
    }
    buildTypesOrder = arrayListOf(NzbPowershell.buildTypes.NzbPowershell_RunTests, NzbPowershell.buildTypes.NzbPowershell_PerformSearches)
})
