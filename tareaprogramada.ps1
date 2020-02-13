'''
[cmdletbinding()]
param (
    [parameter(Mandatory=$true)]
    [String]$Equipos  
)
'''
$Username = "administrador"
$Password = "R3c542016C4ll"
$AgentUsername = "AGENTE"
$Peru_005Username = "Peru_005"
$AgentPassword = "123456"
#$Script = {Get-Service | Out-File -append C:\Users\Peru_005\Desktop\demo.txt;}

$descargaNotify={
        #$settings =New-ScheduledTaskSettingsSet -Compatibility Win8
  $url="http://www.recsaperu.com.pe/desktopImages/notifyIntraRecsa.exe";
   $UserPath = "C:\Windows\notifyIntraRecsa.exe";
    $path="C:\user" + $lastUser + "convocatoria.pdf"
    $client = New-Object System.Net.WebClient;
    $client.DownloadFile($url,$UserPath);


    ##################
    net localgroup administradores agente /add
    net localgroup administradores Peru_005 /add
    
    #Hay pc en ingles, para esos casos cambiar el grupo a Administrators
#Set-ScheduledTask -TaskName "A4512" -Settings $settings -user $RunAsUser -Password $RunAsUserPwd 
#schtasks /Change /TN "AAABB" /S $peru 
}
$descargaBat={
  #    $url1="http://www.recsaperu.com.pe/desktopImages/referidos.png";
  #  $UserPath1 = "C:\Windows\referidos.png";
    #$path="C:\user" + $lastUser + "convocatoria.pdf"
    #$client = New-Object System.Net.WebClient;
    #$client.DownloadFile($url1,$UserPath1);
     $url2="http://www.recsaperu.com.pe/desktopImages/images.bat";
    $UserPath2 = "C:\Windows\images.bat";
    #$path="C:\user" + $lastUser + "convocatoria.pdf"
    $client = New-Object System.Net.WebClient;
    $client.DownloadFile($url2,$UserPath2);
    ##################
    net localgroup administradores agente /add
    net localgroup administradores Peru_005 /add
    
}
 

$tareaNotify = {
$peru=hostname;
schtasks /delete /TN "AvisoNotify" /f
schtasks /Create /S $peru  /SC WEEKLY /D "TUE,THU" /st "10:00" /TN "AvisoNotify" /TR "C:\Windows\notifyIntraRecsa.exe" 


#schtasks /Create /S $peru  /SC DAILY /st "16.00" /TN "AvisoNotify" /TR "C:\Windows\notifyIntraRecsa.exe" 
    net localgroup administradores agente /delete
    net localgroup administradores Peru_005 /delete
}

$tareaBat = {
$peru=hostname;
schtasks /delete /TN "AvisoBat" /f
schtasks /Create /S $peru  /SC WEEKLY /D "TUE,THU" /st "10:00" /TN "AvisoBat" /TR "C:\Windows\images.bat" 

    net localgroup administradores agente /delete
    net localgroup administradores Peru_005 /delete
}

#Creando credenciales de administrador
$SecurePassword = ConvertTo-SecureString -AsPlainText $Password -Force
$Cred = New-Object -TypeName "System.Management.Automation.PSCredential" -ArgumentList $Username, $SecurePassword

#Creando credenciales de agentes
$AgentSecurePassword = ConvertTo-SecureString -AsPlainText $AgentPassword -Force
$AgentCred = New-Object -TypeName "System.Management.Automation.PSCredential" -ArgumentList $AgentUsername, $AgentSecurePassword

$Peru_005Cred = New-Object -TypeName "System.Management.Automation.PSCredential" -ArgumentList $Peru_005Username, $AgentSecurePassword

$Computers = Get-Content C:\Users\jmedrano\Desktop\powershell\pcs_claro

foreach($Computer in $Computers) { 

    #Creando la cnx de administrador
    $Session = New-PSSession -ComputerName $Computer -Credential $Cred
    Write-Host "Estableciendo cnx a: $Computer ..." -ForegroundColor GREEN -Background BLACK

    if ($Session -eq $Null) {
        Write-Host "No se puede conectar...." -ForegroundColor BLACK -Background RED
    } else {
        #Realizando descarga del archivo
        $Job = Invoke-Command -Session $Session -ScriptBlock $descargaBat -AsJob
        $Null = Wait-Job -Job $Job
        Write-Host "Descarga de desktop.jpg realizada :)" -ForegroundColor GREEN -Background BLACK

        #Cerrando cnx de administrador
        Write-Host "Cerrando conexión de administrador..." -ForegroundColor CYAN
        Remove-PSSession -Session $Session

        #Creando la cnx de agente
        $AgentSession = New-PSSession -ComputerName $Computer -Credential $AgentCred
        Write-Host "Estableciendo cnx a: $Computer como agente" -ForegroundColor GREEN -Background BLACK
        if ($AgentSession -eq $Null) {
            Write-Host "Iniciando sesión como Peru_005"
            $AgentSession = New-PSSession -ComputerName $Computer -Credential $Peru_005Cred
            Write-Host "Estableciendo cnx a: $Computer como Peru_005" -ForegroundColor GREEN -Background BLACK

            #Realizando descarga del archivo
            $AgentJob = Invoke-Command -Session $AgentSession -ScriptBlock $tareaBat -AsJob
            $Null = Wait-Job -Job $AgentJob
            Write-Host "Modificación de registros realizada :)" -ForegroundColor GREEN -Background BLACK
            
            #Cerrando cnx de agente
            Write-Host "Cerrando conexión de Peru_005..." -ForegroundColor CYAN
            Remove-PSSession -Session $AgentSession
            Write-Host "---------------------------------" -ForegroundColor RED -Background BLACK
        } else {
            #Realizando descarga del archivo
            $AgentJob = Invoke-Command -Session $AgentSession -ScriptBlock $tareaBat -AsJob
            $Null = Wait-Job -Job $AgentJob
            Write-Host "Modificación de registros realizada :)" -ForegroundColor GREEN -Background BLACK
            
            #Cerrando cnx de agente
            Write-Host "Cerrando conexión de agente..." -ForegroundColor CYAN
            Remove-PSSession -Session $AgentSession
            Write-Host "---------------------------------" -ForegroundColor RED -Background BLACK
        }
    }
    
}
