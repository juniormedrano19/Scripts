 '''
[cmdletbinding()]
param (
    [parameter(Mandatory=$true)]
    [String]$Equipos  
)
'''
Write-Host "Desinstalado APPS NATIVAS DE Windows10" -ForegroundColor Black -BackgroundColor White;
#$username = 'Agente' 
#$password = '123456' 
$username = 'Agente' 
$password = 'krivera2017'
#$username = 'Administrador' 
#$password = 'R3c542016C4ll'
Write-Host "Validando Usuario y Password"
$pw = ConvertTo-SecureString $password -AsPlainText -Force 
$cred = New-Object Management.Automation.PSCredential ($username, $pw) 
$Computers=Get-Content C:\Users\jmedrano\Desktop\powershell\pcs_claro


foreach($Computer in $Computers){
    $s = New-PSSession -computerName $Computer -credential $cred 

Write-Host "La ip actual es: $Computer" -ForegroundColor  Red -BackgroundColor Cyan ;
$bloqueoProtectorPantalla={
   #  $url="http://www.recsaperu.com.pe/desktopImages/prueba_recsa.jpg";
   # $path="C:\Windows\System32\prueba_recsa.jpg";
    #$path="C:\user" + $lastUser + "convocatoria.pdf"
   # $client = New-Object System.Net.WebClient;
   # $client.DownloadFile($url,$path);
     Remove-ItemProperty -Path "Registry::HKCU\Control Panel\Desktop" -Name ScreenSaveActive;
    New-ItemProperty -Path "Registry::HKCU\Control Panel\Desktop" -Name ScreenSaveActive -PropertyType string -Value "1";
    Remove-ItemProperty -Path "Registry::HKCU\Control Panel\Desktop" -Name ScreenSaveIsSecure;
    New-ItemProperty -Path "Registry::HKCU\Control Panel\Desktop" -Name ScreenSaveIsSecure -PropertyType string -Value "1";
    Remove-ItemProperty -Path "Registry::HKCU\Control Panel\Desktop" -Name ScreenSaveTimeOut;
    New-ItemProperty -Path "Registry::HKCU\Control Panel\Desktop" -Name ScreenSaveTimeOut -PropertyType string -Value "600";
    Remove-ItemProperty -Path "Registry::HKCU\Control Panel\Desktop" -Name SCRNSAVE.EXE;
    New-ItemProperty -Path "Registry::HKCU\Control Panel\Desktop" -Name SCRNSAVE.EXE -PropertyType string -Value "C:\Windows\System32\Bubbles.scr";
    Remove-ItemProperty -Path "Registry::HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\system" -Name NoDispScrSavPage;
   #New-ItemProperty -Path "Registry::HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\system" -Name NoDispScrSavPage -PropertyType DWord -Value 1;
}
$usuario1={
     net localgroup Administradores Agente /add
      
}
$usuario2={
 net localgroup administradores agente /delete
}
$primerizo={
  
$atributos=@("Microsoft.3DBuilder","Microsoft.MSPaint","Microsoft.WindowsStore","Microsoft.Office.OneNote","king.com.CandyCrushFriends","Microsoft.WindowsMaps","Microsoft.People","Microsoft.MicrosoftSolitaireCollection","Microsoft.Office.Desktop","Microsoft.ZuneMusic","Microsoft.ZuneVideo","Microsoft.SkypeApp","Microsoft.XboxGameOverlay","Microsoft.WindowsSoundRecorder","microsoft.windowscommunicationsapps","Microsoft.WindowsCamera","Microsoft.XboxSpeechToTextOverlay","Microsoft.BingWeather","Microsoft.Messaging","Microsoft.BingNews","Microsoft.WindowsAlarms","Microsoft.Office.Desktop")
foreach ($jmedrano in $atributos) {
#$set=Get-AppxProvisionedPackage -Online | Select PackageName,DisplayName | where-object{$_.DisplayName -eq $jmedrano}
#echo $set;
#echo $set.PackageName
#Remove-AppxProvisionedPackage -online -packagename $set.PackageName
#$jmedrano="Microsoft.windowscommunicationsapps"
$obtener=Get-AppxPackage |Select Name,PackageFullName| where-object{$_.Name -eq $jmedrano}
echo $obtener
#echo $obtener.PackageFullName
$obtener.PackageFullName >> C:\peru123456.txt
#Remove-AppxPackage -Package $obtener.Name;
Get-AppxPackage -AllUsers $obtener.Name | Remove-AppxPackage 
}

}


$Job = Invoke-Command -Session $s -ScriptBlock $bloqueoProtectorPantalla -AsJob 
 $Null = Wait-Job -Job $Job

 Write-Host "Completed" 
 Remove-PSSession -Session $s 
}