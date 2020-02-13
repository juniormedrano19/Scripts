'''
[cmdletbinding()]
param (
    [parameter(Mandatory=$true)]
    [String]$Equipos  
)
'''
$Username = "administrador"
$Password = "R3c542016C4ll"
$AgentUsername = "Agente"
$Peru_005Username = "Peru_005"
$AgentPassword = "krivera2017"
#$Script = {Get-Service | Out-File -append C:\Users\Peru_005\Desktop\demo.txt;}
#Creando credenciales de administrador
$usuario1={
       net localgroup administradores agente /add
      # net localgroup administradores agente /delete
}



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
    echo $Computer
    echo $AgentUsername
    echo $AgentPassword
psexec.exe \\$Computer /u $AgentUsername /p $AgentPassword taskkill /f /im "SipRecsa.exe"
psexec.exe \\$Computer /u $AgentUsername /p $AgentPassword taskkill /f /im "chrome.exe"
psexec.exe /i \\$Computer /u $AgentUsername /p $AgentPassword "C:\Program Files (x86)\SipRecsa\InicioRecsaSip.exe" 
psexec.exe /i \\$Computer /u $AgentUsername /p $AgentPassword "C:\Program Files (x86)\Google\Chrome\Application\chrome.exe" "http://192.9.100.62/cobweb/login/" 

#psexec.exe /i \\$Computer /u $AgentUsername /p $AgentPassword "C:\Program Files (x86)\Google\Chrome\Application\chrome.exe" "http://192.9.100.62/cobweb/login/"
$chrome={
 net localgroup administradores agente /delete
}

    if ($Session -eq $Null) {
        Write-Host "No se puede conectar...." -ForegroundColor BLACK -Background RED
    } else {
        #Realizando descarga del archivo
       $Job = Invoke-Command -Session $Session -ScriptBlock $usuario1 -AsJob
       $Null = Wait-Job -Job $Job

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
            $AgentJob = Invoke-Command -Session $AgentSession -ScriptBlock $chrome -AsJob
            $Null = Wait-Job -Job $AgentJob

            #psexec.exe /i \\$Computer /u $AgentUsername /p $AgentPassword "C:\Program Files (x86)\SipRecsa\InicioRecsaSip.exe" 
            #psexec.exe /i \\$Computer /u $AgentUsername /p $AgentPassword "C:\Program Files (x86)\Google\Chrome\Application\chrome.exe" "http://192.9.100.62/cobweb/login/" 
            
            #Cerrando cnx de Peru 005
            Write-Host "Cerrando conexión de Peru_005..." -ForegroundColor CYAN
            Remove-PSSession -Session $AgentSession
            Write-Host "---------------------------------" -ForegroundColor RED -Background BLACK
        } else {
            #Realizando descarga del archivo
            $AgentJob = Invoke-Command -Session $AgentSession -ScriptBlock $chrome -AsJob
            $Null = Wait-Job -Job $AgentJob
            
            
            #Cerrando cnx de agente
            Write-Host "Cerrando conexión de agente..." -ForegroundColor CYAN
            Remove-PSSession -Session $AgentSession
            Write-Host "---------------------------------" -ForegroundColor RED -Background BLACK
        }
    }
    
}
