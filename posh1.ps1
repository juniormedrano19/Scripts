Add-Type -AssemblyName System.Windows.Forms
Add-Type -AssemblyName System.Drawing

$formulario=New-Object System.Windows.Forms.Form
$formulario.Text="Ingresa un dato"
$formulario.Size=New-Object System.Drawing.Size(500,250)
$formulario.StartPosition="CenterScreen"

$AceptarButton=New-Object System.Windows.Forms.Button
$AceptarButton.Location=New-Object System.Drawing.Point(85,140)
$AceptarButton.Size=New-Object System.Drawing.Size(85,32)
$AceptarButton.Text="Aceptar"
$AceptarButton.DialogResult=[System.Windows.Forms.DialogResult]::Yes
$formulario.AcceptButton=$AceptarButton
$formulario.Controls.Add($AceptarButton)

$CancelarButton=New-Object System.Windows.Forms.Button
$CancelarButton.Location=New-Object System.Drawing.Point(85,140)

