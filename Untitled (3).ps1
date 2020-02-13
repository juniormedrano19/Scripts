<# This form was created using POSHGUI.com  a free online gui designer for PowerShell
.NAME
    Untitled
#>

Add-Type -AssemblyName System.Windows.Forms
[System.Windows.Forms.Application]::EnableVisualStyles()

$Form                            = New-Object system.Windows.Forms.Form
$Form.ClientSize                 = '400,400'
$Form.text                       = "Instalación del  Cliente Cisco VPN"
$Form.TopMost                    = $false

$TextBox1                        = New-Object system.Windows.Forms.TextBox
$TextBox1.multiline              = $false
$TextBox1.width                  = 177
$TextBox1.height                 = 20
$TextBox1.location               = New-Object System.Drawing.Point(155,96)
$TextBox1.Font                   = 'Microsoft Sans Serif,10'
$TextBox1.Text= "192.9.60.29";
if ($peru>90) {
MessageBox.Show("El último número debe estar entre el 11 y 89");
}
$TextBox1.Text > C:\notepad.txt;


$label                           = New-Object system.Windows.Forms.Label
$label.text                      = "Dirección IP"
$label.AutoSize                  = $true
$label.width                     = 25
$label.height                    = 10
$label.location                  = New-Object System.Drawing.Point(62,103)
$label.Font                      = 'Comic Sans MS,10'

$Button1                         = New-Object system.Windows.Forms.Button
$Button1.text                    = "Instalar"
$Button1.add_click({
    $Username = "Administrador"
    $Password = "R3c542016C4ll"
    $SecurePassword = ConvertTo-SecureString -AsPlainText $Password -Force
$Cred = New-Object -TypeName "System.Management.Automation.PSCredential" -ArgumentList $Username, $SecurePassword

$Computers = Get-Content C:\notepad.txt;

 #$aplicativos=Get-Content C:\Users\jmedrano\Desktop\aplicaciones
foreach($Computer in $Computers) { 

    #Creando la cnx
    $Session = New-PSSession -ComputerName $Computer -Credential $Cred

   Write-Host "PC name: $Computer ..." -ForegroundColor GREEN -Background BLACK
     $ciscoVpn={Start-Process -FilePath msiexec.exe -ArgumentList '/i',"C:\Users\Administrador\Desktop\Cisco\ciscovpnanyconect.msi",'/q' -Wait -PassThru}
      #Invocando comandos
    $Job = Invoke-Command -Session $Session  -ScriptBlock $ciscoVpn -AsJob 
    $Null = Wait-Job -Job $Job
    

    #Cerrando la cnx
    #Write-Host "Cerrando conexión" -ForegroundColor CYAN
    Remove-PSSession -Session $Session
     }
}
     )
$Button1.width                   = 80
$Button1.height                  = 30
$Button1.location                = New-Object System.Drawing.Point(104,210)
$Button1.Font                    = 'Comic Sans MS,10'

$Button2                         = New-Object system.Windows.Forms.Button
$Button2.text                    = "Reiniciar"
$Button2.width                   = 80
$Button2.height                  = 30
$Button2.location                = New-Object System.Drawing.Point(220,210)
$Button2.Font                    = 'Comic Sans MS,10'

$Form.controls.AddRange(@($TextBox1,$label,$Button1,$Button2))




#Write your logic code here

[void]$Form.ShowDialog()