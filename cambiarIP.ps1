Write-Host "Cambio de direcciones IP " -ForegroundColor Black -BackgroundColor White;
$username = 'Administrador' 
$password = 'R3c542016C4ll' 
Write-Host "Validando Usuario y Password"
$pw = ConvertTo-SecureString $password -AsPlainText -Force 
$cred = New-Object Management.Automation.PSCredential ($username, $pw) 
$Computers=Get-Content C:\Users\jmedrano\Desktop\powershell\pcs_claro
#$i=10;
foreach($Computer in $Computers){
    $s = New-PSSession -computerName $Computer -credential $cred 

Write-Host "La ip actual es: $Computer" -ForegroundColor  Red -BackgroundColor Cyan ;

#$i=10;

$final={
   
          $oreo= get-wmiobject win32_networkadapter | where-object {$_.netconnectionstatus -eq 2}
            
          $clima=get-wmiobject win32_networkadapterconfiguration|where-object {$_.Index -eq $oreo.DeviceID};
           $clima.SetGateways("192.9.62.6");
           Write-Host "Completado ";

    
}
$borrar={
    Remove-Item -Path "C:\cambio"
   Remove-Item -Path "C:\ambito"
    Remove-Item -Path "C:\ambito.txt"
    
}
 


$Job = Invoke-Command -Session $s -ScriptBlock $final -AsJob 
 $Null = Wait-Job -Job $Job

 Write-Host "Completed" 
 Remove-PSSession -Session $s 
}
