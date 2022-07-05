echo "root directory = $PSScriptRoot"
echo "script path = $scriptPath"

$parent_dir = (get-item $PSScriptRoot).parent
$parent_dir_path = (get-item $PSScriptRoot).parent.FullName

echo "Parent directory = $parent_dir" 
echo "Parent directory path = $parent_dir_fullname" 
# get parent directoy of script
# $parent_dir = . ../$PSScriptRoot
# echo "parent directory = $parent_dir"