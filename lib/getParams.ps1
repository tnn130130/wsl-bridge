# $Param1=$args[0]
# write-host $Param1

# Pass in an arbitrary amount of arguments
write-host "You passed in $($args.count) arguments"
for ($i=0; $i -lt $args.count; $i++){
    write-host "Argument $i is $($args[$i])"
}