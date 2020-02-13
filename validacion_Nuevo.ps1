if($comboBox1.SelectedItem -eq 'RANGO DE IPS')
{


[void] [System.Reflection.Assembly]::LoadWithPartialName("System.Drawing") 
    [void] [System.Reflection.Assembly]::LoadWithPartialName("System.Windows.Forms")  
    ############### CREACION DEL ELEMENTO ############
    $Form1 = New-Object System.Windows.Forms.Form 
    
   
    $Button10 = New-Object 'System.Windows.Forms.Button'
    $textbox19 = New-Object 'System.Windows.Forms.TextBox'
    $textbox20 = New-Object 'System.Windows.Forms.TextBox'
    $Button11 = New-Object 'System.Windows.Forms.Button'
    $label11  = New-Object 'system.Windows.Forms.Label'
    $label12 = New-Object 'system.Windows.Forms.Label'
    $label13= New-Object 'system.Windows.Forms.Label'
    $label14= New-Object 'system.Windows.Forms.Label'
    $label15= New-Object 'system.Windows.Forms.Label'

#Etiqueta de Ruta de Ubicación


$label11.text                      = "Servidor Proxy"
$label11.AutoSize                  = $true
$label11.width                     = 40
$label11.height                    = 30
$label11.location                  = New-Object System.Drawing.Point(55,25)
$label11.Font                      = 'Comic Sans MS,10'
$Form1.Controls.Add($label11) 


$label12.text                      = "Excepción 1:"
$label12.AutoSize                  = $true
$label12.width                     = 40
$label12.height                    = 30
$label12.location                  = New-Object System.Drawing.Point(55,80)
$label12.Font                      = 'Comic Sans MS,10'
$Form1.Controls.Add($label12) 


$label13.text                      = "Excepción 2:"
$label13.AutoSize                  = $true
$label13.width                     = 40
$label13.height                    = 30
$label13.location                  = New-Object System.Drawing.Point(55,130)
$label13.Font                      = 'Comic Sans MS,10'
$Form1.Controls.Add($label13) 

$label14.text                      = "Excepción 3:"
$label14.AutoSize                  = $true
$label14.width                     = 40
$label14.height                    = 30
$label14.location                  = New-Object System.Drawing.Point(55,180)
$label14.Font                      = 'Comic Sans MS,10'
$Form1.Controls.Add($label14) 

$label15.text                      = "Excepción 4:"
$label15.AutoSize                  = $true
$label15.width                     = 40
$label15.height                    = 30
$label15.location                  = New-Object System.Drawing.Point(55,230)
$label15.Font                      = 'Comic Sans MS,10'
$Form1.Controls.Add($label15) 


    ############TextBox Ruta de Ubicación
	$textbox11.Font = 'Comic Sans MS,10'
	$textbox11.Location = '200,25'
	$textbox11.Margin = '5, 5, 5, 5'
	$textbox11.Multiline = $True
	$textbox11.Name = 'textbox5'
	$textbox11.Size = '300, 30'
    $textbox11.TabIndex = 1
    $textbox11.Enabled=$false
	$textbox11.add_TextChanged($textbox1_TextChanged)
    $Computer1=$textbox2.Text.Trim(); 
    $Computer2=$textbox3.Text.Trim(); 

    $Form1.Controls.Add($textbox11)
    $peru =  $Computer1
    $arreglo = $peru.Split(".");

if($arreglo[2] -eq '60'){
        $array = $arreglo[0] + "." + $arreglo[1] + "." + $arreglo[2] + "." + "102"+":3128"
        $textbox11.Text = $array
}
elseif ($arreglo[2] -eq '61' -or $arreglo[2] -eq '62' -or $arreglo[2] -eq '63' -or $arreglo[2] -eq '64' -or $arreglo[2] -eq '65' ) {
    $array = $arreglo[0] + "." + $arreglo[1] + "." + $arreglo[2] + "." + "7"+":3128"
    $textbox11.Text = $array  
}else{

    $textbox11.Text = " "
}


    $Form1.Size = New-Object System.Drawing.Size(1100,750)  
    $Form1.StartPosition = "CenterScreen" 
    $Form1.FormBorderStyle = [System.Windows.Forms.FormBorderStyle]::Sizable
    $Form1.MaximizeBox = $false
    $Form1.Text = "FORMULARIO DE RED" 
    

    $textbox12.Font = 'Comic Sans MS,10'
    $textbox12.Location = '200,80'
    $textbox12.Margin = '5, 5, 5, 5'
    $textbox12.Multiline = $True
    $textbox12.Name = 'textbox5'
    $textbox12.Size = '300, 30'
    $textbox12.TabIndex = 1
    $textbox12.Enabled = $false
    $textbox12.add_TextChanged($textbox1_TextChanged)
    $Form1.Controls.Add($textbox12)


    $textbox13.Font = 'Comic Sans MS,10'
    $textbox13.Location = '200,130'
    $textbox13.Margin = '5, 5, 5, 5'
    $textbox13.Multiline = $True
    $textbox13.Name = 'textbox5'
    $textbox13.Size = '300, 30'
    $textbox13.TabIndex = 1
    $textbox13.Enabled = $false
    $textbox13.add_TextChanged($textbox1_TextChanged)
    $Form1.Controls.Add($textbox13)

    $textbox14.Font = 'Comic Sans MS,10'
    $textbox14.Location = '200,180'
    $textbox14.Margin = '5, 5, 5, 5'
    $textbox14.Multiline = $True
    $textbox14.Name = 'textbox5'
    $textbox14.Size = '300, 30'
    $textbox14.TabIndex = 1
    $textbox14.Enabled = $false
    $textbox14.add_TextChanged($textbox1_TextChanged)
    $Form1.Controls.Add($textbox14)

    $textbox15.Font = 'Comic Sans MS,10'
    $textbox15.Location = '200,230'
    $textbox15.Margin = '5, 5, 5, 5'
    $textbox15.Multiline = $True
    $textbox15.Name = 'textbox5'
    $textbox15.Size = '300, 30'
    $textbox15.TabIndex = 1
    $textbox15.Enabled = $false
    $textbox15.add_TextChanged($textbox1_TextChanged)
    $Form1.Controls.Add($textbox15)
if($arreglo[2] -eq '60' -or $arreglo[2] -eq '61' -or $arreglo[2] -eq '62' -or $arreglo[2] -eq '63' -or $arreglo[2] -eq '64' -or $arreglo[2] -eq '65' ){
    $textbox12.Text = "192.9.100.*"
    $textbox13.Text = "10.10.10.*"
    $array = $arreglo[0] + "." + $arreglo[1] + "." + $arreglo[2] + "." + "*"
    $textbox14.Text = $array
    $textbox15.Text = "<local>"
}
else{
    $textbox12.Text = " "
    $textbox13.Text = " "

    $textbox14.Text = " "
    $textbox15.Text = " "
}

  

  
      $Form1.Controls.Add($Button10)
    $Button10.Location = New-Object System.Drawing.Size(520,600) 
    $Button10.Size = New-Object System.Drawing.Size(150, 50) 
    $Button10.Text = "RUTAS PREDETERMINADAS" 
    $Button10.UseVisualStyleBackColor = $True
    $Button10.BackColor = [System.Drawing.Color]::LightBlue
    $Button10.Add_Click( { 
            $textbox11.Enabled = $true
            $textbox12.Enabled = $true
            $textbox13.Enabled = $true
            $textbox14.Enabled = $true
            $textbox15.Enabled = $true
        if ($arreglo[2] -eq '64') {
           
            $textbox16.Enabled = $true
            $textbox17.Enabled = $true
             $textbox18.Enabled=$true}
    
     }) 
      
   
     $textbox19.Font = 'Comic Sans MS,10'
     $textbox19.Location = '600,50'
     $textbox19.Margin = '5, 5, 5, 5'
     $textbox19.Multiline = $True
     $textbox19.Name = 'textbox5'
     $textbox19.Size = '300, 30'
     $textbox19.TabIndex = 1
     $textbox19.Enabled = $false
     $textbox19.add_TextChanged($textbox1_TextChanged)
   $Form1.Controls.Add($textbox19)

   $textbox20.Font = 'Comic Sans MS,10'
   $textbox20.Location = '600,150'
   $textbox20.Margin = '5, 5, 5, 5'
   $textbox20.Multiline = $True
   $textbox20.Name = 'textbox5'
   $textbox20.Size = '300, 30'
   $textbox20.TabIndex = 1
   $textbox20.Enabled = $false
   $textbox20.add_TextChanged($textbox1_TextChanged)
 $Form1.Controls.Add($textbox20)
 

$matikard="192.9.62.64/26"
 $movistarChile="192.9.64.0/25"
 $financieroChileJuanJo="192.9.62.128/26"
 $financieroChilePatricia="192.9.62.192/26"
 $Oncosalud="192.9.64.128/26"
 $cajaArequipa="192.9.64.0/26"
 $carteraPropia="192.9.65.128/25"
 $mesaDigital="192.9.61.100/32"
 $bbva="192.9.64.192/26"

[int]$arregloModificado=$arreglo[3]
#Mascara25
$movistarMask=($arregloModificado -ge 0 -and $arregloModificado -le 127)
$carteraMask=($arregloModificado -ge 128 -and $arregloModificado -le 255)
#Mascara26
$matikardMask=($arregloModificado -ge 64 -and $arregloModificado -le 127)

$financieroMaskJuanJo=($arregloModificado -ge 128 -and $arregloModificado -le 191)
$financieroMaskPatricia=($arregloModificado -ge 192 -and $arregloModificado -le 255)
$OncosaludMask=($arregloModificado -ge 128 -and $arregloModificado -le 191)
$cajaArequipaMask=($arregloModificado -ge 0 -and $arregloModificado -le 63)
$bbvaMask=($arregloModificado -ge 192 -and $arregloModificado -le 255)
#




if($arreglo[2] -eq '64'){

    if( $movistarMask){

        $label16                           = New-Object system.Windows.Forms.Label
        $label17                           = New-Object system.Windows.Forms.Label
        $label16.text                      = "Excepción 5:"
        $label16.AutoSize                  = $true
        $label16.width                     = 40
        $label16.height                    = 30
        $label16.location                  = New-Object System.Drawing.Point(55,270)
        $label16.Font                      = 'Comic Sans MS,10'
        $Form1.Controls.Add($label16) 

       
$label17.text                      = "Excepción 6:"
$label17.AutoSize                  = $true
$label17.width                     = 40
$label17.height                    = 30
$label17.location                  = New-Object System.Drawing.Point(55,310)
$label17.Font                      = 'Comic Sans MS,10'
$Form1.Controls.Add($label17) 

$label18                           = New-Object system.Windows.Forms.Label
$label18.text                      = "Excepción 7:"
$label18.AutoSize                  = $true
$label18.width                     = 40
$label18.height                    = 30
$label18.location                  = New-Object System.Drawing.Point(55,350)
$label18.Font                      = 'Comic Sans MS,10'
$Form1.Controls.Add($label18) 







        $textbox16 = New-Object 'System.Windows.Forms.TextBox'
        $textbox16.Font = 'Comic Sans MS,10'
         $textbox16.Location = '200,270'
         $textbox16.Margin = '5, 5, 5, 5'
         $textbox16.Multiline = $True
        $textbox16.Name = 'textbox5'
      $textbox16.Size = '300, 30'
        $textbox16.TabIndex = 1
        $textbox16.Enabled = $false
      $textbox16.add_TextChanged($textbox1_TextChanged)
      $Form1.Controls.Add($textbox16)


      $textbox17 = New-Object 'System.Windows.Forms.TextBox'
      $textbox17.Font = 'Comic Sans MS,10'
      $textbox17.Location = '200,310'
      $textbox17.Margin = '5, 5, 5, 5'
      $textbox17.Multiline = $True
      $textbox17.Name = 'textbox5'
      $textbox17.Size = '300, 30'
      $textbox17.TabIndex = 1
      $textbox17.Enabled = $false
      $textbox17.add_TextChanged($textbox1_TextChanged)
      $Form1.Controls.Add($textbox17)

      $textbox18 = New-Object 'System.Windows.Forms.TextBox'
        $textbox18.Font = 'Comic Sans MS,10'
        $textbox18.Location = '200,350'
        $textbox18.Margin = '5, 5, 5, 5'
        $textbox18.Multiline = $True
        $textbox18.Name = 'textbox5'
        $textbox18.Size = '300, 30'
        $textbox18.TabIndex = 1
        $textbox18.Enabled = $false
        $textbox18.add_TextChanged($textbox1_TextChanged)
      $Form1.Controls.Add($textbox18)

      $textbox16.Text = "192.9.104.*"
      $textbox17.Text = "192.9.106.*"
      $textbox18.Text = "*.telefonicachile.cl"
        $textbox19.Text=$movistarChile
        $textbox20.Text="Movistar Chile"
    }
    else{
        if($OncosaludMask){
            $Form1.Controls.Remove($textbox16)
            $Form1.Controls.Remove($textbox17)
            $Form1.Controls.Remove($textbox18)
            $Form1.Controls.Remove($label16 )
            $Form1.Controls.Remove($label17 )
            $Form1.Controls.Remove($label18 )
            $textbox19.Text=$Oncosalud
            $textbox20.Text="Oncosalud Cobranzas"
        }
        else{
            if($bbvaMask){
                $Form1.Controls.Remove($textbox16)
                $Form1.Controls.Remove($textbox17)
                $Form1.Controls.Remove($textbox18)
                $Form1.Controls.Remove($label16 )
                $Form1.Controls.Remove($label17 )
                $Form1.Controls.Remove($label18 )
                $textbox19.Text=$bbva
                $textbox20.Text="BBVA"
            }
            else{
                $Form1.Controls.Remove($textbox16)
                $Form1.Controls.Remove($textbox17)
                $Form1.Controls.Remove($textbox18)
                $Form1.Controls.Remove($label16 )
                $Form1.Controls.Remove($label17 )
                $Form1.Controls.Remove($label18 )
                $textbox19.Text="Error"
                $textbox20.Text="Error"
                $textbox11.Text = " "
                $textbox12.Text = " "
                $textbox13.Text = " "
                $textbox14.Text = " "
                $textbox15.Text = " "
            }
        }
    }
}


if($arreglo[2] -eq '62'){
    if($financieroMaskJuanJo){
        $textbox19.Text=$financieroChileJuanJo
        $textbox20.Text="Financiero Chile-Juan José"
    }
    else{
        if($financieroMaskPatricia){
            $textbox19.Text=$financieroChilePatricia
            $textbox20.Text="Financiero Chile-Patricia"
        }
        else{
            if($cajaArequipaMask){
                $textbox19.Text=$cajaArequipa
                $textbox20.Text="Caja Arequipa"
            }
            else{
                if($matikardMask){
                    $textbox19.Text=$matikard
                    $textbox20.Text="Matikard/Entel/Claro"
                }else{
                    $textbox19.Text="Error"
                    $textbox20.Text="Error"
                    $textbox11.Text = " "
                    $textbox12.Text = " "
                    $textbox13.Text = " "
                    $textbox14.Text = " "
                    $textbox15.Text = " "
                }
               
            }
        }
    }
}
if($arreglo[2] -eq '65'){
    if($carteraMask){
        $textbox19.Text=$carteraPropia
        $textbox20.Text="Cartera Propia"
    }
    else{
        $textbox19.Text="Error"
        $textbox20.Text="Error"
        $textbox11.Text = " "
        $textbox12.Text = " "
        $textbox13.Text = " "
        $textbox14.Text = " "
        $textbox15.Text = " "
    }
}


$Button11.Location = New-Object System.Drawing.Size(720,600) 
$Button11.Size = New-Object System.Drawing.Size(150, 50) 
$Button11.Text = "ACEPTAR" 
$Button11.UseVisualStyleBackColor = $True
$Button11.BackColor = [System.Drawing.Color]::LightBlue
$Button11.DialogResult = [System.Windows.Forms.DialogResult]::OK
$Form1.AcceptButton = $Button11
$Form1.Controls.Add($Button11)




    $Form1.Add_Shown({$Form.Activate()})
    [void] $Form1.ShowDialog();
}
elseif($comboBox1.SelectedItem -eq 'IP'){
    [void] [System.Reflection.Assembly]::LoadWithPartialName("System.Drawing") 
    [void] [System.Reflection.Assembly]::LoadWithPartialName("System.Windows.Forms")  
    ############### CREACION DEL ELEMENTO ############
    $Form1 = New-Object System.Windows.Forms.Form 
    
   
    $Button10 = New-Object 'System.Windows.Forms.Button'
    $textbox19 = New-Object 'System.Windows.Forms.TextBox'
    $textbox20 = New-Object 'System.Windows.Forms.TextBox'
    $Button11 = New-Object 'System.Windows.Forms.Button'
    $label11  = New-Object 'system.Windows.Forms.Label'
    $label12 = New-Object 'system.Windows.Forms.Label'
    $label13= New-Object 'system.Windows.Forms.Label'
    $label14= New-Object 'system.Windows.Forms.Label'
    $label15= New-Object 'system.Windows.Forms.Label'

#Etiqueta de Ruta de Ubicación


$label11.text                      = "Servidor Proxy"
$label11.AutoSize                  = $true
$label11.width                     = 40
$label11.height                    = 30
$label11.location                  = New-Object System.Drawing.Point(55,25)
$label11.Font                      = 'Comic Sans MS,10'
$Form1.Controls.Add($label11) 


$label12.text                      = "Excepción 1:"
$label12.AutoSize                  = $true
$label12.width                     = 40
$label12.height                    = 30
$label12.location                  = New-Object System.Drawing.Point(55,80)
$label12.Font                      = 'Comic Sans MS,10'
$Form1.Controls.Add($label12) 


$label13.text                      = "Excepción 2:"
$label13.AutoSize                  = $true
$label13.width                     = 40
$label13.height                    = 30
$label13.location                  = New-Object System.Drawing.Point(55,130)
$label13.Font                      = 'Comic Sans MS,10'
$Form1.Controls.Add($label13) 

$label14.text                      = "Excepción 3:"
$label14.AutoSize                  = $true
$label14.width                     = 40
$label14.height                    = 30
$label14.location                  = New-Object System.Drawing.Point(55,180)
$label14.Font                      = 'Comic Sans MS,10'
$Form1.Controls.Add($label14) 

$label15.text                      = "Excepción 4:"
$label15.AutoSize                  = $true
$label15.width                     = 40
$label15.height                    = 30
$label15.location                  = New-Object System.Drawing.Point(55,230)
$label15.Font                      = 'Comic Sans MS,10'
$Form1.Controls.Add($label15) 


    ############TextBox Ruta de Ubicación
	$textbox11.Font = 'Comic Sans MS,10'
	$textbox11.Location = '200,25'
	$textbox11.Margin = '5, 5, 5, 5'
	$textbox11.Multiline = $True
	$textbox11.Name = 'textbox5'
	$textbox11.Size = '300, 30'
    $textbox11.TabIndex = 1
    $textbox11.Enabled=$false
	$textbox11.add_TextChanged($textbox1_TextChanged)


    $Form1.Controls.Add($textbox11)
    $peru = $textbox1.Text
    $arreglo = $peru.Split(".");

if($arreglo[2] -eq '60'){
        $array = $arreglo[0] + "." + $arreglo[1] + "." + $arreglo[2] + "." + "102"+":3128"
        $textbox11.Text = $array
}
elseif ($arreglo[2] -eq '61' -or $arreglo[2] -eq '62' -or $arreglo[2] -eq '63' -or $arreglo[2] -eq '64' -or $arreglo[2] -eq '65' ) {
    $array = $arreglo[0] + "." + $arreglo[1] + "." + $arreglo[2] + "." + "7"+":3128"
    $textbox11.Text = $array  
}else{

    $textbox11.Text = " "
}


    $Form1.Size = New-Object System.Drawing.Size(1100,750)  
    $Form1.StartPosition = "CenterScreen" 
    $Form1.FormBorderStyle = [System.Windows.Forms.FormBorderStyle]::Sizable
    $Form1.MaximizeBox = $false
    $Form1.Text = "FORMULARIO DE RED" 
    

    $textbox12.Font = 'Comic Sans MS,10'
    $textbox12.Location = '200,80'
    $textbox12.Margin = '5, 5, 5, 5'
    $textbox12.Multiline = $True
    $textbox12.Name = 'textbox5'
    $textbox12.Size = '300, 30'
    $textbox12.TabIndex = 1
    $textbox12.Enabled = $false
    $textbox12.add_TextChanged($textbox1_TextChanged)
    $Form1.Controls.Add($textbox12)


    $textbox13.Font = 'Comic Sans MS,10'
    $textbox13.Location = '200,130'
    $textbox13.Margin = '5, 5, 5, 5'
    $textbox13.Multiline = $True
    $textbox13.Name = 'textbox5'
    $textbox13.Size = '300, 30'
    $textbox13.TabIndex = 1
    $textbox13.Enabled = $false
    $textbox13.add_TextChanged($textbox1_TextChanged)
    $Form1.Controls.Add($textbox13)

    $textbox14.Font = 'Comic Sans MS,10'
    $textbox14.Location = '200,180'
    $textbox14.Margin = '5, 5, 5, 5'
    $textbox14.Multiline = $True
    $textbox14.Name = 'textbox5'
    $textbox14.Size = '300, 30'
    $textbox14.TabIndex = 1
    $textbox14.Enabled = $false
    $textbox14.add_TextChanged($textbox1_TextChanged)
    $Form1.Controls.Add($textbox14)

    $textbox15.Font = 'Comic Sans MS,10'
    $textbox15.Location = '200,230'
    $textbox15.Margin = '5, 5, 5, 5'
    $textbox15.Multiline = $True
    $textbox15.Name = 'textbox5'
    $textbox15.Size = '300, 30'
    $textbox15.TabIndex = 1
    $textbox15.Enabled = $false
    $textbox15.add_TextChanged($textbox1_TextChanged)
    $Form1.Controls.Add($textbox15)
if($arreglo[2] -eq '60' -or $arreglo[2] -eq '61' -or $arreglo[2] -eq '62' -or $arreglo[2] -eq '63' -or $arreglo[2] -eq '64' -or $arreglo[2] -eq '65' ){
    $textbox12.Text = "192.9.100.*"
    $textbox13.Text = "10.10.10.*"
    $array = $arreglo[0] + "." + $arreglo[1] + "." + $arreglo[2] + "." + "*"
    $textbox14.Text = $array
    $textbox15.Text = "<local>"
}
else{
    $textbox12.Text = " "
    $textbox13.Text = " "

    $textbox14.Text = " "
    $textbox15.Text = " "
}

  

  
      $Form1.Controls.Add($Button10)
    $Button10.Location = New-Object System.Drawing.Size(520,600) 
    $Button10.Size = New-Object System.Drawing.Size(150, 50) 
    $Button10.Text = "RUTAS PREDETERMINADAS" 
    $Button10.UseVisualStyleBackColor = $True
    $Button10.BackColor = [System.Drawing.Color]::LightBlue
    $Button10.Add_Click( { 
            $textbox11.Enabled = $true
            $textbox12.Enabled = $true
            $textbox13.Enabled = $true
            $textbox14.Enabled = $true
            $textbox15.Enabled = $true
        if ($arreglo[2] -eq '64') {
           
            $textbox16.Enabled = $true
            $textbox17.Enabled = $true
             $textbox18.Enabled=$true}
    
     }) 
      
   
     $textbox19.Font = 'Comic Sans MS,10'
     $textbox19.Location = '600,50'
     $textbox19.Margin = '5, 5, 5, 5'
     $textbox19.Multiline = $True
     $textbox19.Name = 'textbox5'
     $textbox19.Size = '300, 30'
     $textbox19.TabIndex = 1
     $textbox19.Enabled = $false
     $textbox19.add_TextChanged($textbox1_TextChanged)
   $Form1.Controls.Add($textbox19)

   $textbox20.Font = 'Comic Sans MS,10'
   $textbox20.Location = '600,150'
   $textbox20.Margin = '5, 5, 5, 5'
   $textbox20.Multiline = $True
   $textbox20.Name = 'textbox5'
   $textbox20.Size = '300, 30'
   $textbox20.TabIndex = 1
   $textbox20.Enabled = $false
   $textbox20.add_TextChanged($textbox1_TextChanged)
 $Form1.Controls.Add($textbox20)
 

$matikard="192.9.62.64/26"
 $movistarChile="192.9.64.0/25"
 $financieroChileJuanJo="192.9.62.128/26"
 $financieroChilePatricia="192.9.62.192/26"
 $Oncosalud="192.9.64.128/26"
 $cajaArequipa="192.9.64.0/26"
 $carteraPropia="192.9.65.128/25"
 $mesaDigital="192.9.61.100/32"
 $bbva="192.9.64.192/26"

[int]$arregloModificado=$arreglo[3]
#Mascara25
$movistarMask=($arregloModificado -ge 0 -and $arregloModificado -le 127)
$carteraMask=($arregloModificado -ge 128 -and $arregloModificado -le 255)
#Mascara26
$matikardMask=($arregloModificado -ge 64 -and $arregloModificado -le 127)

$financieroMaskJuanJo=($arregloModificado -ge 128 -and $arregloModificado -le 191)
$financieroMaskPatricia=($arregloModificado -ge 192 -and $arregloModificado -le 255)
$OncosaludMask=($arregloModificado -ge 128 -and $arregloModificado -le 191)
$cajaArequipaMask=($arregloModificado -ge 0 -and $arregloModificado -le 63)
$bbvaMask=($arregloModificado -ge 192 -and $arregloModificado -le 255)
#




if($arreglo[2] -eq '64'){

    if( $movistarMask){

        $label16                           = New-Object system.Windows.Forms.Label
        $label17                           = New-Object system.Windows.Forms.Label
        $label16.text                      = "Excepción 5:"
        $label16.AutoSize                  = $true
        $label16.width                     = 40
        $label16.height                    = 30
        $label16.location                  = New-Object System.Drawing.Point(55,270)
        $label16.Font                      = 'Comic Sans MS,10'
        $Form1.Controls.Add($label16) 

       
$label17.text                      = "Excepción 6:"
$label17.AutoSize                  = $true
$label17.width                     = 40
$label17.height                    = 30
$label17.location                  = New-Object System.Drawing.Point(55,310)
$label17.Font                      = 'Comic Sans MS,10'
$Form1.Controls.Add($label17) 

$label18                           = New-Object system.Windows.Forms.Label
$label18.text                      = "Excepción 7:"
$label18.AutoSize                  = $true
$label18.width                     = 40
$label18.height                    = 30
$label18.location                  = New-Object System.Drawing.Point(55,350)
$label18.Font                      = 'Comic Sans MS,10'
$Form1.Controls.Add($label18) 







        $textbox16 = New-Object 'System.Windows.Forms.TextBox'
        $textbox16.Font = 'Comic Sans MS,10'
         $textbox16.Location = '200,270'
         $textbox16.Margin = '5, 5, 5, 5'
         $textbox16.Multiline = $True
        $textbox16.Name = 'textbox5'
      $textbox16.Size = '300, 30'
        $textbox16.TabIndex = 1
        $textbox16.Enabled = $false
      $textbox16.add_TextChanged($textbox1_TextChanged)
      $Form1.Controls.Add($textbox16)


      $textbox17 = New-Object 'System.Windows.Forms.TextBox'
      $textbox17.Font = 'Comic Sans MS,10'
      $textbox17.Location = '200,310'
      $textbox17.Margin = '5, 5, 5, 5'
      $textbox17.Multiline = $True
      $textbox17.Name = 'textbox5'
      $textbox17.Size = '300, 30'
      $textbox17.TabIndex = 1
      $textbox17.Enabled = $false
      $textbox17.add_TextChanged($textbox1_TextChanged)
      $Form1.Controls.Add($textbox17)

      $textbox18 = New-Object 'System.Windows.Forms.TextBox'
        $textbox18.Font = 'Comic Sans MS,10'
        $textbox18.Location = '200,350'
        $textbox18.Margin = '5, 5, 5, 5'
        $textbox18.Multiline = $True
        $textbox18.Name = 'textbox5'
        $textbox18.Size = '300, 30'
        $textbox18.TabIndex = 1
        $textbox18.Enabled = $false
        $textbox18.add_TextChanged($textbox1_TextChanged)
      $Form1.Controls.Add($textbox18)

      $textbox16.Text = "192.9.104.*"
      $textbox17.Text = "192.9.106.*"
      $textbox18.Text = "*.telefonicachile.cl"
        $textbox19.Text=$movistarChile
        $textbox20.Text="Movistar Chile"
    }
    else{
        if($OncosaludMask){
            $Form1.Controls.Remove($textbox16)
            $Form1.Controls.Remove($textbox17)
            $Form1.Controls.Remove($textbox18)
            $Form1.Controls.Remove($label16 )
            $Form1.Controls.Remove($label17 )
            $Form1.Controls.Remove($label18 )
            $textbox19.Text=$Oncosalud
            $textbox20.Text="Oncosalud Cobranzas"
        }
        else{
            if($bbvaMask){
                $Form1.Controls.Remove($textbox16)
                $Form1.Controls.Remove($textbox17)
                $Form1.Controls.Remove($textbox18)
                $Form1.Controls.Remove($label16 )
                $Form1.Controls.Remove($label17 )
                $Form1.Controls.Remove($label18 )
                $textbox19.Text=$bbva
                $textbox20.Text="BBVA"
            }
            else{
                $Form1.Controls.Remove($textbox16)
                $Form1.Controls.Remove($textbox17)
                $Form1.Controls.Remove($textbox18)
                $Form1.Controls.Remove($label16 )
                $Form1.Controls.Remove($label17 )
                $Form1.Controls.Remove($label18 )
                $textbox19.Text="Error"
                $textbox20.Text="Error"
                $textbox11.Text = " "
                $textbox12.Text = " "
                $textbox13.Text = " "
                $textbox14.Text = " "
                $textbox15.Text = " "
            }
        }
    }
}


if($arreglo[2] -eq '62'){
    if($financieroMaskJuanJo){
        $textbox19.Text=$financieroChileJuanJo
        $textbox20.Text="Financiero Chile-Juan José"
    }
    else{
        if($financieroMaskPatricia){
            $textbox19.Text=$financieroChilePatricia
            $textbox20.Text="Financiero Chile-Patricia"
        }
        else{
            if($cajaArequipaMask){
                $textbox19.Text=$cajaArequipa
                $textbox20.Text="Caja Arequipa"
            }
            else{
                if($matikardMask){
                    $textbox19.Text=$matikard
                    $textbox20.Text="Matikard/Entel/Claro"
                }else{
                    $textbox19.Text="Error"
                    $textbox20.Text="Error"
                    $textbox11.Text = " "
                    $textbox12.Text = " "
                    $textbox13.Text = " "
                    $textbox14.Text = " "
                    $textbox15.Text = " "
                }
               
            }
        }
    }
}
if($arreglo[2] -eq '65'){
    if($carteraMask){
        $textbox19.Text=$carteraPropia
        $textbox20.Text="Cartera Propia"
    }
    else{
        $textbox19.Text="Error"
        $textbox20.Text="Error"
        $textbox11.Text = " "
        $textbox12.Text = " "
        $textbox13.Text = " "
        $textbox14.Text = " "
        $textbox15.Text = " "
    }
}


$Button11.Location = New-Object System.Drawing.Size(720,600) 
$Button11.Size = New-Object System.Drawing.Size(150, 50) 
$Button11.Text = "ACEPTAR" 
$Button11.UseVisualStyleBackColor = $True
$Button11.BackColor = [System.Drawing.Color]::LightBlue
$Button11.DialogResult = [System.Windows.Forms.DialogResult]::OK
$Form1.AcceptButton = $Button11
$Form1.Controls.Add($Button11)




    $Form1.Add_Shown({$Form.Activate()})
    [void] $Form1.ShowDialog();

}











