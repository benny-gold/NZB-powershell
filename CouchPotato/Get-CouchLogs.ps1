function Get-CouchLogs {
    [OutputType([Object])]
        Param
        (
        [Parameter(Mandatory=$True,Position=0)]
        [string]
        $couchUrl,

        [Parameter(Mandatory=$True,Position=1)]
        [string]
        $couchApiKey,

        # 	Number of lines. Last to first. Default 30
        [Parameter(Mandatory=$false,Position=2)]
        [int]
        $lines=30,

        [Parameter(Mandatory=$false,Position=3)]
        [ValidateSet("all","error","info","debug")]
        [string]
        $logType="all"
        )

        # Couchpotato's renamer doesn't work. This function forces a restart after each item is moved. It stops when the "From" path is empty.

        class couchLog{ 
            [datetime]$logDate
            [string]$type
            [string]$logCategory
            [string]$logMessage
            }

        $loggingEndpoint = "logging.partial"

        $logs = Invoke-RestMethod "$CouchURL/api/$couchApiKey/$($loggingEndpoint)?lines=$lines&type=$logType"
        $logObjectArray = @()

        foreach($logEntry in $logs.log)
            {
            $logObject = New-Object -TypeName couchLog
            $logObject.logCategory = $logEntry.message -replace '(\[(?:\w+\.)+\w+\])(\s)([\s\S]+)',"`$1"
            $logObject.logMessage = $logEntry.message -replace '(\[(?:\w+\.)+\w+\])(\s)([\s\S]+)',"`$3"

            $logObject.logDate = [datetime]::ParseExact($($logEntry.time), "MM-dd HH:mm:ss", [System.Globalization.CultureInfo]::InvariantCulture, [System.Globalization.DateTimeStyles]::None)

            $logObject.type = $logEntry.type
            $logObjectArray += $logObject
            }


        return $logObjectArray
}

