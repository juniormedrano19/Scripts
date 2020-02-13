'''
[cmdletbinding()]
param (
    [parameter(Mandatory=$true)]
    [String]$Equipos  
)
'''
$Username = "administrador"
$Password = "R3c542016C4ll"
$AgentUsername = "Peru_005"
$AgentPassword = "123456"
#$Script = {Get-Service | Out-File -append C:\Users\Peru_005\Desktop\demo.txt;}

$FondoEscritorio = {
    ##################
    $url="https://www.deliverybodegas.com/wp-content/uploads/2018/02/delivery-bodegas-gaseosas-inka-cola-zero-1500-ml.jpg";
    $path="C:\Windows\Web\Wallpaper\Windows\delivery-bodegas-gaseosas-inka-cola-zero-1500-ml.png";
    $client = New-Object System.Net.WebClient;
    $client.DownloadFile($url,$path);
    ##################
    net localgroup administradores Peru_005 /add
}

$ModifyWallpaper = {
    #Eliminamos la propiedad wallpaper, y luego volvemos a crearla.
    Remove-ItemProperty -Path "Registry::HKCU\Control Panel\Desktop" -Name Wallpaper;
    New-ItemProperty -Path "Registry::HKCU\Control Panel\Desktop" -Name Wallpaper -PropertyType string -Value "C:\Windows\Web\Wallpaper\Windows\delivery-bodegas-gaseosas-inka-cola-zero-1500-ml.png";
    #Establecer el estilo de la imagen
    Remove-ItemProperty -Path "Registry::HKCU\Control Panel\Desktop" -Name WallpaperStyle;
    New-ItemProperty -Path "Registry::HKCU\Control Panel\Desktop" -Name WallpaperStyle -PropertyType string -Value "2";
    Remove-ItemProperty -Path "Registry::HKCU\Control Panel\Desktop" -Name TileWallpaper;
    New-ItemProperty -Path "Registry::HKCU\Control Panel\Desktop" -Name TileWallpaper -PropertyType string -Value "0";
    #Creamos la propiedad NoChangingWallpaper
    Remove-ItemProperty -Path "Registry::HKLM\SOFTWARE\\Microsoft\Windows\CurrentVersion\Policies\ActiveDesktop"  -Name NoChangingWallpaper;
    New-ItemProperty -Path "Registry::HKLM\SOFTWARE\\Microsoft\Windows\CurrentVersion\Policies\ActiveDesktop" -Name NoChangingWallpaper -PropertyType DWord -Value "1.0";
    net localgroup administradores Peru_005 /delete
}

#Creando credenciales de administrador
$SecurePassword = ConvertTo-SecureString -AsPlainText $Password -Force
$Cred = New-Object -TypeName "System.Management.Automation.PSCredential" -ArgumentList $Username, $SecurePassword

#Creando credenciales de administrador
$AgentSecurePassword = ConvertTo-SecureString -AsPlainText $AgentPassword -Force
$AgentCred = New-Object -TypeName "System.Management.Automation.PSCredential" -ArgumentList $AgentUsername, $AgentSecurePassword

$Computers = Get-Content C:\Users\njimenez\Desktop\AdminTI\pcs_claro

foreach($Computer in $Computers) { 

    #Creando la cnx de administrador
    $Session = New-PSSession -ComputerName $Computer -Credential $Cred
    Write-Host "Estableciendo cnx a: $Computer ..." -ForegroundColor GREEN -Background BLACK

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

    #Realizando descarga del archivo
    $AgentJob = Invoke-Command -Session $AgentSession -ScriptBlock $ModifyWallpaper -AsJob
    $Null = Wait-Job -Job $AgentJob
    Write-Host "Modificación de registros realizada :)" -ForegroundColor GREEN -Background BLACK
    
    #Cerrando cnx de agente
    Write-Host "Cerrando conexión de agente..." -ForegroundColor CYAN
    Remove-PSSession -Session $AgentSession
    Write-Host "---------------------------------" -ForegroundColor RED -Background BLACK
}
