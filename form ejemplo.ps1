function Get-ProcessInfo { 
    $array = New-Object System.Collections.ArrayList 
    $Script:procInfo = Get-Process | Select Id,Name,Path,Description,VM,WS,CPU,Company | sort -Property Name 
   $array.AddRange($procInfo) 
  $dataGrid1.DataSource = $array 
   $form1.refresh() 



} 
 
#Generated Form Function 
function GenerateForm { 
######################################################################## 
# Code Generated By: SAPIEN Technologies PrimalForms (Community Edition) v1.0.8.0 
# Generated On: 2/24/2010 11:38 AM 
# Generated By: Ravikanth Chaganti (http://www.ravichaganti.com/blog) 
######################################################################## 
 
#region Import the Assemblies 
[reflection.assembly]::loadwithpartialname("System.Windows.Forms") | Out-Null 
[reflection.assembly]::loadwithpartialname("System.Drawing") | Out-Null 
#endregion 
 
#region Generated Form Objects 
$form1 = New-Object System.Windows.Forms.Form 
$label1 = New-Object System.Windows.Forms.Label 
$label2 = New-Object System.Windows.Forms.Label 
$button3 = New-Object System.Windows.Forms.Button 
$button2 = New-Object System.Windows.Forms.Button 
$button1 = New-Object System.Windows.Forms.Button 
$button4 = New-Object System.Windows.Forms.Button 
$button5 = New-Object System.Windows.Forms.Button 
$textbox1 = New-Object 'System.Windows.Forms.TextBox'
$textbox3 = New-Object 'System.Windows.Forms.TextBox'
$dataGrid1 = New-Object System.Windows.Forms.DataGrid 
$InitialFormWindowState = New-Object System.Windows.Forms.FormWindowState 
#endregion Generated Form Objects 
 
#---------------------------------------------- 
#Generated Event Script Blocks 
#---------------------------------------------- 
#Provide Custom Code for events specified in PrimalForms. 
$button3_OnClick=  
{ 
    $form1.Close() 
} 
 
$button1_OnClick=  
{ 
    Get-ProcessInfo 
} 
 
$button2_OnClick=  
{ 
    $selectedRow = $dataGrid1.CurrentRowIndex 
    if (($procid=$Script:procInfo[$selectedRow].Id)) { 
            Stop-Process -Id $procid -Confirm 
        } 
} 
 
$OnLoadForm_UpdateGrid= 
{ 
    Get-ProcessInfo 
} 
 
#---------------------------------------------- 
#region Generated Form Code 
$form1.Controls.Add($textbox1)
#$Form.Controls.Add($textbox2)
$form1.Controls.Add($textbox3)
$form1.Text = "CAMBIOS DE IP" 
$form1.Name = "form1" 
$form1.StartPosition = "CenterScreen" 
$form1.FormBorderStyle = [System.Windows.Forms.FormBorderStyle]::FixedToolWindow 
$form1.DataBindings.DefaultDataSourceUpdateMode = 0 
$System_Drawing_Size = New-Object System.Drawing.Size 
$System_Drawing_Size.Width = 1100
$System_Drawing_Size.Height = 750
$form1.ClientSize = $System_Drawing_Size 
 
#$label1.TabIndex = 4 
#$label1                           = New-Object system.Windows.Forms.Label
$label1.text                      = "IP INICIAL"
$label1.AutoSize                  = $true
$label1.width                     = 40
$label1.height                    = 30
$label1.location                  = New-Object System.Drawing.Point(55,30)
$label1.Font                      = 'Comic Sans MS,10'

 
$form1.Controls.Add($label1) 
#####################################################

#$label2                           = New-Object system.Windows.Forms.Label
$label2.text                      = "IP FINAL"
$label2.AutoSize                  = $true
$label2.width                     = 40
$label2.height                    = 30
$label2.location                  = New-Object System.Drawing.Point(55,120)
$label2.Font                      = 'Comic Sans MS,10'
 
 
$form1.Controls.Add($label2) 
#######################################################

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

$button1.Location = New-Object System.Drawing.Size(62,270) 
$button1.Size = New-Object System.Drawing.Size(150,50) 
$button1.Text = "CANCELAR" 
$button1.UseVisualStyleBackColor = $True
$button1.BackColor = [System.Drawing.Color]::LightBlue
$button1.DialogResult= "Cancel"
$button1.Add_Click($cancelarButton1) 
$form1.Controls.Add($button1)	

    ##########################################

$button2.Location = New-Object System.Drawing.Size(62,350) 
$button2.Size = New-Object System.Drawing.Size(150,50) 
$button2.Text = "LIMPIAR DATOS" 
$button2.UseVisualStyleBackColor = $True
$button2.BackColor = [System.Drawing.Color]::LightBlue
$button2.Add_Click({limpiarDatos}) 
$form1.Controls.Add($button2)	
########################################
$button3.Location = New-Object System.Drawing.Size(62,430) 
$button3.Size = New-Object System.Drawing.Size(150,50) 
$button3.Text = "OBTENER INVENTARIO" 
$button3.UseVisualStyleBackColor = $True
$button3.BackColor = [System.Drawing.Color]::LightBlue
$button3.Add_Click({cambiarRango}) 
$form1.Controls.Add($button3)	

$button4.Location = New-Object System.Drawing.Size(62,510) 
$button4.Size = New-Object System.Drawing.Size(150,50) 
$button4.Text = "GENERAR REPORTE" 
$button4.UseVisualStyleBackColor = $True
$button4.BackColor = [System.Drawing.Color]::LightBlue
$button4.Add_Click({cambiarRango}) 
$form1.Controls.Add($button4)	

$button5.Location = New-Object System.Drawing.Size(62,590) 
$button5.Size = New-Object System.Drawing.Size(150,50) 
$button5.Text = "SALIR" 
$button5.UseVisualStyleBackColor = $True
$button5.BackColor = [System.Drawing.Color]::LightBlue
$button5.Add_Click({cambiarRango}) 
$form1.Controls.Add($button5)	
 
$System_Drawing_Size = New-Object System.Drawing.Size 
$System_Drawing_Size.Width = 700 
$System_Drawing_Size.Height = 650
$dataGrid1.Size = $System_Drawing_Size 
$dataGrid1.DataBindings.DefaultDataSourceUpdateMode = 0 
$dataGrid1.HeaderForeColor = [System.Drawing.Color]::FromArgb(255,0,0,0) 
$dataGrid1.Name = "dataGrid1" 
$dataGrid1.DataMember = "" 
$dataGrid1.TabIndex = 0 
$System_Drawing_Point = New-Object System.Drawing.Point 
$System_Drawing_Point.X = 340
$System_Drawing_Point.Y = 25 
$dataGrid1.Location = $System_Drawing_Point 

 
$form1.Controls.Add($dataGrid1) 
 
#endregion Generated Form Code 
 
#Save the initial state of the form 
$InitialFormWindowState = $form1.WindowState 
 
#Add Form event 
$form1.add_Load($OnLoadForm_UpdateGrid) 
 
#Show the Form 
$form1.ShowDialog()| Out-Null 
 
} #End Function 
 
#Call the Function 
GenerateForm