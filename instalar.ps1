Write-Host "Install programs Open Office and Adobe Reader  "
$username = 'Administrador' 
$password = 'R3c542016C4ll' 



Write-Host "Validando Usuario y Password"
$pw = ConvertTo-SecureString $password -AsPlainText -Force 
$cred = New-Object Management.Automation.PSCredential ($username, $pw) 
$servers = Get-Content C:\Users\jmedrano\Desktop\pcs_claro
foreach($server in $servers) { 
$s = New-PSSession -computerName $server -credential $cred 
Write-Host "PC name: $server ..." -ForegroundColor GREEN -Background BLACK
Write-Host "Copiando ..."
$source = "\\192.9.60.61\RecsaPeru\Deploy\OpenOffice\Apache_OpenOffice_4.1.2_Win_x86_install_es.exe";
$destination="\\$server\c$\"
Copy-Item -Path $source -Destination $destination;
#Write-Host "Instalando ..."

#$instalar={
    #Start-Process -Wait -FilePath "C:\Apache_OpenOffice_4.1.2_Win_x86_install_es.exe"  -ArgumentList "/S"  -PassThru ;
   #}
    
#$Job = Invoke-Command -Session $s -ScriptBlock $instalar -AsJob 
 #   $Null = Wait-Job -Job $Job

Write-Host "Completed" 

Remove-PSSession -Session $s 
} 