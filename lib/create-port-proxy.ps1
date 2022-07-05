# enable scripts: ps(admin)> set-executionpolicy remotesigned / disable scripts > set-executionpolicy [restricted | default]
# try listen address all(0.0.0.0)
$ListenAddress = "0.0.0.0"
$ListenPort = Read-Host "Enter port to listen on:"
$ConnectAddress = Read-Host "Enter address to connect to:" #vEthernet WSL
$ConnectPort= Read-Host "Enter port to connect to: "

$WSLAddress= wsl hostname -I
echo "wsl address : $WSLAddress"

# add v4tov4 listenport= {Integer | ServiceName} [[connectaddress=] {IPv4Address | HostName}] [[connectport=] {Integer | ServiceName}] [[listenaddress=] {IPv4Address | HostName}] [[protocol=]tcp]
netsh interface portproxy add v4tov4 `
listenport=$ListenPort `
connectaddress=$ConnectAddress `
connectPort=$ConnectPort `
listenAddress=$ListenAddress`

# netsh interface show [all | v[4|6]tov[4|6]]
netsh interface portproxy show all