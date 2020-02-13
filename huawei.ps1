Write-Host "Remote copy a file" 
$username = 'Administrador' 
$password = 'R3c542016C4ll' 



Write-Host "Validando Usuario y Password"
$pw = ConvertTo-SecureString $password -AsPlainText -Force 
$cred = New-Object Management.Automation.PSCredential ($username, $pw) 
$servers = Get-Content C:\Users\jmedrano\Desktop\pcs_claro
foreach($server in $servers) { 
$s = New-PSSession -computerName $server -credential $cred 
Write-Host "PC name: $server ..." -ForegroundColor GREEN -Background BLACK
#Leer y Enviar a pc local lo del inventario de cada pc remota q antes fue ejecutado por Recti en CommandRemote ()
Write-Host "Leyendo ..."
$myfile = [System.IO.File]::ReadAllText( "\\$server\c$\inventario.txt") ;
$data=$server + "," + $myfile;
 $data >> C:\Users\jmedrano\Desktop\mundo\consolidado.txt

#Write-Host "Escribiendo ..."
#$Escribir={[System.IO.File]::WriteAllText("\\192.9.60.58\c$\Users\jmedrano\Desktop\mundo\junior.txt", $args)} ;
#echo $Escribir
#$Job = Invoke-Command -Session $s -ArgumentList $myfile -ScriptBlock $Escribir -AsJob
    #$Null = Wait-Job -Job $Job

Write-Host "Completed" 

Remove-PSSession -Session $s 
} 

