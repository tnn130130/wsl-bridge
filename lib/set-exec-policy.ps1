echo "set-executionpolicy [remotesigned | restricted]?"

$option=$args[0]

if($option -eq "restricted"){
    echo "setting $option"
    Set-ExecutionPolicy restricted
}elseif($option -eq "remotesigned"){
    echo "setting $option"
    Set-ExecutionPolicy remotesigned
}else{
    echo "setting default"
    Set-ExecutionPolicy default
}

