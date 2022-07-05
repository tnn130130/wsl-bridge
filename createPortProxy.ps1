# enable scripts: ps(admin)> set-executionpolicy remotesigned / disable scripts > set-executionpolicy [restricted | default]
# try listen address all(0.0.0.0)

class PortProxy {
    
    [string]$ip_listen # external/host ip
    [int]$port_listen # external port
    
    [string]$ip_connect # wsl ip
    [int]$port_connect # wsl port

    <#
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
    #>

    static [void] makePortProxy([string]$ip_listen, [int]$port_listen, [string]$ip_connect, [int]$port_connect){
        
        echo "creating port proxies"
        
        echo "listening: ${ip_listen}:$port_listen, fowarding to: ${ip_connect}:$port_connect "
        
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

    [void] getWslIP(){
        $WslAddress = wsl hostname -I
        echo "Wsl IP = $WslAddress"
    }
}

function add-firewall-rules(){
    $displayName = "wsl port proxy rule"

    Net-NetFireWallRule -DisplayName "$DisplayName Inbound" -Direction Inbound -LocalPort $pp.port_listen -Action Allow -Protocol TCP

    Net-NetFireWallRule -DisplayName "$DisplayName Outbound" -Direction Outbound -LocalPort $pp.port_listen -Action Allow -Protocol TCP
}

function reset-firewall-rules(){
    # remove firewall rules
    # reset net interface
}

function makePortProxy([string]$ip_listen, [int]$port_listen, [string]$ip_connect, [int]$port_connect){
        
        echo "creating port proxies"
        
        echo "listening: ${ip_listen}:$port_listen"
        echo "fowarding to: ${ip_connect}:$port_connect "
        
        netsh interface portproxy add v4tov4 `
        listenport=$port_listen `
        connectaddress=$ip_connect `
        connectport=$port_connect `
        listenaddress=$ip_listen `
}

function makePortProxy2([string]$ip_host, [int]$port_host, [string]$ip_w, [int]$port_w){
        
        echo "creating port proxies"
        
        echo "listening on: $ip_host - $port_host"
        echo "fowarding to: $ip_w - $port_w "
        
        netsh interface portproxy add v4tov4 listenport=$port_host connectaddress=$ip_w connectport=$port_w
}

$ip_host = 0.0.0.0
# $port_listen = Read-Host "Enter host port to listen on: "
$port_host = 8448
$ip_w = wsl hostname -I
$ip_w = $ip_w.Trim()
# $port_connect = Read-Host "Enter wsl port to connect to: "
$port_w = 8448


makePortProxy2($ip_host, $port_host, $ip_w, $port_w)
makePortProxy2($ip_host, 8008, 172.28.247.85,$ip_w, 8008)
# makePortProxy2($ip_listen, $port_listen, $ip_connect, $port_connect)