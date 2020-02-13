
     $Username = "Administrador"
    $Password = "R3c542016C4ll"

$Computers="192.9.60.131"; 
$ipNuevas="192.9.60.29";
  $cambioIP={
	  Param($Computer,$ipNueva)
           $ipNueva >> C:\pipa.txt
		   $Computer >> C:\sharonta.txt
$mask="255.255.255.0"


$Inicial=$ipNueva.Split(".")
$inicio0=$Inicial[0];
$inicio1=$Inicial[1];
$inicio2=$Inicial[2];
$inicio3=$Inicial[3];
$primeraIP=$inicio0+"."+$inicio1+"."+$inicio2+"."+"5" ;

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

$hora=Get-Date -DisplayHint DateTime
$Session = New-PSSession -ComputerName $Computer -Credential $Cred
Write-Host "PC name: $Computer ..." -ForegroundColor GREEN -Background BLACK
 #$ping= ping -n 1 $Computer
    if($Session -eq $Null){

       # "No se pudo conectar en $Computer" + " - " + $hora >> C:\Users\jmedrano\Desktop\logs_ip\log_error.txt
       # $outputBox.text= "No se pudo conectar en $Computer"+ " - " + $hora;   
    }
    else{
    $Job = Invoke-Command -Session $Session  -ScriptBlock $cambioIP -ArgumentList ($Computer,$ipNueva) -AsJob 
	$Null = Wait-Job -Job $Job -Force 
	if($Session -eq $Null){
 Write-Host "Ya no hay una sesion activa" -ForegroundColor Blue -Background White
	}
#Remove-PSSession -Session $Session

#	 "Inicio exitoso en $ipNueva" + " - " + $hora >>  C:\Users\jmedrano\Desktop\logs_ip\log_exitoso.txt
    #$outputBox.text= "Inicio exitoso en $ipNueva" + " - " + $hora;

	
	
 #Remove-PSSession -Session $Session
 #Write-Host "Sesion iniciada en PC name: $ipNueva ..." -ForegroundColor Blue -Background WHITE

	
    #$Null = Wait-Job -Job $Job
#	Write-Host "Sesion iniciada en PC name: $ipNueva ..." -ForegroundColor Blue -Background WHITE
#	 Remove-PSSession -Session $Session
# $Session1 = New-PSSession -ComputerName $ipNueva -Credential $Cred
# Write-Host "Sesion iniciada en PC name: $ipNueva  ..." -ForegroundColor GREEN -Background BLACK
#	Remove-PSSession -Session $Session1
		 
#		  if(ping -n 1 $Computer){
#Write-Host "$Computer  ..." -ForegroundColor GREEN -Background BLACK
#	}
#	else{
#	 Remove-PSSession -Session $Session
# $Session1 = New-PSSession -ComputerName $ipNueva -Credential $Cred
# Write-Host "Sesion iniciada en PC name: $ipNueva  ..." -ForegroundColor GREEN -Background BLACK
#	Remove-PSSession -Session $Session1
#	}

#$Session1 = New-PSSession -ComputerName $ipNueva -Credential $Cred
# Write-Host "Sesion iniciada en PC name: $Computer ..." -ForegroundColor GREEN -Background BLACK

#	Remove-PSSession -Session $Session1
	


		 
		   
	

    #"Inicio exitoso SipRecsa $VersionActual en $Computer" + " - " + $hora >>  C:\Users\jmedrano\Desktop\logs_ip\log_exitoso.txt
    #$outputBox.text= "Inicio exitoso en $Computer" + " - " + $hora;

    }

    #Cerrando la cnx
    #Write-Host "Cerrando conexión" -ForegroundColor CYAN
   
    }
	foreach($ipNueva in $ipNuevas){
		  $Session1 = New-PSSession -ComputerName $ipNueva -Credential $Cred
 Write-Host "Sesion iniciada en PC name: $ipNueva  ..." -ForegroundColor Blue -Background White
$mensaje={
	Write-Host "La nueva ip en PC name: $ipNueva  ..." -ForegroundColor White -Background BLACK
}

$Job1 = Invoke-Command -Session $Session1  -ScriptBlock $mensaje -ArgumentList ($Computer,$ipNueva) -AsJob 
	$Null = Wait-Job -Job $Job1 -Force 
	Remove-PSSession -Session $Session1
	}
	