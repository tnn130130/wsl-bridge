## WSL Bridge

WSL normally does not allow you to connect directly to the internet because windows puts it behind a dynamic virtual ip. Only use this if you know your network is secure.

This wsl bridge will allow you to connect wsl directly to the internet for development purposes.

How it works:
    Get Ip Address of WSL 2 machine
    Remove previous port forwarding rules
    Add port Forwarding rules
    Remove previously added firewall rules
    Add new Firewall Rules

This script requires administrator privileges.

enable scripts: 
ps(admin)> `set-executionpolicy remotesigned` 

disable scripts ps > `set-executionpolicy restricted`

To start:
`./main.ps1`