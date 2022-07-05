# Use this as a reference for powershell's automatic variables

# take arbitrary amount of arguments
# escape character is `(backtick)

#Last token
$LastToken=$$
# Execution status of last command
$ExecutionStatusOfLastCommand=$?
# First token of last line
$FirstTokenOfLastLine=$^
# Current object in pipelin object
$CurrentObjectInPipeline=$_

$args
$ConsoleFileName
$Error
$ErrorView
$EventArgs
$EventSubscriber
$ExecutionContext

# truth values
$false
$true
$null

$foreach

$Host
$input

# Operating system
$IsLinux
$IsMacOS
$IsWindows

$LastExitCode

$Matches

$MyInvocation
$MyInvocation.PSScriptRoot
$MyInvocation.PSCommandPath

# Processes
$PID



# Dictionary of the parameters that are passed to a script or function and their current values
$PSBoundParameters

# Object that represents the cmdlet or advanced function that's being run
$PSCmdlet



# Get culture of current Powershell session, culture determines the display format of numbers, currency and dates
$PSCulture

$PSDebugContext



$PSItem # same as $_

$PSNativeCommandArgumentPassing

# Paths
$HOME
$PSHOME
# full path of executing script's parent directory
$PSScriptRoot 
# Full path and file name of the script that's being run
$PSCommandPath
# Containe full path of powershell profile for current user
$PROFILE
# full path of the current directory
$PWD

# Enumerators
$input
$foreach
$switch
function GetAutomaticVariable($Description, $AutoVar){
    write-host "$Description"
    return $AutoVar
}

function GetLastToken(){
    write-host "Last token `$`$: $$"
    return $$
}

function GetExecutionStatusOfLastCommand(){
    write-host "Execution status of last command`$?:"
    return $?
}

function GetFirstTokenOfLastLine(){
    write-host "First token of last line `$^:"
    return $^
}

function CheckAutoVar($AutoVar){
    if($AutoVar -eq $$){
        write-host $true
    }
    if($AutoVar -eq $^){
        write-host $true
    }
    else{
        write-host "Probably not an automatic variable"
    }
}

function main(){
    GetLastToken
    GetFirstTokenOfLastLine
    CheckAutoVar($$)
    CheckAutoVar("not auto variable")
    CheckAutoVar($^)
}

main
