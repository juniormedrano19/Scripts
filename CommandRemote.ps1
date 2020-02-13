 '''
[cmdletbinding()]
param (
    [parameter(Mandatory=$true)]
    [String]$Equipos  
)
'''
#$Username = "Agente" 
#$Password = "krivera2017"
$Username = "Administrador"
$Password = "R3c542016C4ll"
#$Script = {Get-Service | Out-File -append C:\Users\Peru_005\Desktop\demo.txt;}

#Reiniciar una pc de forma remota después de 5 segundos
$reiniciar={
    shutdown -r -t 1 ;
}
#Apagar una pc de forma remota después de 30 segundos
$apagar={
    shutdown -s -t 1;
}

#Ejecuta la descarga de los dll del Cobtel y algunos programas básicos de la pc.(Para windows 10 y windows 7)

$instaladores={
    #Desarcgar el msi del Alteor en Documents
    $url="https://drive.google.com/uc?authuser=1&id=12h7SHzLg4aGtdnNV_xpMYQHfKhNygkH5&export=download";
    $path="C:\Users\AGENTE\Documents\AlteorSoftphoneGenesys.msi";
    $client = New-Object System.Net.WebClient;
    $client.DownloadFile($url,$path);
    ##################################
    #Descargar el MSCOMCTL.OCX del Cobtel en SYSTEM32
    $url="https://drive.google.com/uc?authuser=1&id=1zsMt-uMghUUAocJ6mnnc8S6XuoyFM-sC&export=download";
    $path="C:\Windows\System32\MSCOMCTL.OCX";
    $client = New-Object System.Net.WebClient;
    $client.DownloadFile($url,$path);
    ##################################
    #Descargar el SETUP.LST del Cobtel en SYSTEM32
    $url="https://drive.google.com/uc?authuser=1&id=1FojshTRuAbOMSFsxvpvuhQUBdd5qOM-v&export=download";
    $path="C:\Windows\System32\SETUP.LST";
    $client = New-Object System.Net.WebClient;
    $client.DownloadFile($url,$path);
    ################################
    #Descargar el MSCOMCTL.OCX del Cobtel en SYSTEM
    $url="https://drive.google.com/uc?authuser=1&id=1zsMt-uMghUUAocJ6mnnc8S6XuoyFM-sC&export=download";
    $path="C:\Windows\System\MSCOMCTL.OCX";
    $client = New-Object System.Net.WebClient;
    $client.DownloadFile($url,$path);
    ##################################
    #Descargar el SETUP.LST del Cobtel en SYSTEM32
    $url="https://drive.google.com/uc?authuser=1&id=1FojshTRuAbOMSFsxvpvuhQUBdd5qOM-v&export=download";
    $path="C:\Windows\System\SETUP.LST";
    $client = New-Object System.Net.WebClient;
    $client.DownloadFile($url,$path);
    ###############################
    ##########Winrar
    Write-Host "Instalando Winrar"
    $url="http://www.winrar.es/descargas/103";
    $path="C:\Users\AGENTE\Documents\winrar-x64-561es.exe";
    $client = New-Object System.Net.WebClient;
    $client.DownloadFile($url,$path);
    ##########Vlc
    $url="https://drive.google.com/uc?authuser=1&id=1r_YgO7J_5tKempUGwOUq7zietiajfV43&export=download";
    $path="C:\Users\AGENTE\Documents\vlc-2.2.4-win32.exe";
    $client = New-Object System.Net.WebClient;
    $client.DownloadFile($url,$path);
    #############Adobe reader pdf#####################
    $url="https://drive.google.com/uc?authuser=1&id=1BYdmRefaQUnQCZHn9ccmBz2vRm1hIH3r&export=download";
    $path="C:\Users\AGENTE\Documents\readerdc_es_xa_crd_install.exe";
    $client = New-Object System.Net.WebClient;
    $client.DownloadFile($url,$path);

    ###############################################
    #Instalar Winrar y VLC
    Start-Process -Wait -FilePath "C:\Users\AGENTE\Documents\winrar-x64-561es.exe" -ArgumentList "/S"  -PassThru;
    
        Start-Process -Wait -FilePath "C:\Users\AGENTE\Documents\vlc-2.2.4-win32.exe" -ArgumentList "/S"  -PassThru;
        #########################################
        #Instalar el msi del Alteor
        Start-Process -FilePath msiexec.exe -ArgumentList '/i',"C:\Users\Administrador\Desktop\Cisco\ciscovpnanyconect.msi",'/q' -Wait -PassThru ;

}
$ciscoVpn={
      Start-Process -FilePath msiexec.exe -ArgumentList '/i',"C:\Users\Administrador\Desktop\Cisco\ciscovpnanyconect.msi",'/q' -Wait -PassThru ;
}
$winrar123456={
    Write-Host "Instalando Winrar"
    $url="http://www.winrar.es/descargas/103";
    $path="C:\winrar-x64-561es.exe";
    $client = New-Object System.Net.WebClient;
    $client.DownloadFile($url,$path);
    Start-Process -Wait -FilePath "C:\winrar-x64-561es.exe" -ArgumentList "/S"  -PassThru;
}

$notepad={
        Write-Host "Instalando Winrar"
    $url="https://notepad-plus-plus.org/repository/7.x/7.7.1/npp.7.7.1.Installer.exe";
    $path="C:\npp.7.7.1.Installer.exe";
    $client = New-Object System.Net.WebClient;
    $client.DownloadFile($url,$path);
    Start-Process -Wait -FilePath "C:\npp.7.7.1.Installer.exe" -ArgumentList "/S"  -PassThru;
}

