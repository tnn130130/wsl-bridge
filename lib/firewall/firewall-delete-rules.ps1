$DisplayName="Open WSL2"
try{
Remove-NetFireWallRule -DisplayName "$DisplayName Inbound"
Remove-NetFireWallRule -DisplayName "$DisplayName Outbound"
} catch{echo "None found"}