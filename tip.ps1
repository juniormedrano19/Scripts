<# This form was created using POSHGUI.com  a free online gui designer for PowerShell
.NAME
    Untitled
#>

Add-Type -AssemblyName System.Windows.Forms
[System.Windows.Forms.Application]::EnableVisualStyles()

$Form                            = New-Object system.Windows.Forms.Form
$Form.ClientSize                 = '367,280'
$Form.text                       = "Formulario"
$Form.TopMost                    = $false

$Label1                          = New-Object system.Windows.Forms.Label
$Label1.text                     = "Direccion IP"
$Label1.AutoSize                 = $true
$Label1.width                    = 25
$Label1.height                   = 10
$Label1.location                 = New-Object System.Drawing.Point(61,62)
$Label1.Font                     = 'Microsoft Sans Serif,10'

$Button1                         = New-Object system.Windows.Forms.Button
$Button1.text                    = "ACCION"
$Button1.width                   = 100
$Button1.height                  = 50
$Button1.location                = New-Object System.Drawing.Point(139,136)
$Button1.Font                    = 'Microsoft Sans Serif,10'

$ComboBox1                       = New-Object system.Windows.Forms.ComboBox
$ComboBox1.text                  = Get-Content C:\Users\jmedrano\Desktop\pcs_claro
$ComboBox1.width                 = 100
$ComboBox1.height                = 20
$ComboBox1.location              = New-Object System.Drawing.Point(183,55)
$ComboBox1.Font                  = 'Microsoft Sans Serif,10'



function junior {
    C:\Users\jmedrano\Desktop\CommandRemote.ps1;
}


$Form.controls.AddRange(@($Label1,$Button1,$ComboBox1))


$Button1.Add_Click(${function:junior})
$Button1.Add_Enter({  })



#Write your logic code here

[void]$Form.ShowDialog()
$inicio=0;
$fin=0;
$matriz=@();
for($i=$inicio;$i<=$fin;$i++){
$matriz[$i];
}
