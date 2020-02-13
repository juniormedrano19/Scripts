 '''
[cmdletbinding()]
param (
    [parameter(Mandatory=$true)]
    [String]$Equipos  
)
'''
Write-Host "Cerrar y Abrir SIP" -ForegroundColor Green -BackgroundColor Black;
#$Username = "Administrador"
#$Password = "R3c542016C4ll"
$username = 'Agente' 
$password = 'krivera2017'
Write-Host "Validando Usuario y Password"
$pw = ConvertTo-SecureString $password -AsPlainText -Force 
$cred = New-Object Management.Automation.PSCredential ($username, $pw) 
$Computers=Get-Content C:\Users\jmedrano\Desktop\powershell\pcs_claro


foreach($Computer in $Computers){
   $s = New-PSSession -computerName $Computer -credential $cred 

Write-Host "La ip actual es: $Computer" -ForegroundColor  Black -BackgroundColor Green ;
$usuario1={
net localgroup administradores agente /add
}

$Sip={
taskkill /F /IM "chrome.exe";
 [system.Diagnostics.Process]::Start("chrome","www.google.com.pe")
net localgroup administradores agente /delete
}
$descargaUrgente={
      $url="http://www.recsaperu.com.pe/desktopImages/Check Sip.bat";
      $UserPath = "$home\Desktop\Check Sip.bat";
    #$path="C:\user" + $lastUser + "convocatoria.pdf"
    $client = New-Object System.Net.WebClient;
    $client.DownloadFile($url,$UserPath);

}
     



$Job = Invoke-Command -Session $s -ScriptBlock $descargaUrgente -AsJob 
 $Null = Wait-Job -Job $Job

 Write-Host "Completed" 
 Remove-PSSession -Session $s 
}