	[void] [System.Reflection.Assembly]::LoadWithPartialName("System.Drawing") 
[void] [System.Reflection.Assembly]::LoadWithPartialName("System.Windows.Forms")  

	[System.Windows.Forms.Application]::EnableVisualStyles()
	$Form3 = New-Object 'System.Windows.Forms.Form'
	$label5 = New-Object 'System.Windows.Forms.Label'
    $label6 = New-Object 'System.Windows.Forms.Label'
	$label7 = New-Object 'System.Windows.Forms.Label'
	$label8 = New-Object 'System.Windows.Forms.Label'
    $label9 = New-Object 'System.Windows.Forms.Label'
	$textbox5 = New-Object 'System.Windows.Forms.TextBox'
    $textbox6 = New-Object 'System.Windows.Forms.TextBox'
	$textbox7 = New-Object 'System.Windows.Forms.TextBox'
    $textbox8 = New-Object 'System.Windows.Forms.TextBox'
    $textbox9 = New-Object 'System.Windows.Forms.TextBox'
	$button10 = New-Object 'System.Windows.Forms.Button'
	$button8 = New-Object 'System.Windows.Forms.Button'
	$button9 = New-Object 'System.Windows.Forms.Button'

	######################
		$cancelarButton1={
      $Form3.Close()
}
	
	$textbox5_TextChanged={
		
		$button10.Enabled = $false
		if ($textbox5.Text -ne '') {
			$button10.Enabled = $true
		}
	}
    	$textbox6_TextChanged={
		
		$button10.Enabled = $false
		if ($textbox6.Text -ne '') {
			$button10.Enabled = $true
		}
	}
		
	$textbox7_TextChanged={
		
		$button10.Enabled = $false
		if ($textbox7.Text -ne '') {
			$button10.Enabled = $true
		}
	}
    	$textbox8_TextChanged={
		
		$button10.Enabled = $false
		if ($textbox8.Text -ne '') {
			$button10.Enabled = $true
		}
	}

$Form3.Controls.Add($label5)
$Form3.Controls.Add($label6)
$Form3.Controls.Add($label7)
$Form3.Controls.Add($label8)
$Form3.Controls.Add($label9)
$Form3.Controls.Add($textbox5)
$Form3.Controls.Add($textbox6)
$Form3.Controls.Add($textbox7)
$Form3.Controls.Add($textbox8)
$Form3.Controls.Add($textbox9)
	
	
	#$Form1.AcceptButton = $button3
     
$Form3.Size = New-Object System.Drawing.Size(700,450)  
$Form3.StartPosition = "CenterScreen" #loads the window in the center of the screen
$Form3.FormBorderStyle ='FixedDialog' #modifies the window border
$Form3.Text = "CAMBIO DE RANGO DE IP" #window description
	$Form3.MaximizeBox = $False
	$Form3.MinimizeBox = $False

    ##########################################
$label5.text                      = "IP INICIAL"
$label5.AutoSize                  = $true
$label5.width                     = 40
$label5.height                    = 30
$label5.location                  = New-Object System.Drawing.Point(70,9)
$label5.Font                      = 'Comic Sans MS,10'

##########################################
$label6.text                      = "IP FINAL"
$label6.AutoSize                  = $true
$label6.width                     = 40
$label6.height                    = 30
$label6.location                  = New-Object System.Drawing.Point(350,9)
$label6.Font                      = 'Comic Sans MS,10'
   ##########################################
$label7.text                      = "NUEVA IP INICIAL"
$label7.AutoSize                  = $true
$label7.width                     = 40
$label7.height                    = 30
$label7.location                  = New-Object System.Drawing.Point(50,180)
$label7.Font                      = 'Comic Sans MS,10'

##########################################
$label8.text                      = "NUEVA IP ACTUAL"
$label8.AutoSize                  = $true
$label8.width                     = 40
$label8.height                    = 30
$label8.location                  = New-Object System.Drawing.Point(320,180)
$label8.Font                      = 'Comic Sans MS,10'
##########################################
$label9.text                      = "¿Cuál será el nuevo rango de ips?"
$label9.AutoSize                  = $true
$label9.width                     = 40
$label9.height                    = 30
$label9.location                  = New-Object System.Drawing.Point(125,145)
$label9.Font                      = 'Segoe UI,14'



###########################################

	$textbox5.Font = 'Segoe UI, 12pt'
	$textbox5.Location = '9, 35'
	$textbox5.Margin = '5, 5, 5, 5'
	$textbox5.Multiline = $True
	$textbox5.Name = 'textbox5'
	$textbox5.Size = '200, 30'
	$textbox5.TabIndex = 1
	$textbox5.add_TextChanged($textbox5_TextChanged)

    ###########################################
    $textbox6.Font = 'Segoe UI, 12pt'
	$textbox6.Location = '9, 210'
	$textbox6.Margin = '5, 5, 5, 5'
	$textbox6.Multiline = $True
	$textbox6.Name = 'textbox6'
	$textbox6.Size = '200, 30'
	$textbox6.TabIndex = 1
	$textbox6.add_TextChanged($textbox6_TextChanged)

    ###########################################
	$textbox7.Font = 'Segoe UI, 12pt'
	$textbox7.Location = '280, 35'
	$textbox7.Margin = '5, 5, 5, 5'
	$textbox7.Multiline = $True
	$textbox7.Name = 'textbox7'
	$textbox7.Size = '200, 30'
	$textbox7.TabIndex = 1
	$textbox7.add_TextChanged($textbox7_TextChanged)

    ###########################################
    $textbox8.Font = 'Segoe UI, 12pt'
	$textbox8.Location = '280,210'
	$textbox8.Margin = '5, 5, 5, 5'
	$textbox8.Multiline = $True
	$textbox8.Name = 'textbox8'
	$textbox8.Size = '200, 30'
	$textbox8.TabIndex = 1
	$textbox8.add_TextChanged($textbox8_TextChanged)
      ###########################################
    $textbox9.Font = 'Segoe UI, 12pt'
	$textbox9.Location = '9,100'
	$textbox9.Margin = '5, 5, 5, 5'
	$textbox9.Multiline = $True
	$textbox9.Name = 'textbox9'
	$textbox9.Size = '500, 40'
	$textbox9.TabIndex = 1
    $textbox9.Enabled=$false



$button10.Location = New-Object System.Drawing.Size(550,30) 
$button10.Size = New-Object System.Drawing.Size(98,33) 
$button10.Text = "CANCELAR" 
$button10.UseVisualStyleBackColor = $True
$button10.BackColor = [System.Drawing.Color]::LightBlue
$button9.DialogResult= "Cancel"
$button10.Add_Click($cancelarButton1) 
$Form3.Controls.Add($button10)	

    ##########################################
$button8.Location = New-Object System.Drawing.Size(550,120) 
$button8.Size = New-Object System.Drawing.Size(98,33) 
$button8.Text = "CAMBIAR" 
$button8.UseVisualStyleBackColor = $True
$button8.BackColor = [System.Drawing.Color]::LightBlue
$button8.Add_Click({cambioNombre}) 
$Form3.Controls.Add($button8)	

##########################################
$button9.Location = New-Object System.Drawing.Size(550,210) 
$button9.Size = New-Object System.Drawing.Size(98,33) 
$button9.Text = "LIMPIAR DATOS" 
$button9.UseVisualStyleBackColor = $True
$button9.BackColor = [System.Drawing.Color]::LightBlue
$button9.Add_Click($cancelarButton1) 
$Form3.Controls.Add($button9)	
########################################

return $Form3.ShowDialog();