#Dominio


Function Add-ComputerToDomain(){ 
#Agregar DNS principal 192.9.60.91
    $oreo= get-wmiobject win32_networkadapter | where-object {$_.netconnectionstatus -eq 2 -and $_.ServiceName -eq 'rt640x64' }
            
    $clima=get-wmiobject win32_networkadapterconfiguration|where-object {$_.Index -eq $oreo.DeviceID};
    
    $dns_servers = "192.9.60.91","8.8.8.8";
    
    $clima.SetDNSServerSearchOrder($dns_servers);






#Luego agregar credenciales del dominio



   $DomainAccountName="RECSAPERU\recsasd"
    $DomainAccountPassword="S0l0M3s419!"
    $DomainName="recsaperu.com.pe"
   
          $credentials = New-Object System.Management.Automation.PsCredential($DomainAccountName, (ConvertTo-SecureString $DomainAccountPassword -AsPlainText -Force)) 
          Add-Computer -DomainName $DomainName -Credential $credentials  -PassThru 
shutdown -r -t 1

} 
 
Add-ComputerToDomain








for($inicio3;$inicio3 -le $ultima3;$inicio3++){
    $Computer3=$primeraIP+$inicio3;

  
    $hora=Get-Date -DisplayHint DateTime

$Session = New-PSSession -ComputerName $Computer3 -Credential $Cred
if($Session -eq $Null){
  #Write-Host "No se puede conectar" -ForegroundColor Blue -Background White
  "No se pudo conectar en $Computer3" + " - " + $hora >> "$ruta\logsRed\log.txt"
    # $outputBox1.text= "No se pudo conectar en $ipAntiguaInicial"+ " - " + $hora;   
    $Message="No se pudo conectar en $Computer3"+ " - " + $hora;   
      $textbox8.AppendText("`r`n$Message");
         $textbox8.Refresh()
     $textbox8.ScrollToCaret()
     }
    else{
     #Invocando comandos
     $Job = Invoke-Command -Session $Session  -ScriptBlock $cambio -ArgumentList ($Computer1,$Computer2,$texto4) -AsJob 
     $Null = Wait-Job -Job $Job
    Remove-PSSession -Session $Session
    "Inicio exitoso en $Computer3" + " - " + $hora >>  "$ruta\logsRed\log.txt"
    #$outputBox1.text= "Inicio exitoso en $ipNewInicial"
 $Message="Inicio exitoso en $Computer3";   
 $textbox8.AppendText("`r`n$Message");
 $textbox8.Refresh()
$textbox8.ScrollToCaret()
    }
}











