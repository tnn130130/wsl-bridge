class WslHelper{
    [void]GetVersion(){
        wsl -l -v
    }

    [void]ShutDown(){
        wsl --shutdown
    }
}