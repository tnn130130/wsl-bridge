$Address="172.17.80.2"
$Mask="255.255.240.0"
$Gateway="192.168.1.1"

netsh interface ip add address name="Ethernet adapter vEthernet (WSL) 2" static $Address mask=$Mask gateway=$Gateway