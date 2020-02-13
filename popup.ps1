 '''
[cmdletbinding()]
param (
    [parameter(Mandatory=$true)]
    [String]$Equipos  
)
'''
Write-Host "POPUP" -ForegroundColor Green -BackgroundColor Black;
#WINDOWS10
#$username = 'krivera' 
#$password = 'krivera2017' 
$username = 'Administrador' 
$password = 'R3c542016C4ll'
Write-Host "Validando Usuario y Password"
$pw = ConvertTo-SecureString $password -AsPlainText -Force 
$cred = New-Object Management.Automation.PSCredential ($username, $pw) 
$Computers=Get-Content C:\Users\jmedrano\Desktop\powershell\pcs_claro


foreach($Computer in $Computers){
   $s = New-PSSession -computerName $Computer -credential $cred 

Write-Host "La ip actual es: $Computer" -ForegroundColor  Black -BackgroundColor Green ;


$peru={
    $msg = "Hola mundo www.intrarecsa.com.pe"
   
Invoke-WmiMethod ` -Path Win32_Process ` -Name Create ` -ArgumentList "msg * $msg" ` 
}
     



$Job = Invoke-Command -Session $s -ScriptBlock $peru -AsJob 
 $Null = Wait-Job -Job $Job

 Write-Host "Completed" 
 Remove-PSSession -Session $s 
}