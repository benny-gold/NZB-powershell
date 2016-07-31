package NzbPowershell.vcsRoots

import jetbrains.buildServer.configs.kotlin.v10.*
import jetbrains.buildServer.configs.kotlin.v10.vcs.GitVcsRoot

object NzbPowershell_NZBPowershell : GitVcsRoot({
    uuid = "77f92c96-266f-4327-81cb-f9543426c4dc"
    extId = "NzbPowershell_NZBPowershell"
    name = "NZBPowershell"
    url = "git@github.com:benny-gold/NZB-powershell.git"
    branchSpec = "+:refs/heads/* +:refs/pull/*/"
    authMethod = customPrivateKey {
        customKeyPath = """C:\Users\ben\OneDrive\Keys\Anyteamcity.ppk"""
    }
})
