
     $Username = "Administrador"
    $Password = "R3c542016C4ll"
    $Computers=Get-Content C:\Users\jmedrano\Desktop\powershell\pcs_claro
#$Computers=Get-Content C:\Users\jmedrano\Desktop\powershell\pcs_claro
#$Computers=$textbox1.text; #we're taking the text from the input box into the variable $wks
#$ipNueva=$textbox2.text;
  $cambioIP={
	  Param($Computer)
          $Computer >> C:\pera.txt
#$mask="255.255.255.0"
#$peru="192.9.60.85";
#$peru=Get-Content C:\ipcambio.txt
#$Inicial=$Computer.Split(".")
#$inicio0=$Inicial[0];
#$inicio1=$Inicial[1];
#$inicio2=$Inicial[2];
#$inicio3=$Inicial[3];
#$primeraIP=$inicio0+"."+$inicio1+"."+$inicio2+"."+"1" ;

#$oreo= get-wmiobject win32_networkadapter | where-object {$_.netconnectionstatus -eq 2}
#$clima=get-wmiobject win32_networkadapterconfiguration|where-object {$_.Index -eq $oreo.DeviceID};
#$clima.SetGateways($primeraIP);
#Write-Host "Completado";
#$clima.SetDNSServerSearchOrder("8.8.8.8");
#Write-Host "Completado MascaraSubred";
#$clima.EnableStatic($peru,$mask);
}
  
  #ping $wks

    $SecurePassword = ConvertTo-SecureString -AsPlainText $Password -Force
$Cred = New-Object -TypeName "System.Management.Automation.PSCredential" -ArgumentList $Username, $SecurePassword



 #$aplicativos=Get-Content C:\Users\Agente.DESKTOP-60OV35H\Desktop\aplicaciones
foreach($Computer in $Computers) { 

  $hora=Get-Date -DisplayHint DateTime
    #Creando la cnx
    $Session = New-PSSession -ComputerName $Computer -Credential $Cred

   Write-Host "PC name: $Computer ..." -ForegroundColor GREEN -Background BLACK
 #$ping= ping -n 1 $Computer
    if($Session -eq $Null){

        "No se pudo conectar en $Computer" + " - " + $hora >> C:\Users\jmedrano\Desktop\logs_ip\log_error.txt
       # $outputBox.text= "No se pudo conectar en $Computer"+ " - " + $hora;
        
    }
    
    else{
        #$ipNueva >> C:\ipcambio.txt
        #Invocando comandos
    $Job = Invoke-Command -Session $Session  -ScriptBlock $cambioIP -ArgumentList $Computer -AsJob 
    $Null = Wait-Job -Job $Job
    Remove-PSSession -Session $Session
    "Inicio exitoso SipRecsa $VersionActual en $Computer" + " - " + $hora >>  C:\Users\jmedrano\Desktop\logs_ip\log_exitoso.txt
    #$outputBox.text= "Inicio exitoso SipRecsa $VersionActual en $Computer" + " - " + $hora;

    }

    #Cerrando la cnx
    #Write-Host "Cerrando conexión" -ForegroundColor CYAN
   
    }
     