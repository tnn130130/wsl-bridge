# enable scripts: ps(admin)> set-executionpolicy remotesigned / disable scripts > set-executionpolicy [restricted | default]
# try listen address all(0.0.0.0)

class PortProxy {
    
    [string]$ip_listen = "0.0.0.0" # external/host ip
    [int]$port_listen # external port
    
    [string]$ip_connect # wsl ip
    [int]$port_connect # wsl port

    # constructor
    PortProxy(
        [string]$ipl,
        [int]$portl,
        [string]$ipc,
        [int]$portc
    ){
        $this.ip_listen = $ipl
        $this.port_listen = $portl
        $this.ip_connect = $ipc
        $this.port_connect = $portc
    }


    [void] makePortProxy([string]$ip_listen, [int]$port_listen, [string]$ip_connect, [int]$port_connect){
        netsh interface portproxy add v4tov4 `
        listenport=$port_listen `
        connectaddress=$ip_connect `
        connectport=$port_connect `
        listenaddress=$ip_listen `
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

# [PortProxy]$pp = [PortProxy]::new("0.0.0.0", 8000, "$wsl_address", 8000)