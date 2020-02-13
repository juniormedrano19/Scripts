
[void] [System.Reflection.Assembly]::LoadWithPartialName("System.Drawing") 
[void] [System.Reflection.Assembly]::LoadWithPartialName("System.Windows.Forms")  

$Form = New-Object System.Windows.Forms.Form    
$Form.Size = New-Object System.Drawing.Size(600,400)  
$Form.StartPosition = "CenterScreen" #loads the window in the center of the screen
$Form.FormBorderStyle = [System.Windows.Forms.FormBorderStyle]::FixedToolWindow #modifies the window border
$Form.Text = "Instalación del  Cliente Cisco VPN" #window description
############################################## Start functions

function Cisco {
     if (!(Test-Path \Users\jmedrano\Desktop\logs)) {
          New-item -path C:\Users\jmedrano\Desktop\logs –type directory
     }
     $Username = "Administrador"
    $Password = "R3c542016C4ll"
$Computers=$InputBox.text; #we're taking the text from the input box into the variable $wks
  #ping $wks

    $SecurePassword = ConvertTo-SecureString -AsPlainText $Password -Force
$Cred = New-Object -TypeName "System.Management.Automation.PSCredential" -ArgumentList $Username, $SecurePassword



 #$aplicativos=Get-Content C:\Users\jmedrano\Desktop\aplicaciones
foreach($Computer in $Computers) { 

  $hora=Get-Date -DisplayHint DateTime
    #Creando la cnx
    $Session = New-PSSession -ComputerName $Computer -Credential $Cred

   Write-Host "PC name: $Computer ..." -ForegroundColor GREEN -Background BLACK
 
    if($Session -eq $Null){
        "La instalación no se pudo realizar en $Computer" + " - " + $hora >> C:\Users\jmedrano\Desktop\logs\log_error.txt
        $outputBox.text= "La instalación no se pudo realizar en $Computer"+ " - " + $hora;
    }
    else{
    $ciscoVpn={Start-Process -FilePath msiexec.exe -ArgumentList '/i',"C:\Users\Administrador\Desktop\Cisco\ciscovpnanyconect.msi",'/q' -Wait -PassThru}
      #Invocando comandos
    $Job = Invoke-Command -Session $Session  -ScriptBlock $ciscoVpn -AsJob 
    $Null = Wait-Job -Job $Job
    

    #Cerrando la cnx
    #Write-Host "Cerrando conexión" -ForegroundColor CYAN
    Remove-PSSession -Session $Session
    "Instalación Exitosa en $Computer" + " - " + $hora >>  C:\Users\jmedrano\Desktop\logs\log_exitoso.txt
    $outputBox.text= "Instalación Exitosa en $Computer" + " - " + $hora;
    }
     }

 #send the ping results to the output box
                     } #end pingInfo
############################################## end functions

############################################## Start text fields

$InputBox = New-Object System.Windows.Forms.TextBox 
$InputBox.Location = New-Object System.Drawing.Size(20,50) 
$InputBox.Size = New-Object System.Drawing.Size(150,20) 
$Form.Controls.Add($InputBox) 

$outputBox = New-Object System.Windows.Forms.TextBox 
$outputBox.Location = New-Object System.Drawing.Size(10,150) 
$outputBox.Size = New-Object System.Drawing.Size(565,200) 
$outputBox.MultiLine = $True 
$outputBox.ScrollBars = "Vertical" 
$Form.Controls.Add($outputBox) 

############################################## end text fields

############################################## Start buttons

$Button = New-Object System.Windows.Forms.Button 
$Button.Location = New-Object System.Drawing.Size(400,30) 
$Button.Size = New-Object System.Drawing.Size(110,80) 
$Button.Text = "Instalar" 
$Button.Add_Click({Cisco}) 
$Form.Controls.Add($Button) 
$Button.Cursor = [System.Windows.Forms.Cursors]::Hand
$Button.BackColor = [System.Drawing.Color]::LightGreen


############################################## end buttons

$Form.Add_Shown({$Form.Activate()})
[void] $Form.ShowDialog();