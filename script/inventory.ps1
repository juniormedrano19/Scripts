$Username = "Administrador"
    $Password = "R3c542016C4ll"
	$Computers="192.9.60.29"; 
	$datosInventario={
	$Memory = Get-WmiObject  Win32_ComputerSystem | Select-Object @{Name="Installed Memory (RAM)";Expression={[math]::Round($_.TotalPhysicalMemory / 1GB)}}
$Class = Get-WmiObject Win32_OperatingSystem
$Pc=Get-WmiObject  Win32_ComputerSystem 
$Processor=Get-WmiObject Win32_Processor
$Cores=Get-WmiObject -Class Win32_Processor | Select-Object NumberOfCores;
$disco= Get-WmiObject Win32_DiskDrive 
$discoSize= [math]::Round($disco.Size / 1GB);
$versionSip=Get-ItemProperty -Path "C:\Program Files (x86)\SipRecsa\SipRecsa.exe" | Select VersionInfo |Format-List -Property *
[string]$sipVersion=($versionSip | findstr "FileVersion").Split()[-1]
  $localIpAddress=((ipconfig | findstr [0-9].\.)[0]).Split()[-1];

    #$modelo= wmic csproduct get name;
    $serie= Get-WmiObject win32_bios;

     $texto="" +$localIpAddress+","+$Pc.model+","+$Pc.Manufacturer+","+$serie.SerialNumber+","+$Processor.Name+","+$Cores+""+$discoSize+","+$Class.Caption+","+$env:computerName.ToUpper()+","+$Class.OSArchitecture+","+$Class.ServicePackMajorVersion+","+$Memory.'Installed Memory (RAM)'+","+$sipVersion
                 #Modelo       #Marca                         #Procesador         #Cores    tamaño Disco      #Sistema Operativo   #Hostname                      #Arquitectura            #ServicePAck                        #Memoria                          #Version del Sip                       
     #$ruta="C:\inventario.txt";
    #$texto > $ruta;
$texto | out-string
 
	}

$SecurePassword = ConvertTo-SecureString -AsPlainText $Password -Force
$Cred = New-Object -TypeName "System.Management.Automation.PSCredential" -ArgumentList $Username, $SecurePassword
foreach($Computer in $Computers) { 
    	$Session1 = New-PSSession -ComputerName $Computer -Credential $Cred 
#$Session = New-PSSession -ComputerName $Computer -Credential $Cred
Write-Host " $Computer ..." -ForegroundColor GREEN -Background BLACK

 #Invocando comandos
 #$Job = Invoke-Command -Session $Session  -ScriptBlock $getName -ArgumentList ($Computer,$ipNueva) -AsJob 
 #$Null = Wait-Job -Job $Job
#Remove-PSSession -Session $Session

	###################
	#$Session1 = New-PSSession -ComputerName $Computer -Credential $Cred 
$a = Invoke-Command -Session $Session1 -ScriptBlock $datosInventario
$a > C:\Users\jmedrano\Desktop\consolidado.txt
Get-PSSession | Remove-PSSession
}