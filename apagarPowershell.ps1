[cmdletbinding()]
param (
 [Parameter(Mandatory=$True,Position=0, HelpMessage="Ingrese la ip Inicial")]
 [string]$ipInicio,
[Parameter(Mandatory=$True,Position=1, HelpMessage="Ingrese la ip final")]
 [string]$ipFinal
)

Write-Host "Apagar pcs" -ForegroundColor Black -BackgroundColor White;
$username = 'Administrador' 
$password = 'xxxxxxxxxxxxx' #IMPORTANTE Colocar la contraseña de Administrador
Write-Host "Validando Usuario y Password"
$pw = ConvertTo-SecureString $password -AsPlainText -Force 
$cred = New-Object Management.Automation.PSCredential ($username, $pw) 

$Inicial=$ipInicio.Split(".")
$inicio0=$Inicial[0];
$inicio1=$Inicial[1];
$inicio2=$Inicial[2];
[int]$inicio3=$Inicial[3];
$primeraIP=$inicio0+"."+$inicio1+"."+$inicio2+"." ;

$Final=$ipFinal.Split(".")
$ultima0=$Final[0];
$ultima1=$Final[1];
$ultima2=$Final[2];
[int]$ultima3=$Final[3];


for($inicio3;$inicio3 -le $ultima3;$inicio3++){
    $Computer=$primeraIP+$inicio3;
    echo $Computer;
    $s = New-PSSession -computerName $Computer -credential $cred 
  Write-Host "Estableciendo cnx a: $Computer" -ForegroundColor GREEN -Background BLACK;
  
$trabajo={
#Descarga del Bat 
$url="http://www.recsaperu.com.pe/desktopImages/apagar.bat"; ##Repositorio del Bat
$path="C:\Windows\apagar.bat"; #Ubicación local donde se alojará el bat
$client = New-Object System.Net.WebClient;
$client.DownloadFile($url,$path);
#CREACION DE TAREA PROGRAMADA.

$hora="13:10" # IMPORTANTE : Modificar hora según el formato de 24 horas ("HH:mm:ss") , los segundos no son necesarios
$peru=hostname;
$usuario="Administrador"; 
$User="$peru\$usuario";
$Pass="xxxxxxxxxxxxx"; #IMPORTANTE Colocar la contraseña de Administrador
$action = New-ScheduledTaskAction -Execute $path
$trigger =  New-ScheduledTaskTrigger -Daily -At $Hora
Register-ScheduledTask  -User $User -Password $Pass -RunLevel Highest  -Action $action -Trigger $trigger -TaskName "Apagar123" -Description "Apagar diariamente la pc"
}
$Job = Invoke-Command -Session $s -ScriptBlock $trabajo -AsJob 
 $Null = Wait-Job -Job $Job
 Write-Host "Completed" 
 Remove-PSSession -Session $s 
 Write-Host "---------------------------------" -ForegroundColor RED -Background BLACK
  
}




