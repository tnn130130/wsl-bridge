# include
using module ../helper/Class_PortProxy.ps1

# call operator & invokes in a child scope
# dot sourcing executes a script in the current scope

write-host "#Including $PSCommandPath"

$portProxy = [PortProxy]::new()

$anyAddress="0.0.0.0"
$listenPort=2023
# Wsl VEthernet
$connectAddress=portProxy.getWslAddress
$connectPort=2023

# Instantiate the class

$portProxy.ListenAddress = $anyAddress
$portProxy.ListenPort = $listenPort
$portProxy.ConnectAddress = $connectAddress
$portProxy.ConnectPort = $connectPort

# make port proxy
$portProxy.makePortProxy
# show port proxy
$portProxy.showAllPortProxy