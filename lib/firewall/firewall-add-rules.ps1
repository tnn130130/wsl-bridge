$Port=2023
$DisplayName="Open WSL2"

Net-NetFireWallRule -DisplayName "$DisplayName Inbound" -Direction Inbound -LocalPort $Port -Action Allow -Protocol TCP

Net-NetFireWallRule -DisplayName "$DisplayName Outbound" -Direction Outbound -LocalPort $Port -Action Allow -Protocol TCP