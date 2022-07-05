#netsh interface ipv4 set address name="YOUR INTERFACE NAME" static IP_ADDRESS SUBNET_MASK GATEWAY
if( ($args.count) -eq 1){
    $Gateway=$args[0]
    netsh interface ipv4 set address name="something" gateway=$Gateway
}

$Gateway="192.168.1.1"
netsh interface ipv4 set address name="vEthernet (WSL)" gateway=$Gateway