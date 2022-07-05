param (
    [Parameter(Mandatory=$false)]$ports
)

# powershell -File ./test1.ps1 -ports 1,2,3,4

if($PSBoundParameters.ContainsKey('ports')){
    # parse string by splitting on commas(',')
    $PortIntArray = [int[]]($ports -split ',')
}else{
    echo "Ports to open (1,2,3,..., 65535):"
    $ports = Read-Host "Enter ports to open:"
    $PortIntArray = [int[]]($ports -split ',')
}

echo " For help: powershell -File ./script.ps1 -help`n"
Read-Host -Prompt "Type any key to exit"