$SecurePassword = ConvertTo-SecureString -AsPlainText $Password -Force
$Cred = New-Object -TypeName "System.Management.Automation.PSCredential" -ArgumentList $Username, $SecurePassword
$hora=Get-Date -DisplayHint DateTime

$Session = New-PSSession -ComputerName $Computer -Credential $Cred
if($Session -eq $Null){
  #Write-Host "No se puede conectar" -ForegroundColor Blue -Background White
  "No se pudo conectar en $Computer" + " - " + $hora >> "$ruta\logsRed\log.txt"
    # $outputBox1.text= "No se pudo conectar en $ipAntiguaInicial"+ " - " + $hora;   
    $Message="No se pudo conectar en $Computer"+ " - " + $hora;   
      $textbox8.AppendText("`r`n$Message");
         $textbox8.Refresh()
     $textbox8.ScrollToCaret()
     }
    else{

    
     #Invocando comandos
     $Job = Invoke-Command -Session $Session  -ScriptBlock $cambio -ArgumentList ($Computer,$texto4) -AsJob 
     $Null = Wait-Job -Job $Job
    Remove-PSSession -Session $Session
    "Inicio exitoso en $Computer" + " - " + $hora >>  "$ruta\logsRed\log.txt"
    #$outputBox1.text= "Inicio exitoso en $ipNewInicial"
 $Message="Inicio exitoso en $Computer";   
 $textbox8.AppendText("`r`n$Message");
 $textbox8.Refresh()
$textbox8.ScrollToCaret()
    }





























