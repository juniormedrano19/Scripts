<# This form was created using POSHGUI.com  a free online gui designer for PowerShell
.NAME
    Untitled
#>

Add-Type -AssemblyName System.Windows.Forms
[System.Windows.Forms.Application]::EnableVisualStyles()

$Form                            = New-Object system.Windows.Forms.Form
$Form.ClientSize                 = '384,192'
$Form.text                       = "Form"
$Form.TopMost                    = $false

$TextBox1                        = New-Object system.Windows.Forms.TextBox
$TextBox1.multiline              = $false
$TextBox1.width                  = 220
$TextBox1.height                 = 20
$TextBox1.location               = New-Object System.Drawing.Point(129,43)
$TextBox1.Font                   = 'Microsoft Sans Serif,14'
$TextBox1.ForeColor              = "#000000"

$Label1                          = New-Object system.Windows.Forms.Label
$Label1.text                     = "Ingresa tu dirección IP"
$Label1.AutoSize                 = $true
$Label1.width                    = 25
$Label1.height                   = 10
$Label1.location                 = New-Object System.Drawing.Point(55,48)
$Label1.Font                     = 'Microsoft Sans Serif,10'

$Button1                         = New-Object system.Windows.Forms.Button
$Button1.text                    = "ACCION"
$Button1.width                   = 60
$Button1.height                  = 30
$Button1.location                = New-Object System.Drawing.Point(156,117)
$Button1.Font                    = 'Microsoft Sans Serif,10'

$Form.controls.AddRange(@($TextBox1,$Label1,$Button1))

$Button1.Add_Click({  })
$Button1.Add_Enter({  })