
Add-Type -AssemblyName System.Windows.Forms
$balloon = New-Object System.Windows.Forms.NotifyIcon 

#Configurar notificación
#Icono
$balloon.Icon  = [System.Drawing.Icon]::ExtractAssociatedIcon((Get-Process -Name winword).Path) 
$balloon.BalloonTipIcon  = [string]$Icon = 'Info'
#Mensaje
$balloon.BalloonTipText  = "Mensaje"
#Título
$balloon.BalloonTipTitle  = "Título"
 
$balloon.Visible  = $true
$balloon.ShowBalloonTip(5000)