#Solo Windows 10
$winrar10={

    $source = "http://www.winrar.es/descargas/103"
$destination = "C:\Users\AGENTE\Documents\winrar-x64-561es.exe"
Invoke-WebRequest $source -OutFile $destination
    ##################################

}
$forti={
    $url="https://filestore.fortinet.com/forticlient/downloads/FortiClientOnlineInstaller_6.0.0.exe";
    $path="C:\FortiClientOnlineInstaller_6.0.0.exe";
    $client = New-Object System.Net.WebClient;
    $client.DownloadFile($url,$path);
    ##################################
    #Instalar forticlient
   Start-Process -Wait -FilePath "C:\FortiClientOnlineInstaller_6.0.0.exe" -ArgumentList "/S"  -PassThru;

}
$framework={
   # $url="http://10.10.10.50/ZonaDescargas/Archivos/NetFrameworksv4.5.2.exe";
    #$path="C:\NetFrameworksv4.5.2.exe";
    #$client = New-Object System.Net.WebClient;
    #$client.DownloadFile($url,$path);
    ##################################
    #Instalar forticlient
   Start-Process -Wait -FilePath "C:\NetFrameworksv4.5.2.exe" -ArgumentList "/S"  -PassThru;
   #$install="C:\NetFrameworksv4.5.2.exe" ;
   #Start-Process -FilePath $install -ArgumentList "/q /norestart" -Wait -Verb RunAs -PassThru;

}
$frame={
    $TempFolder = "C:"
if(!(test-path $TempFolder))
{New-Item -path $TempFolder -type directory}

Write-Host ""
Write-Host "Descargando paquete de instalación de .NET framework v4.0 " -ForegroundColor Yellow;
$src = "http://10.10.10.50/ZonaDescargas/Archivos/NetFrameworksv4.5.2.exe"
$dest = "$TempFolder" + "\" + "NetFrameworksv4.5.2.exe"
$wc = New-Object System.Net.WebClient
$wc.DownloadFile($src, $dest)
$args = " /q /norestart"
Write-Host "Instalando .NET framework v4.5.2." -ForegroundColor Yellow;
Start-Process -FilePath $dest -ArgumentList $args -Wait -PassThru;

Remove-Item $TempFolder -recurse
}



$open={
    Start-Process -Wait -FilePath "C:\Apache_OpenOffice_4.1.2_Win_x86_install_es.exe" -ArgumentList "/S"  -PassThru;
}
#Instalación de Google Chrome
$google={
    $Path = $env:TEMP; 
    $Installer = "chrome_installer.exe";
     Invoke-WebRequest "http://dl.google.com/chrome/install/375.126/chrome_installer.exe" -OutFile $Path\$Installer; Start-Process -FilePath $Path\$Installer -Args "/silent /install" -Verb RunAs -Wait; Remove-Item $Path\$Installer
}
#Instalación de framework 4.5
$net41={
    $url="https://www.microsoft.com/es-es/download/confirmation.aspx?id=30653";
    $path="C:\Temp\dotNetFx45_Full_setup.exe";
    $client = New-Object System.Net.WebClient;
    $client.DownloadFile($url,$path);
    ##################################
    Start-Process -Wait -FilePath "C:\Temp\dotNetFx45_Full_setup.exe" -ArgumentList "/S" -PassThru;
}
#bloqueo de ruta
$bloqueoRuta={
    route add -p 192.9.62.0 mask 255.255.255.0 192.9.60.3 metric 1
}
#eliminar ruta agregada
$liberarRuta={
    route -p delete 192.9.62.0;
}
#Por trabajar (Deshabilitar características de reproductor windows media en windows 7)
$reproductor7={
    $command="C:\Windows\System32\Dism.exe /online /Disable-Feature /FeatureName:WindowsMediaPlayer";
    Invoke-Expression $command ;
    
}
$vlcinstall={
Write-Host "Instalando VLC"
$url="https://dw.uptodown.com/dwn/QKeQgalMVHY8EmoMtKu5pWQYQbMY4NgfVhZT2jKNKPlmvi5RsNOIyNbE4oMOfugjiz8UWgLb60oxTXZllLtpjq-BFsu1fl622ec1Vol57XpZBglo-hujdmIF5OrOid7B/GyB9Gq1xnCP4xoG2hRzihq-Yk-4LPUH2L6IiaQ3VzXlEOn1w2GfS0VhXeMN2BAjIqvvSBgvqVuMqZ4HpbKXrduRuaJ80cqxAQEv6ftrfjAfDIqGXamAspuNdhzHlv1MJ/SF6otkgf9ns-IozbUrL27nYzB2xaHmZvYqWnD1op-KMubCQWmpXMx9DVJnAckglK/";
$path="C:\vlc-media-player-3-0-7-1.exe";
$client = New-Object System.Net.WebClient;
$client.DownloadFile($url,$path);
Start-Process -Wait -FilePath "C:\vlc-media-player-3-0-7-1.exe" -ArgumentList "/S" -PassThru;
}

#en modo prueba
$uninst={
    Uninstall-WindowsFeature WindowsMediaPlayer -Remove
}

