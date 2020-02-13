[void] [System.Reflection.Assembly]::LoadWithPartialName("System.Drawing") 
[void] [System.Reflection.Assembly]::LoadWithPartialName("System.Windows.Forms")  
$textbox1 = New-Object 'System.Windows.Forms.TextBox'
#$textbox2 = New-Object 'System.Windows.Forms.TextBox'
$textbox3 = New-Object 'System.Windows.Forms.TextBox'
$Button = New-Object 'System.Windows.Forms.Button'
	$Button2 = New-Object 'System.Windows.Forms.Button'
	$Button1 = New-Object 'System.Windows.Forms.Button'
    $Button3 = New-Object 'System.Windows.Forms.Button'
    $Button4 = New-Object 'System.Windows.Forms.Button'
$Form = New-Object System.Windows.Forms.Form    
#$dt = New-Object system.Data.DataTable


function inventarioPcs{
	$Username = "Administrador"
    $Password = "R3c542016C4ll"
	$Computers="192.9.60.29"; 
	$datosInventario={
	$Memory = Get-WmiObject  Win32_ComputerSystem | Select-Object @{Name="Installed Memory (RAM)";Expression={[math]::Round($_.TotalPhysicalMemory / 1GB)}}
$Class = Get-WmiObject Win32_OperatingSystem
$Pc=Get-WmiObject  Win32_ComputerSystem 
$Processor=Get-WmiObject Win32_Processor
$Cores=Get-WmiObject -Class Win32_Processor | Select-Object NumberOfCores;
$disco= Get-WmiObject Win32_DiskDrive 
$discoSize= [math]::Round($disco.Size / 1GB);
$versionSip=Get-ItemProperty -Path "C:\Program Files (x86)\SipRecsa\SipRecsa.exe" | Select VersionInfo |Format-List -Property *
[string]$sipVersion=($versionSip | findstr "FileVersion").Split()[-1]
  $localIpAddress=((ipconfig | findstr [0-9].\.)[0]).Split()[-1];

    #$modelo= wmic csproduct get name;
    $serie= Get-WmiObject win32_bios;

     $texto="" +$localIpAddress+","+$Pc.model+","+$Pc.Manufacturer+","+$serie.SerialNumber+","+$Processor.Name+","+$Cores+""+$discoSize+","+$Class.Caption+","+$env:computerName.ToUpper()+","+$Class.OSArchitecture+","+$Class.ServicePackMajorVersion+","+$Memory.'Installed Memory (RAM)'+","+$sipVersion
                 #Modelo       #Marca                         #Procesador         #Cores    tama�o Disco      #Sistema Operativo   #Hostname                      #Arquitectura            #ServicePAck                        #Memoria                          #Version del Sip                       
     #$ruta="C:\inventario.txt";
    #$texto > $ruta;
$texto | out-string
 
	}

$SecurePassword = ConvertTo-SecureString -AsPlainText $Password -Force
$Cred = New-Object -TypeName "System.Management.Automation.PSCredential" -ArgumentList $Username, $SecurePassword
foreach($Computer in $Computers) { 
    	$Session1 = New-PSSession -ComputerName $Computer -Credential $Cred 
#$Session = New-PSSession -ComputerName $Computer -Credential $Cred
Write-Host " $Computer ..." -ForegroundColor GREEN -Background BLACK

 #Invocando comandos
 #$Job = Invoke-Command -Session $Session  -ScriptBlock $getName -ArgumentList ($Computer,$ipNueva) -AsJob 
 #$Null = Wait-Job -Job $Job
#Remove-PSSession -Session $Session

	###################
	#$Session1 = New-PSSession -ComputerName $Computer -Credential $Cred 
$a = Invoke-Command -Session $Session1 -ScriptBlock $datosInventario
$a > C:\Users\jmedrano\Desktop\consolidado.txt
Get-PSSession | Remove-PSSession
}
}






















		$cancelarButton1={
      $Form.Close()
}
function limpiarDatos{
$textbox1.Text="";
#$textbox2.Text="";
$textbox3.Text="";

}
$textbox1_TextChanged={
		
		$Button.Enabled = $false
		if ($textbox1.Text -ne '') {
			$Button.Enabled = $true
		}
			$Button2.Enabled = $false
		if ($textbox1.Text -ne '') {
			$Button2.Enabled = $true
		}
			$Button1.Enabled = $false
		if ($textbox1.Text -ne '') {
			$Button1.Enabled = $true
		}
	
	}



$Form.Size = New-Object System.Drawing.Size(1100,750)  
$Form.StartPosition = "CenterScreen" 
$Form.FormBorderStyle = [System.Windows.Forms.FormBorderStyle]::FixedToolWindow 
$Form.Text = "CAMBIOS DE IP" 
$Form.Controls.Add($textbox1)
#$Form.Controls.Add($textbox2)
$Form.Controls.Add($textbox3)



$label                           = New-Object system.Windows.Forms.Label
$label.text                      = "IP INICIAL"
$label.AutoSize                  = $true
$label.width                     = 40
$label.height                    = 30
$label.location                  = New-Object System.Drawing.Point(55,30)
$label.Font                      = 'Comic Sans MS,10'
$Form.Controls.Add($label) 

