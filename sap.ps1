
$Servers = Get-Content C:\Users\jmedrano\Desktop\pcs_claro

#Scanning Servers and executing 

$Servers | ForEach-Object {

invoke-command -ComputerName $_ -Scriptblock {
$CompName = (Get-WmiObject -Class Win32_ComputerSystem).Name


    $source="\\$CompName\c$\Users\Agente\Desktop\test.txt"
$destination="\\192.9.60.58\c$\Users\jmedrano\Desktop\foreach\"

Copy-Item -Recurse -path $source -destination $destination -Force



}
}