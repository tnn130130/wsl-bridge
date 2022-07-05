# Include Powershell script in a Powershell script
#Call myScript1 from myScript2
# invoke-expression -Command .\myScript1.ps1 # throws error

Write-Host "Script:" $PSCommandPath
Write-Host "Path:" $PSScriptRoot