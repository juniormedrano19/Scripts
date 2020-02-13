

Write-Host "Remote copy a file" 
$username = 'Administrador' 
$password = 'R3c542016C4ll' 


Write-Host "Validando Usuario y Password"
$pw = ConvertTo-SecureString $password -AsPlainText -Force 
$cred = New-Object Management.Automation.PSCredential ($username, $pw) 
$servers = Get-Content C:\Users\jmedrano\Desktop\pcs_claro
foreach($server in $servers) { 
$s = New-PSSession -computerName $server -credential $cred 
Write-Host("Iniciando sesion en $server")
Write-Host "PC name: $server ..." -ForegroundColor GREEN -Background BLACK
$Copiar=

    {  $source='C:\Users\Agente\Desktop\test.txt';
        $destino='\\192.9.60.58\c$\Users\jmedrano\Desktop\cim';
        Copy-Item $source -Destination \\$_\$destino  -Recurse -PassThru}


echo $Copiar

$Job = Invoke-Command -Session $s  -ScriptBlock $Copiar -AsJob
    $Null = Wait-Job -Job $Job

Write-Host "Completed" 
Remove-PSSession -Session $s 
} 