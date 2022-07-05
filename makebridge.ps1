$port = read-host "Enter port to open: "

#default listen address is the host ip
$ph=$port

$ipc=wsl hostname -I
$ipc=$ipc.trim()
$pc=$port

echo "creating port proxy"
netsh int portproxy add v4tov4 listenport=$ph connectaddress=$ipc connectport=$pc 