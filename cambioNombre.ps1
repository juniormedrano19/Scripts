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
    $localIpAddress=((ipconfig | findstr [0-9].\.)[0]).Split()[-1];
    
    $url="http://www.recsaperu.com.pe/desktopImages/hostname";
    $path="C:\hostname";
    $client = New-Object System.Net.WebClient;
    $client.DownloadFile($url,$path);

    
    #$leer1=Get-Content C:\cambio;
    #$prueba= grep ($localIpAddress) C:\cambio
    
$prueba=select-string -Path C:\hostname -Pattern $localIpAddress -SimpleMatch
$prueba1=$prueba -split ("%");
$prueba1 > C:\equipo;
$prueba2=get-content C:\equipo | select-object -skip 1
$prueba2>C:\hostname;
    $peru=Get-Content C:\hostname

    $Datos=Get-WmiObject Win32_ComputerSystem;
    $Datos.Rename($peru);

    shutdown -r -t 1;

         
  #Rename-Computer -NewName $peru -Restart;  
}
$borrar={
    Remove-Item -Path "C:\hostname"
   Remove-Item -Path "C:\equipo"
    Remove-Item -Path "C:\cambio"
    Remove-Item -Path "C:\ambito"
    
}


$Job = Invoke-Command -Session $s -ScriptBlock $final -AsJob 
 $Null = Wait-Job -Job $Job

 Write-Host "Completed" 
 Remove-PSSession -Session $s 
}
