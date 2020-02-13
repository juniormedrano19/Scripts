[void] [System.Reflection.Assembly]::LoadWithPartialName("System.Drawing") 
[void] [System.Reflection.Assembly]::LoadWithPartialName("System.Windows.Forms")  

$Form = New-Object System.Windows.Forms.Form    
$Form.Size = New-Object System.Drawing.Size(300,300)  
$Form.StartPosition = "CenterScreen" 
$Form.FormBorderStyle = [System.Windows.Forms.FormBorderStyle]::FixedToolWindow 
$Form.Text = "CAMBIOS DE IP" 

$label                           = New-Object system.Windows.Forms.Label
$label.text                      = "¿Qué acción desea realizar?"
$label.AutoSize                  = $true
$label.width                     = 40
$label.height                    = 30
$label.location                  = New-Object System.Drawing.Point(55,30)
$label.Font                      = 'Comic Sans MS,10'
$Form.Controls.Add($label) 

$Sip={
		
        Cambio

	}

$hostname={
	setHostname
	
}	
$shutdownre={
	reiniciar
}
$rango= {
	rangoIp
}


#CAMBIAR UNA IP
function Cambio{

[void] [System.Reflection.Assembly]::LoadWithPartialName("System.Drawing") 
[void] [System.Reflection.Assembly]::LoadWithPartialName("System.Windows.Forms")  

	[System.Windows.Forms.Application]::EnableVisualStyles()
	$Form1 = New-Object 'System.Windows.Forms.Form'
	$label1 = New-Object 'System.Windows.Forms.Label'
    $label2= New-Object 'System.Windows.Forms.Label'
	$textbox1 = New-Object 'System.Windows.Forms.TextBox'
    $textbox2 = New-Object 'System.Windows.Forms.TextBox'
    $outputBox = New-Object 'System.Windows.Forms.TextBox' 
	$button3 = New-Object 'System.Windows.Forms.Button'
	$button4 = New-Object 'System.Windows.Forms.Button'
	$button7 = New-Object 'System.Windows.Forms.Button'
     
     function setIp {
		 $ruta=[Environment]::GetFolderPath("Desktop")
     if (!(Test-Path "$ruta\logs_ip")) {
         New-item -path "$ruta\logs_ip" –type directory
     }

$Username = "Administrador"
$Password = "R3c542016C4ll"

$Computers=$textbox1.text; 
$ipNuevas=$textbox2.text;
    
if(($Computers.length -eq 0) -Or ($ipNuevas.length -eq 0)){
Add-Type -AssemblyName System.Windows.Forms
$errorMsg = "No puede quedar en blanco la dirección ip.
Vuelva a intentarlo nuevamente."
    $caption = "Error de contenido"
    [System.Windows.Forms.MessageBox]::Show($errorMsg, $caption)
}else{
  $cambioIP={
	  Param($Computer,$ipNueva)         
$mask="255.255.255.0"
$Inicial=$ipNueva.Split(".")
$inicio0=$Inicial[0];
$inicio1=$Inicial[1];
$inicio2=$Inicial[2];
$inicio3=$Inicial[3];
$primeraIP=$inicio0+"."+$inicio1+"."+$inicio2+"."+"1" ;
$oreo= get-wmiobject win32_networkadapter | where-object {$_.netconnectionstatus -eq 2}
$clima=get-wmiobject win32_networkadapterconfiguration|where-object {$_.Index -eq $oreo.DeviceID};
$clima.SetGateways($primeraIP);
#Write-Host "Completado";
$clima.SetDNSServerSearchOrder("8.8.8.8");
#Write-Host "Completado MascaraSubred";
$clima.EnableStatic($ipNueva,$mask);
}  
$SecurePassword = ConvertTo-SecureString -AsPlainText $Password -Force
$Cred = New-Object -TypeName "System.Management.Automation.PSCredential" -ArgumentList $Username, $SecurePassword
foreach($Computer in $Computers) { 
foreach($ipNueva in $ipNuevas){
$hora=Get-Date -DisplayHint DateTime
$Session = New-PSSession -ComputerName $Computer -Credential $Cred

#Write-Host " $Computer ..." -ForegroundColor GREEN -Background BLACK

    if($Session -eq $Null){
 #Write-Host "No se puede conectar" -ForegroundColor Blue -Background White
 "No se pudo conectar en $Computer" + " - " + $hora >> "$ruta\logs_ip\log_error.txt"
    $outputBox.text= "No se pudo conectar en $Computer"+ " - " + $hora;   
      
    }
    else{
    $Job = Invoke-Command -Session $Session  -ScriptBlock $cambioIP -ArgumentList ($Computer,$ipNueva) -AsJob 
      $Session1 = New-PSSession -ComputerName $ipNueva -Credential $Cred
     #Write-Host "La nueva ip es: $ipNueva  ..." -ForegroundColor Blue -Background White
	Remove-PSSession -Session $Session1
		 "Inicio exitoso en $ipNueva" + " - " + $hora >>  "$ruta\logs_ip\log_exitoso.txt"
    $outputBox.text= "Inicio exitoso en $ipNueva"

    }
}

    }
	 
	 }
	 }
	 	function reiniciar{
	$Username = "Administrador"
    $Password = "R3c542016C4ll"
	$Computers=$textbox1.text; 
	
$reiniciarPcs={
shutdown -r -t 1
}
$SecurePassword = ConvertTo-SecureString -AsPlainText $Password -Force
$Cred = New-Object -TypeName "System.Management.Automation.PSCredential" -ArgumentList $Username, $SecurePassword
foreach($Computer in $Computers) { 

$Session = New-PSSession -ComputerName $Computer -Credential $Cred
#Write-Host " $Computer ..." -ForegroundColor GREEN -Background BLACK
#Write-Host "$nombre"

 #Invocando comandos
 $Job = Invoke-Command -Session $Session  -ScriptBlock $reiniciarPcs -AsJob 
 $Null = Wait-Job -Job $Job
Remove-PSSession -Session $Session
}
	}
function setHostname{
		[void] [System.Reflection.Assembly]::LoadWithPartialName("System.Drawing") 
[void] [System.Reflection.Assembly]::LoadWithPartialName("System.Windows.Forms")  

	[System.Windows.Forms.Application]::EnableVisualStyles()
	$Form2 = New-Object 'System.Windows.Forms.Form'
	$label3 = New-Object 'System.Windows.Forms.Label'
    $label4 = New-Object 'System.Windows.Forms.Label'
	$textbox3 = New-Object 'System.Windows.Forms.TextBox'
    $textbox4 = New-Object 'System.Windows.Forms.TextBox'
	$button5 = New-Object 'System.Windows.Forms.Button'
	$button6 = New-Object 'System.Windows.Forms.Button'

	######################

	$Username = "Administrador"
    $Password = "R3c542016C4ll"
	$Computers=$textbox1.text; 
	$getName={
		Param($Computer,$ipNueva)

		$equipo= $env:COMPUTERNAME;

		$equipo > C:\equipo.txt
	}

$SecurePassword = ConvertTo-SecureString -AsPlainText $Password -Force
$Cred = New-Object -TypeName "System.Management.Automation.PSCredential" -ArgumentList $Username, $SecurePassword
foreach($Computer in $Computers) { 
$Session = New-PSSession -ComputerName $Computer -Credential $Cred
#Write-Host " $Computer ..." -ForegroundColor GREEN -Background BLACK

 #Invocando comandos
 $Job = Invoke-Command -Session $Session  -ScriptBlock $getName -ArgumentList ($Computer,$ipNueva) -AsJob 
 $Null = Wait-Job -Job $Job
Remove-PSSession -Session $Session

	###################
	$Session1 = New-PSSession -ComputerName $Computer -Credential $Cred 
$a = Invoke-Command -Session $Session1 -ScriptBlock {$env:COMPUTERNAME | Out-String}
$textbox3.text = $a
Get-PSSession | Remove-PSSession




}

function cambioNombre{
$Username = "Administrador"
    $Password = "R3c542016C4ll"
	$Computers=$textbox1.text; 
	$nombres=$textbox4.text

$setNombre={
	Param($Computer,$nombre)


	$datos=Get-WmiObject Win32_ComputerSystem;

    $datos.Rename($nombre);

}
$SecurePassword = ConvertTo-SecureString -AsPlainText $Password -Force
$Cred = New-Object -TypeName "System.Management.Automation.PSCredential" -ArgumentList $Username, $SecurePassword
foreach($Computer in $Computers) { 
foreach($nombre in $nombres){
$Session = New-PSSession -ComputerName $Computer -Credential $Cred
#Write-Host " $Computer ..." -ForegroundColor GREEN -Background BLACK
#Write-Host "$nombre"

 #Invocando comandos
 $Job = Invoke-Command -Session $Session  -ScriptBlock $setNombre -ArgumentList ($Computer,$nombre) -AsJob 
 $Null = Wait-Job -Job $Job
Remove-PSSession -Session $Session
}

}
}
$cancelarButton={
      $Form2.Close()
}
	
	$textbox1_TextChanged={
		
		$button3.Enabled = $false
		if ($textbox1.Text -ne '') {
			$button3.Enabled = $true
		}
	}
    	$textbox2_TextChanged={
		
		$button3.Enabled = $false
		if ($textbox2.Text -ne '') {
			$button3.Enabled = $true
		}
	}

$Form2.Controls.Add($label3)
	$Form2.Controls.Add($textbox3)
    $Form2.Controls.Add($label4)
	$Form2.Controls.Add($textbox4)    
$Form2.Size = New-Object System.Drawing.Size(480,300)  
$Form2.StartPosition = "CenterScreen" #loads the window in the center of the screen
$Form2.FormBorderStyle ='FixedDialog' #modifies the window border
$Form2.Text = "CAMBIO DE HOSTNAME" #window description
	$Form2.MaximizeBox = $False
	$Form2.MinimizeBox = $False
	
    ##########################################
$label3.text                      = "HOSTNAME:"
$label3.AutoSize                  = $true
$label3.width                     = 40
$label3.height                    = 30
$label3.location                  = New-Object System.Drawing.Point(12,9)
$label3.Font                      = 'Comic Sans MS,10'

##########################################
$label4.text                      = "¿Qué HOSTNAME deseas colocar:?"
$label4.AutoSize                  = $true
$label4.width                     = 40
$label4.height                    = 30
$label4.location                  = New-Object System.Drawing.Point(12,88)
$label4.Font                      = 'Comic Sans MS,10'

########################################


	$textbox3.Font = 'Segoe UI, 12pt'
	$textbox3.Location = '10, 35'
	$textbox3.Margin = '5, 5, 5, 5'
	$textbox3.Multiline = $True
	$textbox3.Name = 'textbox1'
	$textbox3.Size = '300, 30'
	$textbox3.Enabled = $false
	$textbox3.TabIndex = 1
	$textbox3.add_TextChanged($textbox1_TextChanged)

    ###########################################
    $textbox4.Font = 'Segoe UI, 12pt'
	$textbox4.Location = '10, 115'
	$textbox4.Margin = '5, 5, 5, 5'
	$textbox4.Multiline = $True
	$textbox4.Name = 'textbox2'
	$textbox4.Size = '300, 30'
	$textbox4.TabIndex = 1
	$textbox4.add_TextChanged($textbox2_TextChanged)

    ###########################################
$button5.Location = New-Object System.Drawing.Size(350,190) 
$button5.Size = New-Object System.Drawing.Size(98,33) 
$button5.Text = "OK" 
$button5.UseVisualStyleBackColor = $True
$button5.BackColor = [System.Drawing.Color]::LightBlue
$button5.Add_Click({cambioNombre}) 
$Form2.Controls.Add($button5)	

##########################################
$button6.Location = New-Object System.Drawing.Size(350,110) 
$button6.Size = New-Object System.Drawing.Size(98,33) 
$button6.Text = "CANCELAR" 
$button6.UseVisualStyleBackColor = $True
$button6.BackColor = [System.Drawing.Color]::LightBlue
$button6.DialogResult= "Cancel"
$button6.Add_Click($cancelarButton) 
$Form2.Controls.Add($button6)	
########################################

return $Form2.ShowDialog();

   

	}

	
$textbox1_TextChanged={
		
		$button3.Enabled = $false
		if ($textbox1.Text -ne '') {
			$button3.Enabled = $true
		}
	}
    	$textbox2_TextChanged={
		
		$button3.Enabled = $false
		if ($textbox2.Text -ne '') {
			$button3.Enabled = $true
		}
	}

$Form1.Controls.Add($label1)
	$Form1.Controls.Add($textbox1)
    $Form1.Controls.Add($label2)
	$Form1.Controls.Add($textbox2)
      
	
	
	#$Form1.AcceptButton = $button3
     
$Form1.Size = New-Object System.Drawing.Size(480,300)  
$Form1.StartPosition = "CenterScreen" #loads the window in the center of the screen
$Form1.FormBorderStyle ='FixedDialog' #modifies the window border
$Form1.Text = "CAMBIO DE UNA IP" #window description
	$Form1.MaximizeBox = $False
	$Form1.MinimizeBox = $False

    ##########################################
$label1.text                      = "DIRECCION IP:"
$label1.AutoSize                  = $true
$label1.width                     = 40
$label1.height                    = 30
$label1.location                  = New-Object System.Drawing.Point(12,9)
$label1.Font                      = 'Comic Sans MS,10'

##########################################
$label2.text                      = "¿Qué ip deseas colocar:?"
$label2.AutoSize                  = $true
$label2.width                     = 40
$label2.height                    = 30
$label2.location                  = New-Object System.Drawing.Point(12,88)
$label2.Font                      = 'Comic Sans MS,10'

########################################


###########################################

	$textbox1.Font = 'Segoe UI, 12pt'
	$textbox1.Location = '10, 35'
	$textbox1.Margin = '5, 5, 5, 5'
	$textbox1.Multiline = $True
	$textbox1.Name = 'textbox1'
	$textbox1.Size = '300, 30'
	$textbox1.TabIndex = 1
	$textbox1.add_TextChanged($textbox1_TextChanged)

    ###########################################
    $textbox2.Font = 'Segoe UI, 12pt'
	$textbox2.Location = '10, 115'
	$textbox2.Margin = '5, 5, 5, 5'
	$textbox2.Multiline = $True
	$textbox2.Name = 'textbox2'
	$textbox2.Size = '300, 30'
	$textbox2.TabIndex = 1
	$textbox2.add_TextChanged($textbox2_TextChanged)

    ###########################################

$outputBox.Location = New-Object System.Drawing.Size(10,180) 
$outputBox.Size = New-Object System.Drawing.Size(300,50) 
$outputBox.MultiLine = $True 
$outputBox.Enabled=$false
$outputBox.ScrollBars = "Vertical" 
$Form1.Controls.Add($outputBox)

    ##########################################

$button3.Location = New-Object System.Drawing.Size(350,190) 
$button3.Size = New-Object System.Drawing.Size(98,33) 
$button3.Text = "CAMBIAR IP" 
$button3.UseVisualStyleBackColor = $True
$button3.BackColor = [System.Drawing.Color]::LightBlue
$button3.Add_Click({setIp})

$Form1.Controls.Add($button3)	

##########################################
$button4.Location = New-Object System.Drawing.Size(350,110) 
$button4.Size = New-Object System.Drawing.Size(98,33) 
$button4.Text = "CAMBIAR NOMBRE" 
$button4.UseVisualStyleBackColor = $True
$button4.BackColor = [System.Drawing.Color]::LightBlue
$button4.Add_Click($hostname) 
$Form1.Controls.Add($button4)	
########################################

$button7.Location = New-Object System.Drawing.Size(350,30) 
$button7.Size = New-Object System.Drawing.Size(98,33) 
$button7.Text = "REINICIAR" 
$button7.UseVisualStyleBackColor = $True
$button7.BackColor = [System.Drawing.Color]::LightBlue
$button7.Add_Click($shutdownre) 
$Form1.Controls.Add($button7)	
########################################

return $Form1.ShowDialog();

   



}
function rangoIp{
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
	$outputBox1 = New-Object 'System.Windows.Forms.TextBox' 
	$button10 = New-Object 'System.Windows.Forms.Button'
	$button8 = New-Object 'System.Windows.Forms.Button'
	$button9 = New-Object 'System.Windows.Forms.Button'

	######################
	function cambiarRango{
        $ruta=[Environment]::GetFolderPath("Desktop")
if (!(Test-Path "$ruta\logs_rangoip")) {
          New-item -path "$ruta\logs_rangoip" –type directory
     }
$Username = "Administrador"
$Password = "R3c542016C4ll"


$ipInicio=$textbox5.text
$ipFinal=$textbox7.text;
$Inicial=$ipInicio.Split(".")
$inicio0=$Inicial[0];
$inicio1=$Inicial[1];
$inicio2=$Inicial[2];
[int]$inicio3=$Inicial[3];
$primeraIP=$inicio0+"."+$inicio1+"."+$inicio2+"." ;

$Final=$ipFinal.Split(".")
$ultima0=$Final[0];
$ultima1=$Final[1];
$ultima2=$Final[2];
[int]$ultima3=$Final[3];
$diferencia=($Final[3] - $Inicial[3])
$numeroDeTerminos= ($Final[3] - $Inicial[3] +1);
#$mensaje="Se realizará el cambio en $diferencia ips";
$textbox9.text ="Se efectuará el cambio en "+ $numeroDeTerminos + " ips "

$ipNuevaInicial=$textbox6.text; 
$InicialNueva=$ipNuevaInicial.Split(".")
$inicioNueva0=$InicialNueva[0];
$inicioNueva1=$InicialNueva[1];
$inicioNueva2=$InicialNueva[2];
[int]$inicioNueva3=$InicialNueva[3];
$primeraIpNueva=$inicioNueva0+"."+$inicioNueva1+"."+$inicioNueva2+"." ;

$ultimoTerminoNuevo=$inicioNueva3+$diferencia

$ultimaIpNueva=$inicioNueva0+"."+$inicioNueva1+"."+$inicioNueva2+"."+$ultimoTerminoNuevo ;
$textbox8.text=$ultimaIpNueva
$FinalNueva=$ultimaIpNueva.Split(".")
$ultimaNueva0=$FinalNueva[0];
$ultimaNueva1=$FinalNueva[1];
$ultimaNueva2=$FinalNueva[2];
[int]$ultimaNueva3=$FinalNueva[3];


$mundo=for($inicio3;$inicio3 -le $ultima3;$inicio3++){
    $Computer=$primeraIP+$inicio3;

    echo $Computer;}
$universo=for($inicioNueva3;$inicioNueva3 -le $ultimaNueva3;$inicioNueva3++){
    $Computers=$primeraIPNueva+$inicioNueva3;

    echo $Computers;}
for($i=0;$i -le $diferencia;$i++){
	#Write-Host "$mundo[$i]" -ForegroundColor GREEN -Background BLACK
	#Write-Host "$universo[$i]" -ForegroundColor WHITE -Background BLACK
    #echo $mundo[$i];
    #echo $universo[$i];
	
$ipAntiguaInicials=$mundo[$i];
$ipNewInicials=$universo[$i]

 $cambiandoIP={
	  Param($ipAntiguaInicial,$ipNewInicial)         
$mask="255.255.255.0"
$Initial=$ipNewInicial.Split(".")
$start0=$Initial[0];
$start1=$Initial[1];
$start2=$Initial[2];
$start3=$Initial[3];
$firstIP=$start0+"."+$start1+"."+$start2+"."+"1" ;
$oreo= get-wmiobject win32_networkadapter | where-object {$_.netconnectionstatus -eq 2}
$clima=get-wmiobject win32_networkadapterconfiguration|where-object {$_.Index -eq $oreo.DeviceID};
$clima.SetGateways($firstIP);
#Write-Host "Completado";
$clima.SetDNSServerSearchOrder("8.8.8.8");
#Write-Host "Completado MascaraSubred";
$clima.EnableStatic($ipNewInicial,$mask);
}  
$SecurePassword = ConvertTo-SecureString -AsPlainText $Password -Force
$Cred = New-Object -TypeName "System.Management.Automation.PSCredential" -ArgumentList $Username, $SecurePassword
foreach($ipAntiguaInicial in $ipAntiguaInicials) { 
foreach($ipNewInicial in $ipNewInicials){
$hora=Get-Date -DisplayHint DateTime
$Session = New-PSSession -ComputerName $ipAntiguaInicial -Credential $Cred

#Write-Host " $ipAntiguaInicial ..." -ForegroundColor GREEN -Background BLACK

    if($Session -eq $Null){
 #Write-Host "No se puede conectar" -ForegroundColor Blue -Background White
 "No se pudo conectar en $ipAntiguaInicial" + " - " + $hora >> "$ruta\logs_rangoip\log_error.txt"
   # $outputBox1.text= "No se pudo conectar en $ipAntiguaInicial"+ " - " + $hora;   
   $Message="No se pudo conectar en $ipAntiguaInicial"+ " - " + $hora;   
     $outputBox1.AppendText("`r`n$Message");
        $outputBox1.Refresh()
    $outputBox1.ScrollToCaret()
    }
    else{
    $Job = Invoke-Command -Session $Session  -ScriptBlock $cambiandoIP -ArgumentList ($ipAntiguaInicial,$ipNewInicial) -AsJob 
      $Session1 = New-PSSession -ComputerName $ipNewInicial -Credential $Cred
    # Write-Host "La nueva ip es: $ipNewInicial  ..." -ForegroundColor Blue -Background White
	Remove-PSSession -Session $Session1
		 "Inicio exitoso en $ipNewInicial" + " - " + $hora >>  "$ruta\logs_rangoip\log_exitoso.txt"
    #$outputBox1.text= "Inicio exitoso en $ipNewInicial"
 $Message="Inicio exitoso en $ipNewInicial";   
     $outputBox1.AppendText("`r`n$Message");
        $outputBox1.Refresh()
    $outputBox1.ScrollToCaret()
    }
}

    }

  
}

	}
function limpiarDatos{
$textbox5.Text="";
$textbox6.Text="";
$textbox7.Text="";
$textbox8.Text="";
$textbox9.Text="";
$outputBox1.Text="";
}

		$cancelarButton1={
      $Form3.Close()
}
	
	$textbox5_TextChanged={
		
		$button10.Enabled = $false
		if ($textbox5.Text -ne '') {
			$button10.Enabled = $true
		}
			$button8.Enabled = $false
		if ($textbox5.Text -ne '') {
			$button8.Enabled = $true
		}
			$button9.Enabled = $false
		if ($textbox5.Text -ne '') {
			$button9.Enabled = $true
		}
	
	}
    	$textbox6_TextChanged={
		
		$button10.Enabled = $false
		if ($textbox6.Text -ne '') {
			$button10.Enabled = $true
		}
		$button8.Enabled = $false
		if ($textbox6.Text -ne '') {
			$button8.Enabled = $true
		}
			$button9.Enabled = $false
		if ($textbox6.Text -ne '') {
			$button9.Enabled = $true
		}
	}
		
	$textbox7_TextChanged={
		
		$button10.Enabled = $false
		if ($textbox7.Text -ne '') {
			$button10.Enabled = $true
		}
		$button8.Enabled = $false
		if ($textbox57.Text -ne '') {
			$button8.Enabled = $true
		}
			$button9.Enabled = $false
		if ($textbox7.Text -ne '') {
			$button9.Enabled = $true
		}
	}
    	$textbox8_TextChanged={
		
		$button10.Enabled = $false
		if ($textbox8.Text -ne '') {
			$button10.Enabled = $true
		}
		$button8.Enabled = $false
		if ($textbox8.Text -ne '') {
			$button8.Enabled = $true
		}
			$button9.Enabled = $false
		if ($textbox8.Text -ne '') {
			$button9.Enabled = $true
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
$label8.text                      = "NUEVA IP FINAL"
$label8.AutoSize                  = $true
$label8.width                     = 40
$label8.height                    = 30
$label8.location                  = New-Object System.Drawing.Point(340,180)
$label8.Font                      = 'Comic Sans MS,10'
##########################################
$label9.text                      = "¿Cuál será el nuevo rango de ips?"
$label9.AutoSize                  = $true
$label9.width                     = 40
$label9.height                    = 30
$label9.location                  = New-Object System.Drawing.Point(125,145)
$label9.Font                      = 'Segoe UI,14'



###########################################
#ip inicial
	$textbox5.Font = 'Segoe UI, 12pt'
	$textbox5.Location = '9, 35'
	$textbox5.Margin = '5, 5, 5, 5'
	$textbox5.Multiline = $True
	$textbox5.Name = 'textbox5'
	$textbox5.Size = '200, 30'
	$textbox5.TabIndex = 1
	$textbox5.add_TextChanged($textbox5_TextChanged)

    ###########################################

#ip final
    $textbox6.Font = 'Segoe UI, 12pt'
	$textbox6.Location = '9, 210'
	$textbox6.Margin = '5, 5, 5, 5'
	$textbox6.Multiline = $True
	$textbox6.Name = 'textbox6'
	$textbox6.Size = '200, 30'
	$textbox6.TabIndex = 1
	$textbox6.add_TextChanged($textbox6_TextChanged)

    ###########################################
	#ip actual inicial
	$textbox7.Font = 'Segoe UI, 12pt'
	$textbox7.Location = '300, 35'
	$textbox7.Margin = '5, 5, 5, 5'
	$textbox7.Multiline = $True
	$textbox7.Name = 'textbox7'
	$textbox7.Size = '200, 30'
	$textbox7.TabIndex = 1
	$textbox7.add_TextChanged($textbox7_TextChanged)

    ###########################################
	#ip actual final
    $textbox8.Font = 'Segoe UI, 12pt'
	$textbox8.Location = '300,210'
	$textbox8.Margin = '5, 5, 5, 5'
	$textbox8.Multiline = $True
	$textbox8.Name = 'textbox8'
	$textbox8.Size = '200, 30'
	$textbox8.Enabled=$false
	$textbox8.TabIndex = 1
	$textbox8.add_TextChanged($textbox8_TextChanged)
      ###########################################
    $textbox9.Font = 'Segoe UI, 12pt'
	$textbox9.Location = '9,100'
	$textbox9.Margin = '5, 5, 5, 5'
	$textbox9.Multiline = $True
	$textbox9.Name = 'textbox9'
	$textbox9.Size = '500, 40'
	$textbox9.TextAlign = 'Center'
	$textbox9.TabIndex = 1
    $textbox9.Enabled=$false
	$textbox9.ReadOnly=$true
	##############################################
	$outputBox1.Location = New-Object System.Drawing.Size(10,280) 
$outputBox1.Size = New-Object System.Drawing.Size(650,70) 
$outputBox1.MultiLine = $True 
$outputBox1.ReadOnly=$true
#$outputBox1.Enabled=$false
$outputBox1.ScrollBars = "Vertical" 
$Form3.Controls.Add($outputBox1)



$button10.Location = New-Object System.Drawing.Size(550,30) 
$button10.Size = New-Object System.Drawing.Size(98,33) 
$button10.Text = "CANCELAR" 
$button10.UseVisualStyleBackColor = $True
$button10.BackColor = [System.Drawing.Color]::LightBlue
$button10.DialogResult= "Cancel"
$button10.Add_Click($cancelarButton1) 
$Form3.Controls.Add($button10)	

    ##########################################
$button8.Location = New-Object System.Drawing.Size(550,120) 
$button8.Size = New-Object System.Drawing.Size(98,33) 
$button8.Text = "CAMBIAR" 
$button8.UseVisualStyleBackColor = $True
$button8.BackColor = [System.Drawing.Color]::LightBlue
$button8.Add_Click({cambiarRango}) 
$Form3.Controls.Add($button8)	

##########################################
$button9.Location = New-Object System.Drawing.Size(550,210) 
$button9.Size = New-Object System.Drawing.Size(98,33) 
$button9.Text = "LIMPIAR DATOS" 
$button9.UseVisualStyleBackColor = $True
$button9.BackColor = [System.Drawing.Color]::LightBlue
$button9.Add_Click({limpiarDatos}) 
$Form3.Controls.Add($button9)	
########################################

return $Form3.ShowDialog();

	}

$Button = New-Object System.Windows.Forms.Button 
$Button.Location = New-Object System.Drawing.Size(62,60) 
$Button.Size = New-Object System.Drawing.Size(150,50) 
$Button.Text = "CAMBIAR RANGO DE IP" 
$Button.Add_Click($rango) 
$Form.Controls.Add($Button) 
$Button.Cursor = [System.Windows.Forms.Cursors]::Hand
$Button.BackColor = [System.Drawing.Color]::LightBlue

$Button = New-Object System.Windows.Forms.Button 
$Button.Location = New-Object System.Drawing.Size(62,130) 
$Button.Size = New-Object System.Drawing.Size(150,50) 
$Button.Text = "CAMBIAR SOLO UNA IP" 
$Button.Add_Click($Sip) 
$Form.Controls.Add($Button) 
$Button.Cursor = [System.Windows.Forms.Cursors]::Hand
$Button.BackColor = [System.Drawing.Color]::LightBlue

###########################################################


############################################## end buttons

$Form.Add_Shown({$Form.Activate()})
[void] $Form.ShowDialog();