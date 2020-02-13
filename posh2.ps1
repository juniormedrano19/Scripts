Add-Type -AssemblyName System.Windows.Forms
Add-Type -AssemblyName System.Drawing

$form = New-Object System.Windows.Forms.Form
$form.Text = 'Select a Computer'
$form.Size = New-Object System.Drawing.Size(300,200)
$form.StartPosition = 'CenterScreen'

$OKButton = New-Object System.Windows.Forms.Button
$OKButton.Location = New-Object System.Drawing.Point(75,120)
$OKButton.Size = New-Object System.Drawing.Size(75,23)
$OKButton.Text = 'Aceptar'
$OKButton.DialogResult = [System.Windows.Forms.DialogResult]::OK
$form.AcceptButton = $OKButton
$form.Controls.Add($OKButton)


$CancelarButton = New-Object System.Windows.Forms.Button
$CancelarButton.Location = New-Object System.Drawing.Point(150,120)
$CancelarButton.Size = New-Object System.Drawing.Size(75,23)
$CancelarButton.Text = 'Cancelar'
$CancelarButton.DialogResult = [System.Windows.Forms.DialogResult]::Cancel
$form.CancelButton = $CancelarButton
$form.Controls.Add($CancelarButton)

$label = New-Object System.Windows.Forms.Label
$label.Location = New-Object System.Drawing.Point(10,20)
$label.Size = New-Object System.Drawing.Size(280,20)
$label.Text = 'Por favor seleccione una IP'
$form.Controls.Add($label)

$listBox = New-Object System.Windows.Forms.ListBox
$listBox.Location = New-Object System.Drawing.Point(10,40)
$listBox.Size = New-Object System.Drawing.Size(260,20)
$listBox.Height = 80

[void] $listBox.Items.Add('192.9.60.61')
[void] $listBox.Items.Add('192.9.60.58')
[void] $listBox.Items.Add('192.9.60.70')
[void] $listBox.Items.Add('192.9.60.36')
[void] $listBox.Items.Add('192.9.60.15')
[void] $listBox.Items.Add('192.9.60.14')
[void] $listBox.Items.Add('192.9.60.80')

$form.Controls.Add($listBox)

$form.Topmost = $true

$result = $form.ShowDialog()

if ($result -eq [System.Windows.Forms.DialogResult]::OK)
{
    $x = $listBox.SelectedItem
    $x
}