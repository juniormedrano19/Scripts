
[void] [System.Reflection.Assembly]::LoadWithPartialName("System.Drawing") 
[void] [System.Reflection.Assembly]::LoadWithPartialName("System.Windows.Forms")  

$Form = New-Object System.Windows.Forms.Form    
$Form.Size = New-Object System.Drawing.Size(600,400)  
$Form.StartPosition = "CenterScreen" #loads the window in the center of the screen
$Form.FormBorderStyle = [System.Windows.Forms.FormBorderStyle]::FixedToolWindow #modifies the window border
$Form.Text = "SIP RECSA" #window description
############################################## Start functions

function Sip {
     if (!(Test-Path "C:\Users\jmedrano\Desktop\logs_sip")) {
          New-item -path "C:\Users\jmedrano\Desktop\logs_sip" –type directory
     }
     $Username = "Administrador"
    $Password = "R3c542016C4ll"
$Computers=Get-Content C:\Users\jmedrano\Desktop\powershell\pcs_claro
$versionActual=$InputBox.text; #we're taking the text from the input box into the variable $wks
  #ping $wks

    $SecurePassword = ConvertTo-SecureString -AsPlainText $Password -Force
$Cred = New-Object -TypeName "System.Management.Automation.PSCredential" -ArgumentList $Username, $SecurePassword



 #$aplicativos=Get-Content C:\Users\Agente.DESKTOP-60OV35H\Desktop\aplicaciones
foreach($Computer in $Computers) { 

  $hora=Get-Date -DisplayHint DateTime
    #Creando la cnx
    $Session = New-PSSession -ComputerName $Computer -Credential $Cred

   Write-Host "PC name: $Computer ..." -ForegroundColor GREEN -Background BLACK
 $ping= ping -n 1 $Computer
    if($Session -eq $Null -Or !($ping) ){
        "No se pudo conectar en $Computer" + " - " + $hora >> C:\Users\jmedrano\Desktop\logs_sip\log_error.txt
        $outputBox.text= "No se pudo conectar en $Computer"+ " - " + $hora;
    }
    else{
$peru=Get-ItemProperty -Path "C:\Program Files (x86)\SipRecsa\SipRecsa.exe" | Select VersionInfo |Format-List -Property *
[string]$mundo=($peru | findstr "FileVersion").Split()[-1]
      if($mundo -eq $versionActual){
           Remove-PSSession -Session $Session
        "Ya tiene la versión $VersionActual en $Computer" + " - " + $hora >>  C:\Users\jmedrano\Desktop\logs_sip\log_exitoso.txt
    $outputBox.text= "Ya tiene la versión $VersionActual en $Computer" + " - " + $hora;
     
      }
    else{
      $sipRec={
            taskkill /f /im "SipRecsa.exe";
Start-Process "C:\ProgramData\Microsoft\Windows\Start Menu\Programs\SipRecsa\InicioRecsaSip.lnk" -ArgumentList '/silent';
}
      #Invocando comandos
    $Job = Invoke-Command -Session $Session  -ScriptBlock $sipRec -AsJob 
    $Null = Wait-Job -Job $Job
    Remove-PSSession -Session $Session
    "Inicio exitoso SipRecsa $VersionActual en $Computer" + " - " + $hora >>  C:\Users\jmedrano\Desktop\logs_sip\log_exitoso.txt
    $outputBox.text= "Inicio exitoso SipRecsa $VersionActual en $Computer" + " - " + $hora;

    }

    #Cerrando la cnx
    #Write-Host "Cerrando conexión" -ForegroundColor CYAN
   
    }
     }

 #send  results to the output box
                     } #end 
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
$label                           = New-Object system.Windows.Forms.Label
$label.text                      = "Versión Actual"
$label.AutoSize                  = $true
$label.width                     = 25
$label.height                    = 10
$label.location                  = New-Object System.Drawing.Point(40,10)
$label.Font                      = 'Comic Sans MS,10'
$Form.Controls.Add($label) 
############################################## Start buttons

$Button = New-Object System.Windows.Forms.Button 
$Button.Location = New-Object System.Drawing.Size(400,30) 
$Button.Size = New-Object System.Drawing.Size(110,80) 
$Button.Text = "Instalar" 
$Button.Add_Click({Sip}) 
$Form.Controls.Add($Button) 
$Button.Cursor = [System.Windows.Forms.Cursors]::Hand
$Button.BackColor = [System.Drawing.Color]::LightBlue
###########################################################


############################################## end buttons

$Form.Add_Shown({$Form.Activate()})
[void] $Form.ShowDialog();