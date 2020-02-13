[void] [System.Reflection.Assembly]::LoadWithPartialName("System.Drawing") 
[void] [System.Reflection.Assembly]::LoadWithPartialName("System.Windows.Forms")  
[System.Windows.Forms.Application]::EnableVisualStyles()

$Button1 = New-Object 'System.Windows.Forms.Button'
$comboBox2 = New-Object 'system.Windows.Forms.ComboBox'
$comboBox3 = New-Object 'system.Windows.Forms.ComboBox'
$Button4 = New-Object 'System.Windows.Forms.Button'
###########################################
function rutasPredeterminadas{
   
    [void] [System.Reflection.Assembly]::LoadWithPartialName("System.Drawing") 
    [void] [System.Reflection.Assembly]::LoadWithPartialName("System.Windows.Forms")  
    [System.Windows.Forms.Application]::EnableVisualStyles()
    $Form1 = New-Object System.Windows.Forms.Form 
    $Form1.Size = New-Object System.Drawing.Size(1100,750)  
    $Form1.StartPosition = "CenterScreen" 
    $Form1.FormBorderStyle = [System.Windows.Forms.FormBorderStyle]::Sizable
    $Form1.MaximizeBox = $false
    $Form1.Text = "FORMULARIO DE RED" 
$Form1.Add_Shown({$Form1.Activate()})
[void] $Form1.ShowDialog();
}
###########################################
function deshabilitarRutas{
    [void] [System.Reflection.Assembly]::LoadWithPartialName("System.Drawing") 
    [void] [System.Reflection.Assembly]::LoadWithPartialName("System.Windows.Forms")  
    [System.Windows.Forms.Application]::EnableVisualStyles()
    $Form1 = New-Object System.Windows.Forms.Form 
    $Form1.Size = New-Object System.Drawing.Size(1100,750)  
    $Form1.StartPosition = "CenterScreen" 
    $Form1.FormBorderStyle = [System.Windows.Forms.FormBorderStyle]::Sizable
    $Form1.MaximizeBox = $false
    $Form1.Text = "FORMULARIO DE RED" 
$Form1.Add_Shown({$Form1.Activate()})
[void] $Form1.ShowDialog();
}

###########################################
function selectionIndex{
if($comboBox2.SelectedItem.ToString() -eq 'HABILITAR PROXY'){
    $Form.Controls.Add($comboBox3)
    $Form.Controls.Add($Button1)
}
elseif ($comboBox2.SelectedItem.ToString() -eq 'DESHABILITAR PROXY') {
    $Form.Controls.Remove($comboBox3)
    $Form.Controls.Add($Button1)	
}

}



$Form = New-Object System.Windows.Forms.Form 




$Form.Size = New-Object System.Drawing.Size(1100,750)  
$Form.StartPosition = "CenterScreen" 
$Form.FormBorderStyle = [System.Windows.Forms.FormBorderStyle]::Sizable
$Form.MaximizeBox = $false
$Form.Text = "FORMULARIO DE RED" 


$datos = @('HABILITAR PROXY', 'DESHABILITAR PROXY')
$comboBox2.Font = 'Segoe UI, 12pt'
$comboBox2.Location = New-Object System.Drawing.Point(20,40)
$comboBox2.Size = New-Object System.Drawing.Size(200, 40)
$comboBox2.Items.Clear();



foreach($computer1 in $datos)
{
  
  $comboBox2.Items.add($computer1)
 

  $comboBox2.Text="";
  

}

$comboBox2.add_SelectedIndexChanged({selectionIndex})

$Form.Controls.Add($comboBox2)
$datos1 = @('Predeterminado', 'Personalizado')
$comboBox3.Font = 'Segoe UI, 12pt'
$comboBox3.Location = New-Object System.Drawing.Point(300,40)
$comboBox3.Size = New-Object System.Drawing.Size(200, 40)



foreach($computer2 in $datos1)
{
  
  $comboBox3.Items.add($computer2)
   
}



##########################################
$Button1.Location = New-Object System.Drawing.Size(520,40) 
$Button1.Size = New-Object System.Drawing.Size(150,50) 
$Button1.Text = "RUTAS PREDETERMINADAS" 
$Button1.UseVisualStyleBackColor = $True
$Button1.BackColor = [System.Drawing.Color]::LightBlue
$Button1.Add_Click({rutasPredeterminadas}) 



$Form.Add_Shown({$Form.Activate()})
[void] $Form.ShowDialog();