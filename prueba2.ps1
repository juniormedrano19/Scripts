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


    
 
    
        
           # set-DnsClientServerAddress -InterfaceAlias $oreo.netconnectionid -ServerAddresses 10.232.163.154,10.232.163.155,10.232.163.156,10.232.163.157,10.181.23.51,10.181.23.52,10.181.23.103,10.186.234.34,10.186.234.35,10.186.234.36,10.186.234.37;
            
            #Set-DnsClientGlobalSetting -SuffixSearchList @("188.cl", "adquira.com","autodiscover.telefonica.com","bandaanchalibre.cl","bandanchalibre.cl","bkp.tmc","bucerias","clubmovistar.cl","crmlive.cl","ctc.cl","entregable3","ext.telefonicamoviles.cl","familiamovil.cl","fundaciontelefonica.cl","Hibrido","ilo.tmc","intermail.bellsouth.cl","mailar.telefonica.com","mailarold.telefonica.com","mailus.telefonica.com","mailusold.telefonica.com","mnt.tmc","movistar.chile","movistar.cl","movistarinnova.cl");
#$ip=$Computer.split(".")[3];
#$seccion=$Computer.split(".")[2];
    

 #  $mundo= $Computer -replace "$ip","$i" -replace "$seccion","70" ;
  # $Computer > C:\pcs
#Write-Host $mundo;
#echo $mundo.Gettype();
#$i++;




#$ip.ForEach({ " [$_]" })
#$ip=$Computer.split(".")[3] -replace "59";
#echo $ip;

#Write-Host "Ejecutando el cambio de credenciales"

    
       
        
    #    $Computer > C:\pcs
        
     #   $peru=Get-Content C:\pcs
      #  $ip=$Coms.split(".")[3];
    #$seccion=$Coms.split(".")[2];
    #$mundo= $Coms -replace "$ip","$i" -replace "$seccion","70" ;
        
         
       
        
    #        $mask="255.255.255.0"
    
     #       $oreo= get-wmiobject win32_networkadapter | where-object {$_.netconnectionstatus -eq 2}
            
      #      $clima=get-wmiobject win32_networkadapterconfiguration|where-object {$_.Index -eq $oreo.DeviceID};
       #     $clima.SetGateways("192.9.60.1");
        #    Write-Host "Completado ";
         #   $clima.SetDNSServerSearchOrder("8.8.8.8");
          #  Write-Host "Completado MascaraSubred";
           # $clima.EnableStatic($peru,$mask);
        
    
    
        
    
   # $i++;
  
#Write-Host "Probando Conectividad" -ForegroundColor Black -BackgroundColor Yellow;
#if(Test-Connection -ComputerName $Computer -Count 2 -Quiet -eq 'False'){
 #  Write-Host "Hay una nueva conexion en la ip $mundo" -ForegroundColor Black -BackgroundColor Green;
  # }


  
   
  
  

    #New-NetIPAddress –InterfaceAlias $oreo.netconnectionid –IPv4Address "192.9.61.45" –PrefixLength 24 -DefaultGateway "192.9.60.1";
}
$Job = Invoke-Command -Session $s -ScriptBlock $sip -AsJob 
 $Null = Wait-Job -Job $Job

 Write-Host "Completed" 
 Remove-PSSession -Session $s 


}
