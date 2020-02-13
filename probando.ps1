
$cambioIP={
    $oreo= get-wmiobject win32_networkadapter | where-object {$_.netconnectionstatus -eq 2}
    
   $clima=get-wmiobject win32_networkadapterconfiguration|where-object {$_.Index -eq $oreo.DeviceID};
   $clima.SetGateways("192.9.60.1");
   $clima.SetDNSServerSearchOrder("8.8.8.8")
   $clima.EnableStatic("192.9.70.$i","255.255.255.0");
   
  # for($i=2;$i -le 254;$i++){
#$peru=[string]$i;
#$pipa="192.9.70.$peru";
#echo $pipa;
  # }
   
  }
  $pipa="";
$servers = Get-Content C:\Users\jmedrano\Desktop\pcs_claro
foreach($server in $servers){
    $Session = New-PSSession -ComputerName $server -Credential $Cred
    $cambiando={  
        Write-Host "Conexión establecida $Computer ..."
          
          
           Write-Host "Cambiando a la ip $pipa ..."
           
           for($j=0;$j -le $server.length;$j++){
            $oreo= get-wmiobject win32_networkadapter | where-object {$_.netconnectionstatus -eq 2}
           
            $clima=get-wmiobject win32_networkadapterconfiguration|where-object {$_.Index -eq $oreo.DeviceID};
       
              for($z=0;$z -le 255;$z++){
               $peru=[string]$z;
               $pipa="192.9.70.$peru";
              
              }
              $clima.SetGateways("192.9.60.1");
              $clima.SetDNSServerSearchOrder("8.8.8.8")
             $clima.EnableStatic($pipa,"255.255.255.0");
              
           }
        }
     #   foreach($huawei in $pipa){
      #      $Session = New-PSSession -ComputerName $huawei -Credential $Cred
       #     Write-Host "La nueva ip de $server es $huawei";
       # }
    }
       
       
       

$mat=@($server,$nueva);

