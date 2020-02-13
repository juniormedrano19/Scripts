$Username = "Administrador"
$Password = "R3c542016C4ll"
$Computers=$textbox1.text; 
$ipNuevas=$textbox2.text;
if(($Computers.length -eq 0) -Or ($ipNuevas.length -eq 0)){
Add-Type -AssemblyName System.Windows.Forms
$errorMsg = "No puede quedar en blanco la dirección ip.
Vuelva a intentarlo nuevamente."
    $caption = "Error de contenido"
    [System.Windows.Forms.MessageBox]::Show($errorMsg, $caption)
}else{
  $cambioIP={
	  Param($Computer,$ipNueva)         
$mask="255.255.255.0"
$Inicial=$ipNueva.Split(".")
$inicio0=$Inicial[0];
$inicio1=$Inicial[1];
$inicio2=$Inicial[2];
$inicio3=$Inicial[3];
$primeraIP=$inicio0+"."+$inicio1+"."+$inicio2+"."+"1" ;
$oreo= get-wmiobject win32_networkadapter | where-object {$_.netconnectionstatus -eq 2}
$clima=get-wmiobject win32_networkadapterconfiguration|where-object {$_.Index -eq $oreo.DeviceID};
$clima.SetGateways($primeraIP);
Write-Host "Completado";
$clima.SetDNSServerSearchOrder("8.8.8.8");
Write-Host "Completado MascaraSubred";
$clima.EnableStatic($ipNueva,$mask);
}  
$SecurePassword = ConvertTo-SecureString -AsPlainText $Password -Force
$Cred = New-Object -TypeName "System.Management.Automation.PSCredential" -ArgumentList $Username, $SecurePassword
foreach($Computer in $Computers) { 
foreach($ipNueva in $ipNuevas){
$hora=Get-Date -DisplayHint DateTime
$Session = New-PSSession -ComputerName $Computer -Credential $Cred

Write-Host " $Computer ..." -ForegroundColor GREEN -Background BLACK

    if($Session -eq $Null){
 Write-Host "No se puede conectar" -ForegroundColor Blue -Background White
 "No se pudo conectar en $Computer" + " - " + $hora >> C:\Users\jmedrano\Desktop\logs_ip\log_error.txt
    $outputBox.text= "No se pudo conectar en $Computer"+ " - " + $hora;   
      
    }
    else{
    $Job = Invoke-Command -Session $Session  -ScriptBlock $cambioIP -ArgumentList ($Computer,$ipNueva) -AsJob 
      $Session1 = New-PSSession -ComputerName $ipNueva -Credential $Cred
     Write-Host "La nueva ip es: $ipNueva  ..." -ForegroundColor Blue -Background White
	Remove-PSSession -Session $Session1
		 "Inicio exitoso en $ipNueva" + " - " + $hora >>  C:\Users\jmedrano\Desktop\logs_ip\log_exitoso.txt
    $outputBox.text= "Inicio exitoso en $ipNueva"

    }
}

    }
	 
	 }
	 }