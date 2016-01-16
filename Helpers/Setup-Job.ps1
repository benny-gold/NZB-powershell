Param
(
[Parameter(Mandatory=$True,Position=1)]
[string]$ItemToSearchFor
)
$JobTrigger = New-JobTrigger -At $((get-date).AddSeconds(30)) -RepeatIndefinitely -RepetitionInterval (New-TimeSpan -Minutes 15) -Once
$JobOption = New-ScheduledJobOption -RequireNetwork -RestartOnIdleResume -StartIfIdle
Register-ScheduledJob -Name "Powershell Downloader - $ItemToSearchFor" -ScriptBlock `
    {C:\Git\Repos\NZB-powershell\Get-NewDownload.ps1
    Get-NewDownload -searchString $ItemToSearchFor -GetLatest -maxSize 500
    } -Trigger $JobTrigger -ScheduledJobOption $JobOption
