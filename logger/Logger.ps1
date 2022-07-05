$PSScriptRoot
$logPath="./logs/log.txt"

"This will be written to the log" | Out-File -FilePath $logPath