$label2                           = New-Object system.Windows.Forms.Label
$label2.text                      = "IP FINAL"
$label2.AutoSize                  = $true
$label2.width                     = 40
$label2.height                    = 30
$label2.location                  = New-Object System.Drawing.Point(55,120)
$label2.Font                      = 'Comic Sans MS,10'
$Form.Controls.Add($label2) 
############ip inicial
	$textbox1.Font = 'Segoe UI, 12pt'
	$textbox1.Location = '40, 60'
	$textbox1.Margin = '5, 5, 5, 5'
	$textbox1.Multiline = $True
	$textbox1.Name = 'textbox5'
	$textbox1.Size = '200, 30'
	$textbox1.TabIndex = 1
	$textbox1.add_TextChanged($textbox1_TextChanged)
############ip final
    	$textbox3.Font = 'Segoe UI, 12pt'
	$textbox3.Location = '40, 150'
	$textbox3.Margin = '5, 5, 5, 5'
	$textbox3.Multiline = $True
	$textbox3.Name = 'textbox5'
	$textbox3.Size = '200, 30'
	$textbox3.TabIndex = 1
	$textbox3.add_TextChanged($textbox1_TextChanged)
############ip caja de inventario
   #  $textbox2.Font = 'Segoe UI, 12pt'
#	$textbox2.Location = '340,25'
#	$textbox2.Margin = '5, 5, 5, 5'
#	$textbox2.Multiline = $True
#	$textbox2.Name = 'textbox9'
#	$textbox2.Size = '700, 650'
#	$textbox2.TextAlign = 'Center'
#	$textbox2.TabIndex = 2
 #   $textbox2.Enabled=$false
#	$textbox2.ReadOnly=$true
 #   $textbox2.Scrollbars = 'Vertical'
	# $textbox2.Scrollbars = 'Horizontal'


	$dataGridView = New-Object System.Windows.Forms.DataGridView
$dataGridView.Size=New-Object System.Drawing.Size(700,650)
$dataGridView.Location= New-Object System.Drawing.Point(340,25)
$Form.Controls.Add($dataGridView)
$dataGridView.ColumnCount = 4
$dataGridView.ColumnHeadersVisible = $true
$dataGridView.Columns[0].Name = "Process"
$dataGridView.Columns[1].Name = "ID"
$dataGridView.Columns[2].Name = "Description"
$dataGridView.Columns[3].Name = "Memory"


$row1 = get-process

$rows = @($row1)
foreach ($row in $rows)
{    
$dataGridView.Rows.Add($row.name,"Peru")}

	

	#$dt.Columns.Add((New-Object System.Data.DataColumn('Column1', 'string')))
	#$dt.Columns.Add((New-Object System.Data.DataColumn('Column2', 'int')))
	#$dt.Columns.Add((New-Object System.Data.DataColumn('Column3', 'string')))
	#$null=$dt.Rows.Add('RowOne',100,'This')
	#$null=$dt.Rows.Add('RowTwo',150,'That')
	#$null=$dt.Rows.Add('RowThree',200,'What')
	#$Form.Controls.Add($dt)




$Button.Location = New-Object System.Drawing.Size(62,270) 
$Button.Size = New-Object System.Drawing.Size(150,50) 
$Button.Text = "CANCELAR" 
$Button.UseVisualStyleBackColor = $True
$Button.BackColor = [System.Drawing.Color]::LightBlue
$Button.DialogResult= "Cancel"
$Button.Add_Click($cancelarButton1) 
$Form.Controls.Add($Button)	

    ##########################################

$Button1.Location = New-Object System.Drawing.Size(62,350) 
$Button1.Size = New-Object System.Drawing.Size(150,50) 
$Button1.Text = "LIMPIAR DATOS" 
$Button1.UseVisualStyleBackColor = $True
$Button1.BackColor = [System.Drawing.Color]::LightBlue
$Button1.Add_Click({limpiarDatos}) 
$Form.Controls.Add($Button1)	
########################################
$Button2.Location = New-Object System.Drawing.Size(62,430) 
$Button2.Size = New-Object System.Drawing.Size(150,50) 
$Button2.Text = "OBTENER INVENTARIO" 
$Button2.UseVisualStyleBackColor = $True
$Button2.BackColor = [System.Drawing.Color]::LightBlue
$Button2.Add_Click({cambiarRango}) 
$Form.Controls.Add($Button2)	

##########################################
$Button3.Location = New-Object System.Drawing.Size(62,510) 
$Button3.Size = New-Object System.Drawing.Size(150,50) 
$Button3.Text = "GENERAR REPORTE" 
$Button3.UseVisualStyleBackColor = $True
$Button3.BackColor = [System.Drawing.Color]::LightBlue
$Button3.Add_Click({cambiarRango}) 
$Form.Controls.Add($Button3)	

$Button4.Location = New-Object System.Drawing.Size(62,590) 
$Button4.Size = New-Object System.Drawing.Size(150,50) 
$Button4.Text = "SALIR" 
$Button4.UseVisualStyleBackColor = $True
$Button4.BackColor = [System.Drawing.Color]::LightBlue
$Button4.Add_Click({cambiarRango}) 
$Form.Controls.Add($Button4)	


$Form.Add_Shown({$Form.Activate()})
[void] $Form.ShowDialog();
