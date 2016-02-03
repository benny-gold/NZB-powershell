Param
(
[Parameter(Mandatory=$True,Position=1)]
[string]$ItemToSearchFor
)

$ScriptBlock= {
. C:\Git\Repos\NZB-powershell\Get-NewDownload.ps1
Get-NewDownload -searchString "$($args[0] | Out-String)" -GetLatest -maxSize 500
} 



$JobTrigger = New-JobTrigger -At $((get-date).AddSeconds(30)) -RepeatIndefinitely -RepetitionInterval (New-TimeSpan -Minutes (Get-Random -Minimum 720 -Maximum 1440)) -Once
$JobOption = New-ScheduledJobOption -RequireNetwork -RestartOnIdleResume -StartIfIdle



Register-ScheduledJob -Name "Powershell Downloader - $ItemToSearchFor" -FilePath "C:\Git\Repos\PiracyAutomation\Get-NewDownloadJob.ps1" -Trigger $JobTrigger -ScheduledJobOption $JobOption -ArgumentList ($ItemToSearchFor,500) -Verbose



