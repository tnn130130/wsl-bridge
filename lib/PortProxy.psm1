# enable scripts: ps(admin)> set-executionpolicy remotesigned / disable scripts > set-executionpolicy [restricted | default]
# try listen address all(0.0.0.0)

class PortProxy {
    
    [string]$ListenAddress
    [int]$ListenPort
    
    [string]$ConnectAddress
    [int]$ConnectPort

    [void] makePortProxy([string]$ListenAddress, [int]$ListenPort, [string]$ConnectAddress, [int]$ConnectPort){
        netsh interface portproxy add v4tov4 
        listenport=$ListenPort `
        connectaddress=$ConnectAddress `
        connectport=$ConnectPort `
        listenaddress=$ListenAddress `

    }

    [void] reset(){
        echo "resetting port proxies..."
        netsh interface portproxy reset all
        echo "done"
    }

    [void] showAll(){
        netsh interface portproxy show all
    }

    [void] getIP(){
        $WslAddress = wsl hostname -I
        echo "Wsl IP = $WslAddress"
    }
}