$reproductor10={
    Enable-WindowsOptionalFeature -Online -FeatureName "WindowsMediaPlayer" ;
   
}
#Habilitar en los registros del sistema el Proxy
$EnableSecProxy = {
    #Agregamos claves faltantes para editar el proxy
    New-Item -Path "Registry::HKLM\SOFTWARE\Policies\Microsoft" -Name "Internet Explorer";
    New-Item -Path "Registry::HKLM\SOFTWARE\Policies\Microsoft\Internet Explorer" -Name "Control Panel";
    #Bloqueamos la edición del proxy (No estamos bloqueando pq se borra la config)
    Remove-ItemProperty -Path "Registry::HKLM\SOFTWARE\Policies\Microsoft\Internet Explorer\Control Panel" -Name Proxy;
    New-ItemProperty -Path "Registry::HKLM\SOFTWARE\Policies\Microsoft\Internet Explorer\Control Panel" -Name Proxy -PropertyType DWord -Value 1;
    #Forzamos la configuración por pc y no por usuario
    New-ItemProperty -Path "Registry::HKLM\SOFTWARE\Policies\Microsoft\Windows\CurrentVersion\Internet Settings" -Name ProxySettingsPerUser -PropertyType DWord -Value 0;
}
#Deshabilitar en los registros del sistema el Proxy
$DisableSecProxy = {
    Remove-ItemProperty -Path "Registry::HKLM\SOFTWARE\Policies\Microsoft\Internet Explorer\Control Panel" -Name Proxy;
    Remove-Item -Path "Registry::HKLM\SOFTWARE\Policies\Microsoft\Internet Explorer" -Name "Control Panel";
    Remove-Item -Path "Registry::HKLM\SOFTWARE\Policies\Microsoft" -Name "Internet Explorer";
    Remove-ItemProperty -Path "Registry::HKLM\SOFTWARE\Policies\Microsoft\Windows\CurrentVersion\Internet Settings" -Name ProxySettingsPerUser;
}
#Deshabilitar el proxy
$DisableProxy = {
    #Deshabilitando Proxy
    Remove-ItemProperty -Path "Registry::HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Internet Settings" -Name ProxyServer;
    Remove-ItemProperty -Path "Registry::HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Internet Settings" -Name ProxyEnable;
    Remove-ItemProperty -Path "Registry::HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Internet Settings" -Name ProxyOverride;
    #Lanzamos ie para que actualize la config proxy
    #& `"C:\Archivos de programa\Internet Explorer\iexplore.exe`"
    Remove-ItemProperty -Path "Registry::HKCU\Software\Microsoft\Windows\CurrentVersion\Internet Settings" -Name ProxyEnable;
    Remove-ItemProperty -Path "Registry::HKCU\Software\Microsoft\Windows\CurrentVersion\Internet Settings" -Name ProxyServer;
    Remove-ItemProperty -Path "Registry::HKCU\Software\Microsoft\Windows\CurrentVersion\Internet Settings" -Name ProxyOverride;
}
#Habilitar el proxy
$EnableProxy = {
    Remove-ItemProperty -Path "Registry::HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Internet Settings" -Name ProxyEnable;
    #Configurando valores predeterminados del proxy para PC
    New-ItemProperty -Path "Registry::HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Internet Settings" -Name ProxyServer -Value "192.9.62.7:3128";
    New-ItemProperty -Path "Registry::HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Internet Settings" -Name ProxyEnable -PropertyType DWord -Value 1;
    New-ItemProperty -Path "Registry::HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Internet Settings" -Name ProxyOverride -Value "192.9.100.*;10.10.10.*;192.9.62.*;192.9.104.*;192.9.106.*;172.31.10.*;*.telefonicachile.cl;<local>";
    
    Remove-ItemProperty -Path "Registry::HKCU\Software\Microsoft\Windows\CurrentVersion\Internet Settings" -Name ProxyEnable;
    New-ItemProperty -Path "Registry::HKCU\Software\Microsoft\Windows\CurrentVersion\Internet Settings" -Name ProxyServer -Value "192.9.62.7:3128";
    New-ItemProperty -Path "Registry::HKCU\Software\Microsoft\Windows\CurrentVersion\Internet Settings" -Name ProxyEnable -PropertyType DWord -Value 1;
    New-ItemProperty -Path "Registry::HKCU\Software\Microsoft\Windows\CurrentVersion\Internet Settings" -Name ProxyOverride -Value "192.9.100.*;10.10.10.*;192.9.62.*;192.9.104.*;192.9.106.*;172.31.10.*;*.telefonicachile.cl;<local>";
    #Lanzamos ie para que actualize la config proxy
    #& `"C:\Archivos de programa\Internet Explorer\iexplore.exe`"
}


$cambiar_hora={
    set-date -date "02/10/2019 8:03"
}




#Revisar
$DisabledUsbStore = {
    New-Item -Path "Registry::HKLM\SOFTWARE\Policies\Microsoft\Windows" -Name RemovableStorageDevices;
    New-ItemProperty -Path "Registry::HKLM\SOFTWARE\Policies\Microsoft\Windows\RemovableStorageDevices" -Name Deny_All -PropertyType DWord -Value 1;

    gpupdate /force;
}

$EnabledUsbStore = {

    Remove-Item -Path "Registry::HKLM\SOFTWARE\Policies\Microsoft\Windows\RemovableStorageDevices";

    gpupdate /force;
}

$FondoEscritorio= {
    ##################
    $url="http://www.recsaperu.com.pe/img/comun/logo-recsa.png";
    $path="C:\Windows\Web\Wallpaper\Windows\desktop.png";
    $client = New-Object System.Net.WebClient;
    $client.DownloadFile($url,$path);
    ##################
}



#Creando credenciales
$SecurePassword = ConvertTo-SecureString -AsPlainText $Password -Force
$Cred = New-Object -TypeName "System.Management.Automation.PSCredential" -ArgumentList $Username, $SecurePassword

$Computers = Get-Content C:\Users\jmedrano\Desktop\powershell\pcs_claro

 #$aplicativos=Get-Content C:\Users\jmedrano\Desktop\aplicaciones
