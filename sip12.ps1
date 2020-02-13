 '''
[cmdletbinding()]
param (
    [parameter(Mandatory=$true)]
    [String]$Equipos  
)
'''
Write-Host "Cerrar y Abrir SIP" -ForegroundColor Green -BackgroundColor Black;
if (!(Test-Path "C:\Users\jmedrano\Desktop\logs_sip")) {
          New-item -path "C:\Users\jmedrano\Desktop\logs_sip" –type directory
$username = 'Administrador' 
$password = 'R3c542016C4ll'
Write-Host "Validando Usuario y Password"
$pw = ConvertTo-SecureString $password -AsPlainText -Force 
$cred = New-Object Management.Automation.PSCredential ($username, $pw) 
$Computers=Get-Content C:\Users\jmedrano\Desktop\powershell\pcs_claro


foreach($Computer in $Computers){
   $s = New-PSSession -computerName $Computer -credential $cred 

Write-Host "La ip actual es: $Computer" -ForegroundColor  Black -BackgroundColor Green ;


$Sip={
$peru=Get-ItemProperty -Path "C:\Program Files (x86)\SipRecsa\SipRecsa.exe" | Select VersionInfo |Format-List -Property *
$mundo=($peru | findstr "FileVersion").Split()[-1]
if(!($mundo -eq "7.6.0.1")){
taskkill /f /im "SipRecsa.exe"
Start-Process "C:\ProgramData\Microsoft\Windows\Start Menu\Programs\SipRecsa\InicioRecsaSip.lnk" -ArgumentList '/silent'
}





}
     



$Job = Invoke-Command -Session $s -ScriptBlock $peru -AsJob 
 $Null = Wait-Job -Job $Job

 Write-Host "Completed" 
 Remove-PSSession -Session $s 
}