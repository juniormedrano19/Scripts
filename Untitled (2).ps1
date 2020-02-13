<# This form was created using POSHGUI.com  a free online gui designer for PowerShell
.NAME
    Untitled
#>

Add-Type -AssemblyName System.Windows.Forms
[System.Windows.Forms.Application]::EnableVisualStyles()

$Form                            = New-Object system.Windows.Forms.Form
$Form.ClientSize                 = '400,400'
$Form.text                       = "Form"
$Form.TopMost                    = $false

$TextBox1                        = New-Object system.Windows.Forms.TextBox
$TextBox1.multiline              = $false
$TextBox1.width                  = 177
$TextBox1.height                 = 20
$TextBox1.location               = New-Object System.Drawing.Point(137,84)
$TextBox1.Font                   = 'Microsoft Sans Serif,10'

$TextBox2                        = New-Object system.Windows.Forms.TextBox
$TextBox2.multiline              = $false
$TextBox2.width                  = 185
$TextBox2.height                 = 20
$TextBox2.location               = New-Object System.Drawing.Point(135,143)
$TextBox2.Font                   = 'Microsoft Sans Serif,10'

$label                           = New-Object system.Windows.Forms.Label
$label.text                      = "Usuario"
$label.AutoSize                  = $true
$label.width                     = 25
$label.height                    = 10
$label.location                  = New-Object System.Drawing.Point(54,90)
$label.Font                      = 'Comic Sans MS,10'

$Label2                          = New-Object system.Windows.Forms.Label
$Label2.text                     = "label"
$Label2.AutoSize                 = $true
$Label2.width                    = 25
$Label2.height                   = 10
$Label2.location                 = New-Object System.Drawing.Point(57,146)
$Label2.Font                     = 'Microsoft Sans Serif,10'

$Button1                         = New-Object system.Windows.Forms.Button
$Button1.text                    = "button"
$Button1.width                   = 60
$Button1.height                  = 30
$Button1.location                = New-Object System.Drawing.Point(80,249)
$Button1.Font                    = 'Microsoft Sans Serif,10'

$Button2                         = New-Object system.Windows.Forms.Button
$Button2.text                    = "button"
$Button2.width                   = 60
$Button2.height                  = 30
$Button2.location                = New-Object System.Drawing.Point(213,245)
$Button2.Font                    = 'Microsoft Sans Serif,10'

$Form.controls.AddRange(@($TextBox1,$TextBox2,$label,$Label2,$Button1,$Button2))




#Write your logic code here

[void]$Form.ShowDialog()