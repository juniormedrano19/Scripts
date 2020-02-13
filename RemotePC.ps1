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

$FondoEscritorio = {
    #lastlogin!=admin
    ##################
    $url="http://www.recsaperu.com.pe/desktopImages/desktop.jpg";
    $path="C:\Windows\Web\Wallpaper\Windows\desktop.jpg";
    #$path="C:\user" + $lastUser + "convocatoria.pdf"
    $client = New-Object System.Net.WebClient;
    $client.DownloadFile($url,$path);

    ##################
    net localgroup administradores agente /add
    net localgroup administradores Peru_005 /add
    #Hay pc en ingles, para esos casos cambiar el grupo a Administrators
}


$ModifyWallpaper = {
    #Eliminamos la propiedad wallpaper, y luego volvemos a crearla.
    Remove-ItemProperty -Path "Registry::HKCU\Control Panel\Desktop" -Name Wallpaper;
    New-ItemProperty -Path "Registry::HKCU\Control Panel\Desktop" -Name Wallpaper -PropertyType string -Value "C:\Windows\Web\Wallpaper\Windows\desktop.jpg";
    #Establecer el estilo de la imagen
    Remove-ItemProperty -Path "Registry::HKCU\Control Panel\Desktop" -Name WallpaperStyle;
    New-ItemProperty -Path "Registry::HKCU\Control Panel\Desktop" -Name WallpaperStyle -PropertyType string -Value "2";
    Remove-ItemProperty -Path "Registry::HKCU\Control Panel\Desktop" -Name TileWallpaper;
    New-ItemProperty -Path "Registry::HKCU\Control Panel\Desktop" -Name TileWallpaper -PropertyType string -Value "0";
    #Creamos la propiedad NoChangingWallpaper
    Remove-ItemProperty -Path "Registry::HKLM\SOFTWARE\\Microsoft\Windows\CurrentVersion\Policies\ActiveDesktop"  -Name NoChangingWallpaper;
    New-ItemProperty -Path "Registry::HKLM\SOFTWARE\\Microsoft\Windows\CurrentVersion\Policies\ActiveDesktop" -Name NoChangingWallpaper -PropertyType DWord -Value "1.0";
    #Agregamos la carpeta System 
    Remove-Item -Path "Registry::HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies" -Name "system";
    New-Item -Path "Registry::HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies"  -Name "system";
    #Bloqueamos el Regedit, para que ningun agente pueda realizar cambios 
    Remove-ItemProperty -Path "Registry::HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\system" -Name DisableRegistryTools;
    New-ItemProperty -Path "Registry::HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\system" -Name DisableRegistryTools -PropertyType DWord -Value 1;

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
        $Job = Invoke-Command -Session $Session -ScriptBlock $FondoEscritorio -AsJob
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
            $AgentJob = Invoke-Command -Session $AgentSession -ScriptBlock $ModifyWallpaper -AsJob
            $Null = Wait-Job -Job $AgentJob
            Write-Host "Modificación de registros realizada :)" -ForegroundColor GREEN -Background BLACK
            
            #Cerrando cnx de agente
            Write-Host "Cerrando conexión de Peru_005..." -ForegroundColor CYAN
            Remove-PSSession -Session $AgentSession
            Write-Host "---------------------------------" -ForegroundColor RED -Background BLACK
        } else {
            #Realizando descarga del archivo
            $AgentJob = Invoke-Command -Session $AgentSession -ScriptBlock $ModifyWallpaper -AsJob
            $Null = Wait-Job -Job $AgentJob
            Write-Host "Modificación de registros realizada :)" -ForegroundColor GREEN -Background BLACK
            
            #Cerrando cnx de agente
            Write-Host "Cerrando conexión de agente..." -ForegroundColor CYAN
            Remove-PSSession -Session $AgentSession
            Write-Host "---------------------------------" -ForegroundColor RED -Background BLACK
        }
    }
    
}
