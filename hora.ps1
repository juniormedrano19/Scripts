'''
[cmdletbinding()]
param (
    [parameter(Mandatory=$true)]
    [String]$Equipos  
)
'''
Write-Host "CAMBIO DE HORA" -ForegroundColor Green -BackgroundColor Black;
#WINDOWS10
#$username = 'krivera' 
#$password = 'krivera2017' 
$username = 'Administrador' 
$password = 'R3c542016C4ll'
Write-Host "Validando Usuario y Password"
$pw = ConvertTo-SecureString $password -AsPlainText -Force 
$cred = New-Object Management.Automation.PSCredential ($username, $pw) 
$Computers=Get-Content C:\Users\jmedrano\Desktop\powershell\pcs_claro
$hora= Get-Date
$cambiar_hora={
    Param($hora) 
    set-date -date $hora
}
$zoneTime={
    tzutil /s "SA Pacific Standard Time"
}

foreach($Computer in $Computers){
   $s = New-PSSession -computerName $Computer -credential $cred 

Write-Host "La ip actual es: $Computer" -ForegroundColor  Black -BackgroundColor Green ;

if($s -eq $Null){
    Write-Host "No se puede conectar" -ForegroundColor Blue -BackgroundColor White;
}

else{
#-ArgumentList ($Computer)
    $Job = Invoke-Command -Session $s -ScriptBlock $zoneTime -AsJob 
    $Null = Wait-Job -Job $Job
   
    Write-Host "Completed" 
    Remove-PSSession -Session $s 
}



}