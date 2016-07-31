package NzbPowershell.vcsRoots

import jetbrains.buildServer.configs.kotlin.v10.*
import jetbrains.buildServer.configs.kotlin.v10.vcs.GitVcsRoot

object NzbPowershell_Adewale : GitVcsRoot({
    uuid = "31a85483-ab4c-40e2-9987-2225858d5426"
    extId = "NzbPowershell_Adewale"
    name = "Adewale"
    url = "git@github.com:benny-gold/Adewale.git"
    authMethod = customPrivateKey {
        customKeyPath = """C:\Users\ben\OneDrive\Keys\Anyteamcity.ppk"""
    }
})
