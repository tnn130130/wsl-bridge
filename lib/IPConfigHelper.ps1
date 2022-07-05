function ShowNetInterfaceConfig($ipv){
    
    if($ipv -ne $null){
        netsh interface ipv$ipv show addresses
    }
    netsh interface ipv4 show config
}


ShowNetInterfaceConfig
ShowNetInterfaceConfig(6)