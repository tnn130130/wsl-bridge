# $root = ../$PSScriptRoot
# echo "root is: $root"

# $logPath="../logs/test.log" does not work
$parent_dir = (get-item $PSScriptRoot).parent.FullName
echo "path to parent directory = $parent_dir"

"Test" | Out-File -FilePath $parent_dir/logs/test.log

# "The logging was successful" | Out-File -FilePath $logPath