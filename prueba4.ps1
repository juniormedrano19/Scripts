Write-Host "Cambio de direcciones IP " -ForegroundColor Black -BackgroundColor White;
$username = 'Administrador' 
$password = 'R3c542016C4ll' 
Write-Host "Validando Usuario y Password"
$pw = ConvertTo-SecureString $password -AsPlainText -Force 
$cred = New-Object Management.Automation.PSCredential ($username, $pw) 
$Computers=Get-Content C:\Users\jmedrano\Desktop\pcs_claro
#$i=10;
foreach($Computer in $Computers){
    $s = New-PSSession -computerName $Computer -credential $cred 

Write-Host "La ip actual es: $Computer" -ForegroundColor  Red -BackgroundColor Cyan ;

#$i=10;
$sip={
#$i=1..254;
$i=110;
$localIpAddress=((ipconfig | findstr [0-9].\.)[0]).Split()[-1];
$localIpAddress >C:\pcs;

$ip=$localIpAddress.split(".")[3];
$seccion=$localIpAddress.split(".")[2];
#$mundo= $localIpAddress -replace "$ip","$i" -replace "$seccion","61" ;
$mundo= $localIpAddress -replace "$ip","$i" -replace "$seccion","95" ;
$mundo>C:\pcs; 
#$i>C:\num;
   $mask="255.255.255.0"
    $peru=Get-Content C:\pcs
          $oreo= get-wmiobject win32_networkadapter | where-object {$_.netconnectionstatus -eq 2}
            
            $clima=get-wmiobject win32_networkadapterconfiguration|where-object {$_.Index -eq $oreo.DeviceID};
           $clima.SetGateways("192.9.60.1");
            Write-Host "Completado ";
            $clima.SetDNSServerSearchOrder("8.8.8.8");
            Write-Host "Completado MascaraSubred";
            $clima.EnableStatic($peru,$mask);
}
$Job = Invoke-Command -Session $s -ScriptBlock $sip -AsJob 
 $Null = Wait-Job -Job $Job

 Write-Host "Completed" 
 Remove-PSSession -Session $s 
}
