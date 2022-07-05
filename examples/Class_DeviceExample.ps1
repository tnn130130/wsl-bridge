# https://docs.microsoft.com/en-us/powershell/module/microsoft.powershell.core/about/about_classes?view=powershell-7.2
class Device {
    [string]$Brand
}

$dev = [Device]::new()
$dev.Brand = "Microsoft"
$dev