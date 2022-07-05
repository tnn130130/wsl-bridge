# wsl port proxy

# use this to allow remote connections to your wsl instance

# include external scripts by dot sourcing: . D:\script_common\MyCode.ps1

# run external scripts with: Invoke-Expression -Command $PSScriptRoot/path/to/script

# add external scripts and dot source in current scope here

using module ./lib/PortProxy.psm1

$PortProxy="PortProxy.ps1"



class Main{
    [void]test(){
        write-host "Testing..."
        Write-Host "Script:" $PSCommandPath
        Write-Host "Path:" $PSScriptRoot
        Invoke-Expression -Command $PSScriptRoot/test/testExternal.ps1
        write-host "MyInvocation: $MyInvocation.MyCommand.Name"
        write-host "PSCommandPath: $PSCommandPath"
    }

    [void]run(){
        write-host "starting..."
    }
}


$main=[Main]::new()


if($args[0] -eq "run"){
    $main.run()
}
elseif ($args[0] -eq "test"){
    $main.test()
}
elseif ($args[0] -eq "help"){
    Write-Host "usage: ./main.ps1 [test | run]"
    Write-Host "e.g. ./main.ps1 run"
}

# powershell
# wsl port proxy
# tnn130130