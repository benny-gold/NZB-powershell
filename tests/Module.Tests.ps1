$here = Split-Path -Parent $MyInvocation.MyCommand.Path
Import-Module "$here\..\NZB-Powershell.psm1" -Force

Describe "NZB-Powershell Module" {

    It "Imports Successfully" {
        $test = { Import-Module "$here\..\NZB-Powershell.psd1" } | Should Not Throw
        (Get-Command -Module NZB-Powershell).Count | should not be 0
    }

    Context "File Encoding" {
        function Get-FileEncoding {
            # source https://gist.github.com/jpoehls/2406504
            # simplified.
        
            [CmdletBinding()] 
            Param (
                [Parameter(Mandatory = $True, ValueFromPipelineByPropertyName = $True)] 
                [string]$Path
            )
        
            [byte[]]$byte = get-content -Encoding byte -ReadCount 4 -TotalCount 4 -Path $Path
        
            if ( $byte[0] -eq 0xef -and $byte[1] -eq 0xbb -and $byte[2] -eq 0xbf ) { 
                Write-Output 'UTF8' 
            }
            else { 
                Write-Output 'ASCII' 
            }
        }

        
        foreach ($file in $(Get-ChildItem -Recurse -Path "$here\.." -Include "*.ps*1" -Exclude "*NZB-Powershell.psd1")) {
            It "$($file.Name) is UTF-8 encoded" {
                Get-FileEncoding -Path $file.FullName | should be "UTF8"
            }
        }
    }

    Context 'ScriptAnalyzer Rules' {
        $analysis = Invoke-ScriptAnalyzer -Path  "$here\..\" -Setting $here\AnalyserRules.psd1 -Recurse
        $scriptAnalyzerRules = Get-ScriptAnalyzerRule
        forEach ($rule in $scriptAnalyzerRules) {
            It "Should pass $rule" {
                If ($analysis.RuleName -contains $rule) {
                    $analysis | Where-Object RuleName -eq $rule -OutVariable failures | Out-Default
                    $failures.Count | Should Be 0
                }
            }
        }
    }

    Context 'Indentations' {

        It "We use spaces in this town." {
            $totalTabsCount = 0
            Get-ChildItem -Recurse -Path "$here\.." -Include "*.ps*1" -Exclude "*NZB-Powershell.psd1" | %{
                $fileName = $_.FullName
                cat $_.FullName -Raw | Select-String "`t" | % {
                    Write-Warning "There are tab in $fileName"
                    $totalTabsCount++
                }
            }
            $totalTabsCount | Should Be 0
        }
    }
}



    Context "All Functions have Tests" {
        $functions = Get-ChildItem  -Path "$here\..\*-*.ps1" -Recurse -Exclude "**\powershell-notifications\*"
        foreach ($Function in $functions) {
            It "$($function.BaseName) has a Test suite in the correct location." {
                $($Function.FullName) -replace '(.+)\\(\w+-\w+)(\.ps1)$', 'HERESUT\$2.Tests$3' -replace 'HERESUT', "$here" | Should Exist
            }
        }
    }

}