foreach($Computer in $Computers) { 

    #Creando la cnx
    $Session = New-PSSession -ComputerName $Computer -Credential $Cred

   Write-Host "PC name: $Computer ..." -ForegroundColor GREEN -Background BLACK
$servicio={
     $url="http://10.10.10.50/ZonaDescargas/Archivos/NetFrameworksv4.5.2.exe";
    $path="C:\NetFrameworksv4.5.2.exe";
    $client = New-Object System.Net.WebClient;
    $client.DownloadFile($url,$path);
    Start-Process -Wait -FilePath "C:\NetFrameworksv4.5.2.exe" -ArgumentList "/S"  -PassThru;
}
$framework4_5={
    #$url="http://www.recsaperu.com.pe/desktopImages/framework.exe"
   # $url="http://10.10.10.50/ZonaDescargas/Archivos/NetFrameworksv4.5.2.exe";
   # $path="C:\NetFrameworksv4.5.2.exe";
    # $path="C:\framework.exe";
    #$client = New-Object System.Net.WebClient;
    #$client.DownloadFile($url,$path);
    ##################################
    #Instalar Sip
Start-Process "c:\framework.exe" -ArgumentList '/silent' -Wait
}
$siprecsa={
    $url="http://10.10.10.50/ZonaDescargas/Archivos/SipRecsa.exe";
    $path="C:\SipRecsa.exe";
    $client = New-Object System.Net.WebClient;
    $client.DownloadFile($url,$path);
    ##################################
    #Instalar Sip
Start-Process "c:\SipRecsa.exe" -ArgumentList '/silent' -Wait

}
$inicioSip={
Start-Process -FilePath "C:\Program Files (x86)\SipRecsa\InicioRecsaSip.exe" -Verb open ;
}
#REMOVER PERMISOS CREADOS DEL SISTEMA EN EL DISCO C
$removerpermisos1={
$acl = Get-Acl "C:\SipRecsa"

$AccessRule = New-Object System.Security.AccessControl.FileSystemAccessRule("BUILTIN\Usuarios","FullControl","Allow")

$acl.RemoveAccessRule($AccessRule)

$acl | Set-Acl "C:\SipRecsa"
}
$removerpermisos1a={
    $acl = Get-Acl "C:\SipRecsa"
$usersid = New-Object System.Security.Principal.Ntaccount ("BUILTIN\Usuarios")

$acl.PurgeAccessRules($usersid)

$acl | Set-Acl "C:\SipRecsa"
}
#HABILITAR PERMISOS DEL DISCO C
$permisosDiscoC={
    $Folderpath='C:\SipRecsa'
$user_account='BUILTIN\Usuarios'
$Acl = Get-Acl $Folderpath
$Ar = New-Object system.Security.AccessControl.FileSystemAccessRule($user_account, "FullControl", "ContainerInherit, ObjectInherit", "None", "Allow")
$Acl.Setaccessrule($Ar)
Set-Acl $Folderpath $Acl
}
#REMOVER PERMISOS X86
$removerpermisos2={
    $acl = Get-Acl 'C:\Program Files (x86)\SipRecsa'

$AccessRule = New-Object System.Security.AccessControl.FileSystemAccessRule("BUILTIN\Usuarios","FullControl","Allow")

$acl.RemoveAccessRule($AccessRule)

$acl | Set-Acl 'C:\Program Files (x86)\SipRecsa'
}
$removerpermisos2a={
    $acl = Get-Acl 'C:\Program Files (x86)\SipRecsa'
$usersid = New-Object System.Security.Principal.Ntaccount ("BUILTIN\Usuarios")

$acl.PurgeAccessRules($usersid)

$acl | Set-Acl 'C:\Program Files (x86)\SipRecsa'
}
#HABILITAR PERMISOS X86
$permisosx86={
     $Folderpath='C:\Program Files (x86)\SipRecsa'
$user_account='BUILTIN\Usuarios'
$Acl = Get-Acl $Folderpath
$Ar = New-Object system.Security.AccessControl.FileSystemAccessRule($user_account, "FullControl", "ContainerInherit, ObjectInherit", "None", "Allow")
$Acl.Setaccessrule($Ar)
Set-Acl $Folderpath $Acl
}
$permisosCheckSip={
     $Folderpath="$home\Desktop\Check Sip.bat"
$user_account='BUILTIN\Usuarios'
$Acl = Get-Acl $Folderpath
$Ar = New-Object system.Security.AccessControl.FileSystemAccessRule($user_account, "FullControl", "ContainerInherit, ObjectInherit", "None", "Allow")
$Acl.Setaccessrule($Ar)
Set-Acl $Folderpath $Acl
}

   $primerizo={

$atributos=@("Microsoft.WindowsCalculator","Microsoft.MSPaint")
foreach ($jmedrano in $atributos) {
$set=Get-AppxProvisionedPackage -Online | Select PackageName,DisplayName | where-object{$_.DisplayName -eq $jmedrano}
echo $set;
echo $set.PackageName
Remove-AppxProvisionedPackage -online -packagename $set.PackageName

$obtener=Get-AppxPackage | Select Name,PackageFullName | where-object{$_.Name -eq $set.DisplayName}
echo $obtener
echo $obtener.PackageFullName
Remove-AppxPackage -AllUsers $obtener.PackageFullName;
}
}
 
   $programando={
      $var=Microsoft.WindowsCalculator
       Get-AppxPackage -allusers [string]$var  | Remove-AppxPackage
      # Get-AppxPackage -allusers | Remove-AppxPackage
       #remove-AppxPackage  Microsoft.WindowsMaps_5.1902.843.0_x64__8wekyb3d8bbwe
 #Remove-AppxProvisionedPackage -online -packagename "Microsoft.WindowsMaps_2019.325.2243.0_neutral_~_8wekyb3d8bbwe"
     #$li=Get-AppxProvisionedPackage -online | Select PackageName
    #  echo $li | Out-File -FilePath C:\ahora.txt -Append;

      # $aplicativos=('windowsstore')
       #  foreach($aplicativo in $aplicativos){

    #Write-Host "$aplicativo ..."
    #echo $aplicativo >> C:\juniormed.txt
   # $var=Get-AppxPackage ;
    #$var | where-object {$_.name -like "*$aplicativo*"}| Remove-AppxPackage 
  #Remove-AppxPackage $aplicativo
 # $verificar=Get-AppxPackage |Select Name | where-object {$_.name -like "*$aplicativo*"}
 #$veri=Get-AppxPackage |Select Name
 #$variable=Get-AppxPackage |Select Name | where-object {$_.name -like "*$aplicativo*"}
  #If($aplicativo -eq $variable){ $message="Aun esta instalado" 
  #$message>> C:\respuesta.txt;
  #}
#Else{
 #$solucion="Desinstalado"
 #$solucion >> C:\respuesta.txt;
#}
  
   #}
   }

$Appx={
     Set-ExecutionPolicy Bypass -Scope Process -Force
    $AppList = "Microsoft.SkypeApp",           
           "Microsoft.ZuneMusic",
           "Microsoft.ZuneVideo",
           "Microsoft.Office.OneNote",
           "Microsoft.BingFinance",
           "Microsoft.BingNews",
           "Microsoft.BingWeather",
           "Microsoft.BingSports",
           "Microsoft.XboxApp",
           "Microsoft.MicrosoftOfficeHub",
           "Microsoft.WindowsStore",
           "king.com.CandyCrushFriends",
           "microsoft.windowscommunicationsapps"
           
foreach ($App in $AppList)
 {
 $PackageFullName = (Get-AppxPackage $App).PackageFullName
 $ProPackageFullName = (Get-AppxProvisionedPackage -online | where {$_.Displayname -eq $App}).PackageName
 write-host $PackageFullName
 Write-Host $ProPackageFullName
 if ($PackageFullName)
 {
 Write-Host "Removing Package: $App"

Get-AppxPackage -allusers | Remove-AppxPackage
 remove-AppxPackage -package $PackageFullName
  "$App aun está instalado">> C:\paso1.txt;
 }
 else
 {
 Write-Host "Unable to find package: $App"
 "Desinstalado">> C:\celular.txt;
 }
 if ($ProPackageFullName)
 {
 Write-Host "Removing Provisioned Package: $ProPackageFullName"
 Remove-AppxProvisionedPackage -online -packagename $ProPackageFullName
  "$App aun está instalado en los usuarios">> C:\paso2.txt;
 }
 else
 {
 Write-Host "Unable to find provisioned package: $App"
 "Desinstalado por completo">> C:\pc.txt;
 }
 }
}
$mensaje={

$msg = read-host "HOLA MUNDO"
Invoke-WmiMethod -Path Win32_Process -Name Create -ArgumentList "msg * $msg" -ComputerName $Computer
}
$crearPerfil={
    net user peru "Recsa-2019" /add
}
$noExpira={
     Set-LocalUser -Name "soporte" -PasswordNeverExpires 1;
}
   $rivera={
   # Silent Install Firefox 
# Download URL: https://www.mozilla.org/en-US/firefox/all/

# Path for the workdir
$workdir = "c:\installer\"

# Check if work directory exists if not create it

If (Test-Path -Path $workdir -PathType Container)
{ Write-Host "$workdir already exists" -ForegroundColor Red}
ELSE
{ New-Item -Path $workdir  -ItemType directory }

# Download the installer

$source = "https://download.mozilla.org/?product=firefox-51.0.1-SSL&os=win64&lang=en-US"
$destination = "$workdir\firefox.exe"

# Check if Invoke-Webrequest exists otherwise execute WebClient

if (Get-Command 'Invoke-Webrequest')
{
     Invoke-WebRequest $source -OutFile $destination
}
else
{
    $WebClient = New-Object System.Net.WebClient
    $webclient.DownloadFile($source, $destination)
}

# Start the installation

Start-Process -FilePath "$workdir\firefox.exe" -ArgumentList "/S"

# Wait XX Seconds for the installation to finish

Start-Sleep -s 35

# Remove the installer

rm -Force $workdir\firefox*
   }



$energia={
    powercfg -change -monitor-timeout-ac 0
powercfg -change -standby-timeout-ac 0
powercfg -change -hibernate-timeout-ac 0
}

$version={
    $versionReg=reg query "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\NET Framework Setup\NDP\v4\full" /v version;
    $version1=$versionReg[2];
    $localIpAddress=((ipconfig | findstr [0-9].\.)[0]).Split()[-1];
  #Install-Module -Name DotNetVersionLister -Scope CurrentUser -Force
  #$jiron= Get-DotNetVersion -LocalHost -NoSummary
   #$jiron= (Get-ChildItem -Path $Env:windir\Microsoft.NET\Framework | Where-Object {$_.PSIsContainer -eq $true } | Where-Object {$_.Name -match 'v\d\.\d'} | Sort-Object -Property Name -Descending | Select-Object -First 1).Name
$localIpAddress+ ";" +$version1 > C:\version.txt;
}


   

#$port={
 #   Get-AppxPackage -AllUsers | where-object {$_.name –like “*3DBuilder*”} | Remove-AppxPackage -AllUsers
#}

 
#Lectura y Escritura de Inventario de PCS, en pcs remotas.(Parte 1)

$cambioDNS={
    $oreo= get-wmiobject win32_networkadapter | where-object {$_.netconnectionstatus -eq 2 -and $_.ServiceName -eq 'rt640x64' }
            
    $clima=get-wmiobject win32_networkadapterconfiguration|where-object {$_.Index -eq $oreo.DeviceID};
    
    $dns_servers = "192.9.60.91","8.8.8.8";
    
    $clima.SetDNSServerSearchOrder($dns_servers);
}

$setDomain={
  
#Luego agregar credenciales del dominio

  # $DomainAccountName="RECSAPERU\recsasd"
  $oreo= get-wmiobject win32_networkadapter | where-object {$_.netconnectionstatus -eq 2 -and $_.ServiceName -eq 'rt640x64' }
            
  $clima=get-wmiobject win32_networkadapterconfiguration|where-object {$_.Index -eq $oreo.DeviceID};
  
  $dns_servers = "192.9.60.91","8.8.8.8";
  
  $clima.SetDNSServerSearchOrder($dns_servers);

    
    $domain = "recsaperu.com.pe"
    $password = "S0l0M3s419!" | ConvertTo-SecureString -asPlainText -Force
    $username = "$domain\recsasd" 
    $credential = New-Object System.Management.Automation.PSCredential($username,$password)
    Add-Computer -DomainName $domain -Credential $credential  -PassThru 




#shutdown -r -t 1
}





   $recsati={
    $Memory = Get-WmiObject  Win32_ComputerSystem | Select-Object @{Name="Installed Memory (RAM)";Expression={[math]::Round($_.TotalPhysicalMemory / 1GB)}}
$Class = Get-WmiObject Win32_OperatingSystem
$Pc=Get-WmiObject  Win32_ComputerSystem 

    #$modelo= wmic csproduct get name;
    $serie=wmic bios get serialnumber;

     $texto="" +$Pc.model+","+$Pc.Manufacturer+","+$serie+","+$Class.Caption+","+$env:computerName.ToUpper()+","+$Class.OSArchitecture+","+$Class.ServicePackMajorVersion+","+$Memory.'Installed Memory (RAM)';
                 #Modelo       #Marca                        #Sistema Operativo   #Hostname                      #Arquitectura            #ServicePAck                        #Memoria                                
     $ruta="C:\inventario.txt";
    $texto > $ruta;
    #nombre de archivo //ip.txt
 #Muevo el archivo a mi pc
 
 }
 $oh={
     $n=1..254;
     foreach($na in $n){
        $na++>C:\
     }
 }
 $cambioIP={
    $oreo= get-wmiobject win32_networkadapter | where-object {$_.netconnectionstatus -eq 2}
    
   $clima=get-wmiobject win32_networkadapterconfiguration|where-object {$_.Index -eq $oreo.DeviceID};
   $clima.SetGateways("192.9.60.1");
   $clima.SetDNSServerSearchOrder("192.168.1.2")
   $clima.EnableStatic("192.9.60.247","255.255.255.0");
   

    #New-NetIPAddress –InterfaceAlias $oreo.netconnectionid –IPv4Address "192.9.61.45" –PrefixLength 24 -DefaultGateway "192.9.60.1";
}
$cambiando={  
    Write-Host "Conexión establecida $Computer"
      
      
       Write-Host "Cambiando a la ip $pipa"
       
       for($j=0;$j -le $Computer.length;$j++){
       # $oreo= get-wmiobject win32_networkadapter | where-object {$_.netconnectionstatus -eq 2}
       
       # $clima=get-wmiobject win32_networkadapterconfiguration|where-object {$_.Index -eq $oreo.DeviceID};
       # $pipa="";
          for($z=0;$z -le 255;$z++){
           $peru=[string]$z;
           $pipa="192.9.70.$peru";
           $mundo=@( $Computer,$pipa);
           echo 

          # $mundo=$clima.EnableStatic("$pipa","255.255.255.0");
          #echo $mundo;
          }
          #$clima.SetGateways("192.9.60.1");
         # $clima.SetDNSServerSearchOrder("8.8.8.8")
        
          
       }
   
   
   }
 $target={

    $peru= Get-wmiobject win32_networkadapter -Filter "netconnectionstatus=2"|select netconnectionid,InterfaceIndex ,netconnectionstatus
    $st="C:\pipa.txt";

    $peru > $st;
     
}
$rutaResolutores={
    Param($Computer) 
    $Inicial=$Computer.Split(".")
$inicio0=$Inicial[0];
$inicio1=$Inicial[1];
$inicio2=$Inicial[2];
$inicio3=$Inicial[3];
#$primeraIP=$inicio0+"."+$inicio1+"."+$inicio2+"."+"5" ;
switch($inicio2){
    "60"{route add -p 192.9.66.11/32 192.9.60.5 metric 1;break}
    "62"{route add -p 192.9.66.11/32 192.9.62.5 metric 1;break}
    "64"{route add -p 192.9.66.11/32 192.9.64.5 metric 1;break}
    "65"{route add -p 192.9.66.11/32 192.9.65.5 metric 1;break}
}
#if($inicio2){
 #   route add -p 192.9.66.11/32 $primeraIP metric 1
#}
}
$ruta123={
    #route add -p 192.9.65.0/24 192.9.65.1 metric 1;
   route add -p 192.9.100.0 mask 255.255.255.0 192.9.64.1 metric 1;
    #route add -p 192.9.64.0/24 192.9.60.1 metric 1;
   route add -p 192.9.104.0 mask 255.255.255.0 192.9.64.1 metric 1;
   route add -p 192.9.106.0 mask 255.255.255.0 192.9.64.1 metric 1;
   route add -p 192.9.106.0 mask 255.255.255.0 192.9.64.1 metric 1;
}
$ruta356={
   # route add -p 192.9.100.0 mask 255.255.255.0 192.9.61.1 metric 1
  # route add -p 192.9.106.0 mask 255.255.255.0 192.9.61.1
   route add -p 172.22.172.0 mask 255.255.255.0 192.9.61.1
}
$ruta89={
    route add  10.10.10.0 mask 255.255.255.0 192.9.60.1
}
$firewall={
    Set-NetFirewallProfile -Enabled false
}
$probando2={
#$servidor="192.9.61.25"
    $listado=""
    $disco="C:\pcs_recsa"
    $listado > $disco
}
$versionSip={
$peru=Get-ItemProperty -Path "C:\Program Files (x86)\SipRecsa\SipRecsa.exe" | Select VersionInfo |Format-List -Property *
$mundo=($peru | findstr "FileVersion").Split()[-1]
if(!($mundo=="7.6.0.1")){
#Finalizar SipRecsa
taskkill /F /IM "SipRecsa.exe"
#Iniciar SipRecsa
Start-Process "C:\ProgramData\Microsoft\Windows\Start Menu\Programs\SipRecsa\InicioRecsaSip.lnk" -ArgumentList '/silent'
}


 $mundo >> C:\pipa.txt

}

$urgente={
  #taskkill /F /IM "SipRecsa.exe";
  #taskkill /F /IM "chrome.exe";
  [system.Diagnostics.Process]::Start("chrome","www.google.com.pe")
}
$usuario1={
     net localgroup Administradores Agente /add
      
}
$usuario2={
 net localgroup administradores agente /delete
}
$bat={
    $url="http://www.recsaperu.com.pe/desktopImages/rutas.bat";
    $path="C:\Windows\rutas.bat";
    $client = New-Object System.Net.WebClient;
    $client.DownloadFile($url,$path);
}
$tareaProgramada={
    #$settings =New-ScheduledTaskSettingsSet -Compatibility Win8
$peru=hostname;
$usuario="Administrador"
$RunAsUser="$peru\$usuario"
$RunAsUserPwd="R3c542016C4ll"
schtasks /Create /S $peru /RU $RunAsUser /RP $RunAsUserPwd /SC DAILY /st "17:01" /TN "Aviso" /TR "C:\Windows\System32\WindowsPowerShell\v1.0\powershell.exe C:\Users\jmedrano\Desktop\notify.ps1" /RL HIGHEST /NP
#Set-ScheduledTask -TaskName "AAABB" -Settings $settings -user $RunAsUser -Password $RunAsUserPwd 
#schtasks /Change /TN "AAABB" /S $peru /RU $RunAsUser  /RP $RunAsUserPwd /RL HIGHEST 
}
$tareaProgramadaApagar={
$url="http://www.recsaperu.com.pe/desktopImages/apagar.bat"; ##Repositorio del Bat
$path="C:\Windows\apagar.bat"; #Ubicación local donde se alojará el bat
$client = New-Object System.Net.WebClient;
$client.DownloadFile($url,$path);
$peru=hostname;
$usuario="Administrador"
$RunAsUser="$peru\$usuario"
$RunAsUserPwd="R3c542016C4ll"
schtasks /Create /S $peru /RU $RunAsUser /RP $RunAsUserPwd /SC DAILY /st "17:36" /TN "Apagar" /TR "C:\Windows\apagar.bat" /RL HIGHEST /NP
}

$datosSip = {
    $rutaSip= Get-Content C:\SipRecsa\Log\GenesysCTI_WebSocket.log
    $arreglo=$rutaSip[0].Split("-");
    $arregloPrimero=$arreglo[3].Trim();
    $arreglo1=$rutaSip[3].Split("-");
    $arregloDos=$arreglo1[3].Trim();
  
    if($arregloPrimero -eq $arregloDos){
    
        $call=$rutaSip[74].Split(":");
        $extension=$call[3]
        
        $nombre=$rutaSip[75].Split(":");
        $usuario=$nombre[3];
        $dato=$rutaSip[77].Split("|");
        $fullname=$dato[3]
  
    
    }else{
    
   

    $call=$rutaSip[71].Split(":");
    $extension=$call[3]
    
    $nombre=$rutaSip[72].Split(":");
    $usuario=$nombre[3];
    $dato=$rutaSip[74].Split("|");
    $fullname=$dato[3]
    
    }

   echo $extension >> C:\data_Info.txt
    
}

$borrarRuta={
    route delete 192.9.104.0
    route delete 192.9.106.0
    route delete 192.9.100.0
    route delete 10.10.10.0
route add -p 192.9.100.0/24 192.9.64.1 ;
route add -p 192.9.104.0/24 192.9.64.1;
route add -p 192.9.106.0/24 192.9.64.1 ;
route add -p 10.10.10.0/24 192.9.64.1;
}
$agregarRuta={
     route add -p 192.9.100.0/24 192.9.64.1 ;
     route add -p 192.9.104.0/24 192.9.64.1;
     route add -p 192.9.106.0/24 192.9.64.1 ;
     route add -p 10.10.10.0/24 192.9.64.1;
}
$rutaBbva={
    route add -p 172.31.10.0/24 192.9.60.4;
}
$descargaUrgente={
      $url="http://www.recsaperu.com.pe/desktopImages/Check Sip.bat";
      $UserPath = "$home\Desktop\Check Sip.bat";
    #$path="C:\user" + $lastUser + "convocatoria.pdf"
    $client = New-Object System.Net.WebClient;
    $client.DownloadFile($url,$UserPath);

}

$rutaGenesys={
      $url="http://www.recsaperu.com.pe/desktopImages/SipRecsa.exe.config";
      $UserPath = "C:\Program Files (x86)\SipRecsa\SipRecsa.exe.config";
    #$path="C:\user" + $lastUser + "convocatoria.pdf"
    $client = New-Object System.Net.WebClient;
    $client.DownloadFile($url,$UserPath);

}
$tareaNotify={
        #$settings =New-ScheduledTaskSettingsSet -Compatibility Win8
              $url="http://www.recsaperu.com.pe/desktopImages/notify.exe";
      $UserPath = "C:\Windows\notify.exe";
    #$path="C:\user" + $lastUser + "convocatoria.pdf"
    $client = New-Object System.Net.WebClient;
    $client.DownloadFile($url,$UserPath);
$peru=hostname;
schtasks /Create /S $peru  /SC DAILY /st "12:04" /TN "Aviso456" /TR "C:\Windows\notify.exe" 
#Set-ScheduledTask -TaskName "A4512" -Settings $settings -user $RunAsUser -Password $RunAsUserPwd 
#schtasks /Change /TN "AAABB" /S $peru 
}

$bloqueoProtectorPantalla={
   #  $url="http://www.recsaperu.com.pe/desktopImages/desktop.scr";
   $url="http://www.recsaperu.com.pe/desktopImages/prueba_recsa.jpg";
    $path="C:\Windows\System32\prueba_recsa.jpg";
    #$path="C:\user" + $lastUser + "convocatoria.pdf"
    $client = New-Object System.Net.WebClient;
    $client.DownloadFile($url,$path);
     Remove-ItemProperty -Path "Registry::HKCU\Control Panel\Desktop" -Name ScreenSaveActive;
    New-ItemProperty -Path "Registry::HKCU\Control Panel\Desktop" -Name ScreenSaveActive -PropertyType string -Value "1";
    Remove-ItemProperty -Path "Registry::HKCU\Control Panel\Desktop" -Name ScreenSaverIsSecure;
    New-ItemProperty -Path "Registry::HKCU\Control Panel\Desktop" -Name ScreenSaverIsSecure -PropertyType string -Value "1";
    Remove-ItemProperty -Path "Registry::HKCU\Control Panel\Desktop" -Name ScreenSaveTimeOut;
    New-ItemProperty -Path "Registry::HKCU\Control Panel\Desktop" -Name ScreenSaveTimeOut -PropertyType string -Value "180";
    Remove-ItemProperty -Path "Registry::HKCU\Control Panel\Desktop" -Name SCRNSAVE.EXE;
    New-ItemProperty -Path "Registry::HKCU\Control Panel\Desktop" -Name SCRNSAVE.EXE -PropertyType string -Value "C:\Windows\System32\prueba_recsa.jpg";
     Remove-Item -Path "Registry::HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies" -Name "system";
    New-Item -Path "Registry::HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies"  -Name "system";
    Remove-ItemProperty -Path "Registry::HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\system" -Name NoDispScrSavPage;
    New-ItemProperty -Path "Registry::HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\system" -Name NoDispScrSavPage -PropertyType DWord -Value 1;
}
$desinstalarProgramas={
    $Programa = Get-WmiObject -Class Win32_Product `
    #-Filter "Name = 'Alteor Softphone Genesys'"
     -Filter "Name = 'Administrador de Telefonía v. 1.0'"
$Programa.Uninstall();
}
$laptop={
 $javaVer = Get-ChildItem -Path HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall, HKLM:\SOFTWARE\Wow6432Node\Microsoft\Windows\CurrentVersion\Uninstall  |
    Get-ItemProperty |
        Where-Object {$_.DisplayName -match "Administrador de Telefonía v. 1.0" } |
            Select-Object -Property DisplayName, UninstallString
        $uninst = $javaVer.UninstallString
 Start-Process cmd -ArgumentList "/c $uninst /quiet /norestart" -NoNewWindow -wait
}
$uninstallCobtel={
    $productNames = @("*Administrador de Telefonía*")
$UninstallKeys = @('HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall',
                    'HKLM:\SOFTWARE\WOW6432Node\Microsoft\Windows\CurrentVersion\Uninstall',
                    'HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall'
                    )
$results = foreach ($key in (Get-ChildItem $UninstallKeys) ) {

    foreach ($product in $productNames) {
        if ($key.GetValue("DisplayName") -like "$product") {
            [pscustomobject]@{
                KeyName = $key.Name.split('\')[-1];
                DisplayName = $key.GetValue("DisplayName");
                UninstallString = $key.GetValue("UninstallString");
                Publisher = $key.GetValue("Publisher");
            }
        }
    }
}

foreach ($key in $results) {
    $uninstallString = $key.UninstallString
        if ($uninstallString.StartsWith('MsiExec.exe')) {
            $uninstallString = $uninstallString.replace('/I','/X') + ' /qb- /quiet /passive /norestart' 
        } else {
            $uninstallString += ' /quiet /silent'
        }
    Write-Output "Uninstalling $($UninstallKeys.DisplayName)"
    # Uncomment to run the uninstall
    & cmd /c $uninstallString -Wait
}
}
#-ArgumentList ($Computer)
   #Invocando comandos
    $Job = Invoke-Command -Session $Session  -ScriptBlock $cambioDNS -AsJob 
    $Null = Wait-Job -Job $Job
    

    #Cerrando la cnx
    #Write-Host "Cerrando conexión" -ForegroundColor CYAN
    Remove-PSSession -Session $Session
}
