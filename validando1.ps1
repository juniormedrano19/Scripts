
  if($comboBox1.SelectedItem -eq 'RANGO DE IPS')
  {
  

if($comboBox5.SelectedItem -eq 1){

    $Username = "Administrador"
    $Password = "R3c542016C4ll"
    $Computer1=$textbox2.Text.Trim(); 
    $Computer2=$textbox3.Text.Trim(); 
    $ip1=$Computer1.Split(".");
    $ip2=$Computer2.Split("."); 
    $regip = [regex]"^((25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)\.){3}(25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)$"
    $validacion1 = $Computer1 -match $regip
    $validacion2 = $Computer2 -match $regip
    
    $Inicial=$Computer1.Split(".")
    $inicio0=$Inicial[0];
    $inicio1=$Inicial[1];
    $inicio2=$Inicial[2];
    [int]$inicio3=$Inicial[3];
    $primeraIP=$inicio0+"."+$inicio1+"."+$inicio2+"." ;
    
    $Final=$Computer2.Split(".")
    [int]$ultima3=$Final[3];

    $ip_N1=$TextBox100.Text;
    $mask_N1=$ComboBox110.SelectedItem.ToString();
    $gateway_N1=$TextBox104.Text;
    if(($ip1[2] -eq $ip2[2]) -and ($ip1[3] -lt $ip2[3]) -and(($validacion1 -eq $true) -and ($validacion2 -eq $true) )){
      $agregarRutas={
         
            Param($Computer1,$Computer2,$ip_N1,$mask_N1,$gateway_N1)    

       
            route add -p $ip_N1/$mask_N1 $gateway_N1
 
    }  
    $SecurePassword = ConvertTo-SecureString -AsPlainText $Password -Force
    $Cred = New-Object -TypeName "System.Management.Automation.PSCredential" -ArgumentList $Username, $SecurePassword
       
    for($inicio3;$inicio3 -le $ultima3;$inicio3++){
        $Computer3=$primeraIP+$inicio3;
      Write-Host "Iniciando Sesion en $Computer3"
    
    
    $Session = New-PSSession -ComputerName $Computer3 -Credential $Cred
     
        
         #Invocando comandos
         $Job = Invoke-Command -Session $Session  -ScriptBlock $agregarRutas -ArgumentList ($Computer1,$Computer2,$ip_N1,$mask_N1,$gateway_N1) -AsJob 
         $Null = Wait-Job -Job $Job
        Remove-PSSession -Session $Session

    }

}
elseif(($Computer1.length -eq 0) -Or ($Computer2.length -eq 0)){
      
    Add-Type -AssemblyName System.Windows.Forms
    $errorMsg = "No puede quedar en blanco la dirección ip.
    Vuelva a intentarlo nuevamente."
        $caption = "Error de contenido"
        [System.Windows.Forms.MessageBox]::Show($errorMsg, $caption)
   
}


elseif(($validacion1 -eq $false) -Or ($validacion2 -eq $false)){
Add-Type -AssemblyName System.Windows.Forms
$errorMsg = "Datos erróneos.
Vuelva a intentarlo nuevamente."
    $caption = "Error de contenido"
    [System.Windows.Forms.MessageBox]::Show($errorMsg, $caption)
}
}
elseif ($comboBox5.SelectedItem -eq 2) {
    $Username = "Administrador"
    $Password = "R3c542016C4ll"
    $Computer1=$textbox2.Text.Trim(); 
    $Computer2=$textbox3.Text.Trim(); 
    $ip1=$Computer1.Split(".");
    $ip2=$Computer2.Split("."); 
    $regip = [regex]"^((25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)\.){3}(25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)$"
    $validacion1 = $Computer1 -match $regip
    $validacion2 = $Computer2 -match $regip
    
    $Inicial=$Computer1.Split(".")
    $inicio0=$Inicial[0];
    $inicio1=$Inicial[1];
    $inicio2=$Inicial[2];
    [int]$inicio3=$Inicial[3];
    $primeraIP=$inicio0+"."+$inicio1+"."+$inicio2+"." ;
    
    $Final=$Computer2.Split(".")
    [int]$ultima3=$Final[3];


    $ip_N1=$TextBox100.Text;
    $mask_N1=$ComboBox110.SelectedItem.ToString();
    $gateway_N1=$TextBox104.Text;
    $ip_N2=$TextBox129.Text;
    $mask_N2=$ComboBox180.SelectedItem.ToString();
    $gateway_N2=$TextBox132.Text;
    if(($ip1[2] -eq $ip2[2]) -and ($ip1[3] -lt $ip2[3]) -and(($validacion1 -eq $true) -and ($validacion2 -eq $true) )){
      $agregarRutas={
         
            Param($Computer1,$Computer2,$ip_N1,$mask_N1,$gateway_N1,$ip_N2,$mask_N2,$gateway_N2)    

       
            route add -p $ip_N1/$mask_N1 $gateway_N1
            route add -p $ip_N2/$mask_N2 $gateway_N2
        
    

    }  
    $SecurePassword = ConvertTo-SecureString -AsPlainText $Password -Force
    $Cred = New-Object -TypeName "System.Management.Automation.PSCredential" -ArgumentList $Username, $SecurePassword
       
    for($inicio3;$inicio3 -le $ultima3;$inicio3++){
        $Computer3=$primeraIP+$inicio3;
      Write-Host "Iniciando Sesion en $Computer3"
    
    
    $Session = New-PSSession -ComputerName $Computer3 -Credential $Cred
     
        
         #Invocando comandos
         $Job = Invoke-Command -Session $Session  -ScriptBlock $agregarRutas -ArgumentList ($Computer1,$Computer2,$ip_N1,$mask_N1,$gateway_N1,$ip_N2,$mask_N2,$gateway_N2) -AsJob 
         $Null = Wait-Job -Job $Job
        Remove-PSSession -Session $Session
    }
}
elseif(($Computer1.length -eq 0) -Or ($Computer2.length -eq 0)){
      
    Add-Type -AssemblyName System.Windows.Forms
    $errorMsg = "No puede quedar en blanco la dirección ip.
    Vuelva a intentarlo nuevamente."
        $caption = "Error de contenido"
        [System.Windows.Forms.MessageBox]::Show($errorMsg, $caption)
   
}


elseif(($validacion1 -eq $false) -Or ($validacion2 -eq $false)){
Add-Type -AssemblyName System.Windows.Forms
$errorMsg = "Datos erróneos.
Vuelva a intentarlo nuevamente."
    $caption = "Error de contenido"
    [System.Windows.Forms.MessageBox]::Show($errorMsg, $caption)
}
}
elseif ($comboBox5.SelectedItem -eq 3) {
    $Username = "Administrador"
    $Password = "R3c542016C4ll"


    $Computer1=$textbox2.Text.Trim(); 
    $Computer2=$textbox3.Text.Trim(); 
    $ip1=$Computer1.Split(".");
    $ip2=$Computer2.Split("."); 
    $regip = [regex]"^((25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)\.){3}(25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)$"
    $validacion1 = $Computer1 -match $regip
    $validacion2 = $Computer2 -match $regip
    
    $Inicial=$Computer1.Split(".")
    $inicio0=$Inicial[0];
    $inicio1=$Inicial[1];
    $inicio2=$Inicial[2];
    [int]$inicio3=$Inicial[3];
    $primeraIP=$inicio0+"."+$inicio1+"."+$inicio2+"." ;
    
    $Final=$Computer2.Split(".")
    [int]$ultima3=$Final[3];


   
    $ip_N1=$TextBox100.Text;
    $mask_N1=$ComboBox110.SelectedItem.ToString();
    $gateway_N1=$TextBox104.Text;
    $ip_N2=$TextBox129.Text;
    $mask_N2=$ComboBox180.SelectedItem.ToString();
    $gateway_N2=$TextBox132.Text;
    $ip_N3=$TextBox125.Text;
    $mask_N3=$ComboBox170.SelectedItem.ToString();
    $gateway_N3=$TextBox128.Text;
    if(($ip1[2] -eq $ip2[2]) -and ($ip1[3] -lt $ip2[3]) -and(($validacion1 -eq $true) -and ($validacion2 -eq $true) )){
      $agregarRutas={
         
            Param($Computer1,$Computer2,$ip_N1,$mask_N1,$gateway_N1,$ip_N2,$mask_N2,$gateway_N2,$ip_N3,$mask_N3,$gateway_N3)    

       
            route add -p $ip_N1/$mask_N1 $gateway_N1
            route add -p $ip_N2/$mask_N2 $gateway_N2
            route add -p $ip_N3/$mask_N3 $gateway_N3
    

    }  
    $SecurePassword = ConvertTo-SecureString -AsPlainText $Password -Force
    $Cred = New-Object -TypeName "System.Management.Automation.PSCredential" -ArgumentList $Username, $SecurePassword
      
    for($inicio3;$inicio3 -le $ultima3;$inicio3++){
        $Computer3=$primeraIP+$inicio3;
      Write-Host "Iniciando Sesion en $Computer3"
    
    
    
    $Session = New-PSSession -ComputerName $Computer3 -Credential $Cred
     
        
         #Invocando comandos
         $Job = Invoke-Command -Session $Session  -ScriptBlock $agregarRutas -ArgumentList ($Computer1,$Computer2,$ip_N1,$mask_N1,$gateway_N1,$ip_N2,$mask_N2,$gateway_N2,$ip_N3,$mask_N3,$gateway_N3) -AsJob 
         $Null = Wait-Job -Job $Job
        Remove-PSSession -Session $Session
    }
    }
    elseif(($Computer1.length -eq 0) -Or ($Computer2.length -eq 0)){
      
        Add-Type -AssemblyName System.Windows.Forms
        $errorMsg = "No puede quedar en blanco la dirección ip.
        Vuelva a intentarlo nuevamente."
            $caption = "Error de contenido"
            [System.Windows.Forms.MessageBox]::Show($errorMsg, $caption)
       
    }
    
    
    elseif(($validacion1 -eq $false) -Or ($validacion2 -eq $false)){
    Add-Type -AssemblyName System.Windows.Forms
    $errorMsg = "Datos erróneos.
    Vuelva a intentarlo nuevamente."
        $caption = "Error de contenido"
        [System.Windows.Forms.MessageBox]::Show($errorMsg, $caption)
    }
}
elseif ($comboBox5.SelectedItem -eq 4) {
    $Username = "Administrador"
    $Password = "R3c542016C4ll"


    $Computer1=$textbox2.Text.Trim(); 
    $Computer2=$textbox3.Text.Trim(); 
    $ip1=$Computer1.Split(".");
    $ip2=$Computer2.Split("."); 
    $regip = [regex]"^((25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)\.){3}(25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)$"
    $validacion1 = $Computer1 -match $regip
    $validacion2 = $Computer2 -match $regip
    
    $Inicial=$Computer1.Split(".")
    $inicio0=$Inicial[0];
    $inicio1=$Inicial[1];
    $inicio2=$Inicial[2];
    [int]$inicio3=$Inicial[3];
    $primeraIP=$inicio0+"."+$inicio1+"."+$inicio2+"." ;
    
    $Final=$Computer2.Split(".")
    [int]$ultima3=$Final[3];


    $ip_N1=$TextBox100.Text;
    $mask_N1=$ComboBox110.SelectedItem.ToString();
    $gateway_N1=$TextBox104.Text;
    $ip_N2=$TextBox129.Text;
    $mask_N2=$ComboBox180.SelectedItem.ToString();
    $gateway_N2=$TextBox132.Text;
    $ip_N3=$TextBox125.Text;
    $mask_N3=$ComboBox170.SelectedItem.ToString();
    $gateway_N3=$TextBox128.Text;
    $ip_N4=$TextBox121.Text;
    $mask_N4=$ComboBox160.SelectedItem.ToString();
    $gateway_N4=$TextBox124.Text;
    if(($ip1[2] -eq $ip2[2]) -and ($ip1[3] -lt $ip2[3]) -and(($validacion1 -eq $true) -and ($validacion2 -eq $true) )){
      $agregarRutas={
         
            Param($Computer1,$Computer2,$ip_N1,$mask_N1,$gateway_N1,$ip_N2,$mask_N2,$gateway_N2,$ip_N3,$mask_N3,$gateway_N3,$ip_N4,$mask_N4,$gateway_N4)    

       
            route add -p $ip_N1/$mask_N1 $gateway_N1
            route add -p $ip_N2/$mask_N2 $gateway_N2
            route add -p $ip_N3/$mask_N3 $gateway_N3
            route add -p $ip_N4/$mask_N4 $gateway_N4
    

    }  
    $SecurePassword = ConvertTo-SecureString -AsPlainText $Password -Force
    $Cred = New-Object -TypeName "System.Management.Automation.PSCredential" -ArgumentList $Username, $SecurePassword
    for($inicio3;$inicio3 -le $ultima3;$inicio3++){
        $Computer3=$primeraIP+$inicio3;
      Write-Host "Iniciando Sesion en $Computer3"
    
    
    
    $Session = New-PSSession -ComputerName $Computer3 -Credential $Cred
     
        
         #Invocando comandos
         $Job = Invoke-Command -Session $Session  -ScriptBlock $agregarRutas -ArgumentList ($Computer1,$Computer2,$ip_N1,$mask_N1,$gateway_N1,$ip_N2,$mask_N2,$gateway_N2,$ip_N3,$mask_N3,$gateway_N3,$ip_N4,$mask_N4,$gateway_N4) -AsJob 
         $Null = Wait-Job -Job $Job
        Remove-PSSession -Session $Session
    }
}
elseif(($Computer1.length -eq 0) -Or ($Computer2.length -eq 0)){
      
    Add-Type -AssemblyName System.Windows.Forms
    $errorMsg = "No puede quedar en blanco la dirección ip.
    Vuelva a intentarlo nuevamente."
        $caption = "Error de contenido"
        [System.Windows.Forms.MessageBox]::Show($errorMsg, $caption)
   
}


elseif(($validacion1 -eq $false) -Or ($validacion2 -eq $false)){
Add-Type -AssemblyName System.Windows.Forms
$errorMsg = "Datos erróneos.
Vuelva a intentarlo nuevamente."
    $caption = "Error de contenido"
    [System.Windows.Forms.MessageBox]::Show($errorMsg, $caption)
}
}
elseif ($comboBox5.SelectedItem -eq 5) {
    $Username = "Administrador"
    $Password = "R3c542016C4ll"

    $Computer1=$textbox2.Text.Trim(); 
    $Computer2=$textbox3.Text.Trim(); 
    $ip1=$Computer1.Split(".");
    $ip2=$Computer2.Split("."); 
    $regip = [regex]"^((25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)\.){3}(25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)$"
    $validacion1 = $Computer1 -match $regip
    $validacion2 = $Computer2 -match $regip
    
    $Inicial=$Computer1.Split(".")
    $inicio0=$Inicial[0];
    $inicio1=$Inicial[1];
    $inicio2=$Inicial[2];
    [int]$inicio3=$Inicial[3];
    $primeraIP=$inicio0+"."+$inicio1+"."+$inicio2+"." ;
    
    $Final=$Computer2.Split(".")
    [int]$ultima3=$Final[3];


    $ip_N1=$TextBox100.Text;
    $mask_N1=$ComboBox110.SelectedItem.ToString();
    $gateway_N1=$TextBox104.Text;
    $ip_N2=$TextBox129.Text;
    $mask_N2=$ComboBox180.SelectedItem.ToString();
    $gateway_N2=$TextBox132.Text;
    $ip_N3=$TextBox125.Text;
    $mask_N3=$ComboBox170.SelectedItem.ToString();
    $gateway_N3=$TextBox128.Text;
    $ip_N4=$TextBox121.Text;
    $mask_N4=$ComboBox160.SelectedItem.ToString();
    $gateway_N4=$TextBox124.Text;
    $ip_N5=$TextBox117.Text;
    $mask_N5=$ComboBox150.SelectedItem.ToString();
    $gateway_N5=$TextBox120.Text;



 

      if(($ip1[2] -eq $ip2[2]) -and ($ip1[3] -lt $ip2[3]) -and(($validacion1 -eq $true) -and ($validacion2 -eq $true) )){
      $agregarRutas={
         
            Param($Computer1,$Computer2,$ip_N1,$mask_N1,$gateway_N1,$ip_N2,$mask_N2,$gateway_N2,$ip_N3,$mask_N3,$gateway_N3,$ip_N4,$mask_N4,$gateway_N4,$ip_N5,$mask_N5,$gateway_N5)    

       
            route add -p $ip_N1/$mask_N1 $gateway_N1
            route add -p $ip_N2/$mask_N2 $gateway_N2
            route add -p $ip_N3/$mask_N3 $gateway_N3
            route add -p $ip_N4/$mask_N4 $gateway_N4
            route add -p $ip_N5/$mask_N5 $gateway_N5
    

    }  
    $SecurePassword = ConvertTo-SecureString -AsPlainText $Password -Force
    $Cred = New-Object -TypeName "System.Management.Automation.PSCredential" -ArgumentList $Username, $SecurePassword
    for($inicio3;$inicio3 -le $ultima3;$inicio3++){
        $Computer3=$primeraIP+$inicio3;
      Write-Host "Iniciando Sesion en $Computer3"

    
    $Session = New-PSSession -ComputerName $Computer3 -Credential $Cred
     
        
         #Invocando comandos
         $Job = Invoke-Command -Session $Session  -ScriptBlock $agregarRutas -ArgumentList ($Computer1,$Computer2,$ip_N1,$mask_N1,$gateway_N1,$ip_N2,$mask_N2,$gateway_N2,$ip_N3,$mask_N3,$gateway_N3,$ip_N4,$mask_N4,$gateway_N4,$ip_N5,$mask_N5,$gateway_N5) -AsJob 
         $Null = Wait-Job -Job $Job
        Remove-PSSession -Session $Session


    }
}
elseif(($Computer1.length -eq 0) -Or ($Computer2.length -eq 0)){
      
    Add-Type -AssemblyName System.Windows.Forms
    $errorMsg = "No puede quedar en blanco la dirección ip.
    Vuelva a intentarlo nuevamente."
        $caption = "Error de contenido"
        [System.Windows.Forms.MessageBox]::Show($errorMsg, $caption)
   
}


elseif(($validacion1 -eq $false) -Or ($validacion2 -eq $false)){
Add-Type -AssemblyName System.Windows.Forms
$errorMsg = "Datos erróneos.
Vuelva a intentarlo nuevamente."
    $caption = "Error de contenido"
    [System.Windows.Forms.MessageBox]::Show($errorMsg, $caption)
}
}
elseif ($comboBox5.SelectedItem -eq 6) {
    $Username = "Administrador"
    $Password = "R3c542016C4ll"

    $Computer1=$textbox2.Text.Trim(); 
    $Computer2=$textbox3.Text.Trim(); 
    $ip1=$Computer1.Split(".");
    $ip2=$Computer2.Split("."); 
    $regip = [regex]"^((25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)\.){3}(25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)$"
    $validacion1 = $Computer1 -match $regip
    $validacion2 = $Computer2 -match $regip
    
    $Inicial=$Computer1.Split(".")
    $inicio0=$Inicial[0];
    $inicio1=$Inicial[1];
    $inicio2=$Inicial[2];
    [int]$inicio3=$Inicial[3];
    $primeraIP=$inicio0+"."+$inicio1+"."+$inicio2+"." ;
    
    $Final=$Computer2.Split(".")
    [int]$ultima3=$Final[3];


    $ip_N1=$TextBox100.Text;
    $mask_N1=$ComboBox110.SelectedItem.ToString();
    $gateway_N1=$TextBox104.Text;
    $ip_N2=$TextBox129.Text;
    $mask_N2=$ComboBox180.SelectedItem.ToString();
    $gateway_N2=$TextBox132.Text;
    $ip_N3=$TextBox125.Text;
    $mask_N3=$ComboBox170.SelectedItem.ToString();
    $gateway_N3=$TextBox128.Text;
    $ip_N4=$TextBox121.Text;
    $mask_N4=$ComboBox160.SelectedItem.ToString();
    $gateway_N4=$TextBox124.Text;
    $ip_N5=$TextBox117.Text;
    $mask_N5=$ComboBox150.SelectedItem.ToString();
    $gateway_N5=$TextBox120.Text;
    $ip_N6=$TextBox113.Text;
    $mask_N6=$ComboBox140.SelectedItem.ToString();
    $gateway_N6=$TextBox116.Text;

 if(($ip1[2] -eq $ip2[2]) -and ($ip1[3] -lt $ip2[3]) -and(($validacion1 -eq $true) -and ($validacion2 -eq $true) )){
   
      $agregarRutas={
         
            Param($Computer1,$Computer2,$ip_N1,$mask_N1,$gateway_N1,$ip_N2,$mask_N2,$gateway_N2,$ip_N3,$mask_N3,$gateway_N3,$ip_N4,$mask_N4,$gateway_N4,$ip_N5,$mask_N5,$gateway_N5,$ip_N6,$mask_N6,$gateway_N6)    

       
            route add -p $ip_N1/$mask_N1 $gateway_N1
            route add -p $ip_N2/$mask_N2 $gateway_N2
            route add -p $ip_N3/$mask_N3 $gateway_N3
            route add -p $ip_N4/$mask_N4 $gateway_N4
            route add -p $ip_N5/$mask_N5 $gateway_N5
            route add -p $ip_N6/$mask_N6 $gateway_N6

    }  
    $SecurePassword = ConvertTo-SecureString -AsPlainText $Password -Force
    $Cred = New-Object -TypeName "System.Management.Automation.PSCredential" -ArgumentList $Username, $SecurePassword
        
    for($inicio3;$inicio3 -le $ultima3;$inicio3++){
        $Computer3=$primeraIP+$inicio3;
      Write-Host "Iniciando Sesion en $Computer3"
    
    
    
    $Session = New-PSSession -ComputerName $Computer3 -Credential $Cred
     
        
         #Invocando comandos
         $Job = Invoke-Command -Session $Session  -ScriptBlock $agregarRutas -ArgumentList ($Computer1,$Computer2,$ip_N1,$mask_N1,$gateway_N1,$ip_N2,$mask_N2,$gateway_N2,$ip_N3,$mask_N3,$gateway_N3,$ip_N4,$mask_N4,$gateway_N4,$ip_N5,$mask_N5,$gateway_N5,$ip_N6,$mask_N6,$gateway_N6) -AsJob 
         $Null = Wait-Job -Job $Job
        Remove-PSSession -Session $Session
    }
}
elseif(($Computer1.length -eq 0) -Or ($Computer2.length -eq 0)){
      
    Add-Type -AssemblyName System.Windows.Forms
    $errorMsg = "No puede quedar en blanco la dirección ip.
    Vuelva a intentarlo nuevamente."
        $caption = "Error de contenido"
        [System.Windows.Forms.MessageBox]::Show($errorMsg, $caption)
   
}


elseif(($validacion1 -eq $false) -Or ($validacion2 -eq $false)){
Add-Type -AssemblyName System.Windows.Forms
$errorMsg = "Datos erróneos.
Vuelva a intentarlo nuevamente."
    $caption = "Error de contenido"
    [System.Windows.Forms.MessageBox]::Show($errorMsg, $caption)
}
}
elseif ($comboBox5.SelectedItem -eq 7) {
    $Username = "Administrador"
    $Password = "R3c542016C4ll"

    $Computer1=$textbox2.Text.Trim(); 
    $Computer2=$textbox3.Text.Trim(); 
    $ip1=$Computer1.Split(".");
    $ip2=$Computer2.Split("."); 
    $regip = [regex]"^((25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)\.){3}(25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)$"
    $validacion1 = $Computer1 -match $regip
    $validacion2 = $Computer2 -match $regip
    
    $Inicial=$Computer1.Split(".")
    $inicio0=$Inicial[0];
    $inicio1=$Inicial[1];
    $inicio2=$Inicial[2];
    [int]$inicio3=$Inicial[3];
    $primeraIP=$inicio0+"."+$inicio1+"."+$inicio2+"." ;
    
    $Final=$Computer2.Split(".")
    [int]$ultima3=$Final[3];

    $ip_N1=$TextBox100.Text;
    $mask_N1=$ComboBox110.SelectedItem.ToString();
    $gateway_N1=$TextBox104.Text;
    $ip_N2=$TextBox129.Text;
    $mask_N2=$ComboBox180.SelectedItem.ToString();
    $gateway_N2=$TextBox132.Text;
    $ip_N3=$TextBox125.Text;
    $mask_N3=$ComboBox170.SelectedItem.ToString();
    $gateway_N3=$TextBox128.Text;
    $ip_N4=$TextBox121.Text;
    $mask_N4=$ComboBox160.SelectedItem.ToString();
    $gateway_N4=$TextBox124.Text;
    $ip_N5=$TextBox117.Text;
    $mask_N5=$ComboBox150.SelectedItem.ToString();
    $gateway_N5=$TextBox120.Text;
    $ip_N6=$TextBox113.Text;
    $mask_N6=$ComboBox140.SelectedItem.ToString();
    $gateway_N6=$TextBox116.Text;
    $ip_N7=$TextBox190.Text;
    $mask_N7=$ComboBox130.SelectedItem.ToString();
    $gateway_N7=$TextBox118.Text;
    if(($ip1[2] -eq $ip2[2]) -and ($ip1[3] -lt $ip2[3]) -and(($validacion1 -eq $true) -and ($validacion2 -eq $true) )){
   
      $agregarRutas={
         
            Param($Computer1,$Computer2,$ip_N1,$mask_N1,$gateway_N1,$ip_N2,$mask_N2,$gateway_N2,$ip_N3,$mask_N3,$gateway_N3,$ip_N4,$mask_N4,$gateway_N4,$ip_N5,$mask_N5,$gateway_N5,$ip_N6,$mask_N6,$gateway_N6,$ip_N7,$mask_N7,$gateway_N7)    

       
            route add -p $ip_N1/$mask_N1 $gateway_N1
            route add -p $ip_N2/$mask_N2 $gateway_N2
            route add -p $ip_N3/$mask_N3 $gateway_N3
            route add -p $ip_N4/$mask_N4 $gateway_N4
            route add -p $ip_N5/$mask_N5 $gateway_N5
            route add -p $ip_N6/$mask_N6 $gateway_N6
            route add -p $ip_N7/$mask_N7 $gateway_N7
    }  
    $SecurePassword = ConvertTo-SecureString -AsPlainText $Password -Force
    $Cred = New-Object -TypeName "System.Management.Automation.PSCredential" -ArgumentList $Username, $SecurePassword
    
            
    for($inicio3;$inicio3 -le $ultima3;$inicio3++){
        $Computer3=$primeraIP+$inicio3;
      Write-Host "Iniciando Sesion en $Computer3"
    
    $Session = New-PSSession -ComputerName $Computer3 -Credential $Cred
     
        
         #Invocando comandos
         $Job = Invoke-Command -Session $Session  -ScriptBlock $agregarRutas -ArgumentList ($Computer1,$Computer2,$ip_N1,$mask_N1,$gateway_N1,$ip_N2,$mask_N2,$gateway_N2,$ip_N3,$mask_N3,$gateway_N3,$ip_N4,$mask_N4,$gateway_N4,$ip_N5,$mask_N5,$gateway_N5,$ip_N6,$mask_N6,$gateway_N6,$ip_N7,$mask_N7,$gateway_N7) -AsJob 
         $Null = Wait-Job -Job $Job
        Remove-PSSession -Session $Session
    }
}
elseif(($Computer1.length -eq 0) -Or ($Computer2.length -eq 0)){
      
    Add-Type -AssemblyName System.Windows.Forms
    $errorMsg = "No puede quedar en blanco la dirección ip.
    Vuelva a intentarlo nuevamente."
        $caption = "Error de contenido"
        [System.Windows.Forms.MessageBox]::Show($errorMsg, $caption)
   
}


elseif(($validacion1 -eq $false) -Or ($validacion2 -eq $false)){
Add-Type -AssemblyName System.Windows.Forms
$errorMsg = "Datos erróneos.
Vuelva a intentarlo nuevamente."
    $caption = "Error de contenido"
    [System.Windows.Forms.MessageBox]::Show($errorMsg, $caption)
}
}
else{
    $Username = "Administrador"
    $Password = "R3c542016C4ll"
    $Computer1=$textbox2.Text.Trim(); 
    $Computer2=$textbox3.Text.Trim(); 
    $ip1=$Computer1.Split(".");
    $ip2=$Computer2.Split("."); 
    $regip = [regex]"^((25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)\.){3}(25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)$"
    $validacion1 = $Computer1 -match $regip
    $validacion2 = $Computer2 -match $regip
    
    $Inicial=$Computer1.Split(".")
    $inicio0=$Inicial[0];
    $inicio1=$Inicial[1];
    $inicio2=$Inicial[2];
    [int]$inicio3=$Inicial[3];
    $primeraIP=$inicio0+"."+$inicio1+"."+$inicio2+"." ;
    
    $Final=$Computer2.Split(".")
    [int]$ultima3=$Final[3];
    $ip_N1=$TextBox100.Text;
    $mask_N1=$ComboBox110.SelectedItem.ToString();
    $gateway_N1=$TextBox104.Text;
    $ip_N2=$TextBox129.Text;
    $mask_N2=$ComboBox180.SelectedItem.ToString();
    $gateway_N2=$TextBox132.Text;
    $ip_N3=$TextBox125.Text;
    $mask_N3=$ComboBox170.SelectedItem.ToString();
    $gateway_N3=$TextBox128.Text;
    $ip_N4=$TextBox121.Text;
    $mask_N4=$ComboBox160.SelectedItem.ToString();
    $gateway_N4=$TextBox124.Text;
    $ip_N5=$TextBox117.Text;
    $mask_N5=$ComboBox150.SelectedItem.ToString();
    $gateway_N5=$TextBox120.Text;
    $ip_N6=$TextBox113.Text;
    $mask_N6=$ComboBox140.SelectedItem.ToString();
    $gateway_N6=$TextBox116.Text;
    $ip_N7=$TextBox190.Text;
    $mask_N7=$ComboBox130.SelectedItem.ToString();
    $gateway_N7=$TextBox118.Text;
    $ip_N8=$TextBox150.Text;
    $mask_N8=$ComboBox120.SelectedItem.ToString();
    $gateway_N8=$TextBox180.Text;
    if(($ip1[2] -eq $ip2[2]) -and ($ip1[3] -lt $ip2[3]) -and(($validacion1 -eq $true) -and ($validacion2 -eq $true) )){
      $agregarRutas={
         
            Param($Computer1,$Computer2,$ip_N1,$mask_N1,$gateway_N1,$ip_N2,$mask_N2,$gateway_N2,$ip_N3,$mask_N3,$gateway_N3,$ip_N4,$mask_N4,$gateway_N4,$ip_N5,$mask_N5,$gateway_N5,$ip_N6,$mask_N6,$gateway_N6,$ip_N7,$mask_N7,$gateway_N7,$ip_N8,$mask_N8,$gateway_N8)    

       
            route add -p $ip_N1/$mask_N1 $gateway_N1
            route add -p $ip_N2/$mask_N2 $gateway_N2
            route add -p $ip_N3/$mask_N3 $gateway_N3
            route add -p $ip_N4/$mask_N4 $gateway_N4
            route add -p $ip_N5/$mask_N5 $gateway_N5
            route add -p $ip_N6/$mask_N6 $gateway_N6
            route add -p $ip_N7/$mask_N7 $gateway_N7
            route add -p $ip_N8/$mask_N8 $gateway_N8
    }  
    $SecurePassword = ConvertTo-SecureString -AsPlainText $Password -Force
    $Cred = New-Object -TypeName "System.Management.Automation.PSCredential" -ArgumentList $Username, $SecurePassword
        
    for($inicio3;$inicio3 -le $ultima3;$inicio3++){
        $Computer3=$primeraIP+$inicio3;

    $Session = New-PSSession -ComputerName $Computer3 -Credential $Cred
    Write-Host "Iniciando Sesion en $Computer3"
        
         #Invocando comandos
         $Job = Invoke-Command -Session $Session  -ScriptBlock $agregarRutas -ArgumentList ($Computer1,$Computer2,$ip_N1,$mask_N1,$gateway_N1,$ip_N2,$mask_N2,$gateway_N2,$ip_N3,$mask_N3,$gateway_N3,$ip_N4,$mask_N4,$gateway_N4,$ip_N5,$mask_N5,$gateway_N5,$ip_N6,$mask_N6,$gateway_N6,$ip_N7,$mask_N7,$gateway_N7,$ip_N8,$mask_N8,$gateway_N8) -AsJob 
         $Null = Wait-Job -Job $Job
        Remove-PSSession -Session $Session
}
     
}
elseif(($Computer1.length -eq 0) -Or ($Computer2.length -eq 0)){
      
    Add-Type -AssemblyName System.Windows.Forms
    $errorMsg = "No puede quedar en blanco la dirección ip.
    Vuelva a intentarlo nuevamente."
        $caption = "Error de contenido"
        [System.Windows.Forms.MessageBox]::Show($errorMsg, $caption)
   
}


elseif(($validacion1 -eq $false) -Or ($validacion2 -eq $false)){
Add-Type -AssemblyName System.Windows.Forms
$errorMsg = "Datos erróneos.
Vuelva a intentarlo nuevamente."
    $caption = "Error de contenido"
    [System.Windows.Forms.MessageBox]::Show($errorMsg, $caption)
}
}
  }
  elseif($comboBox1.SelectedItem -eq 'IP'){
    if($comboBox5.SelectedItem -eq 1){

        $Username = "Administrador"
        $Password = "R3c542016C4ll"
    
        $Computer=$textbox1.Text; 
        $ip_N1=$TextBox100.Text;
        $mask_N1=$ComboBox110.SelectedItem.ToString();
        $gateway_N1=$TextBox104.Text;
       
          $agregarRutas={
             
                Param($Computer,$ip_N1,$mask_N1,$gateway_N1)    
    
           
                route add -p $ip_N1/$mask_N1 $gateway_N1
       
            
        
    
        }  
        $SecurePassword = ConvertTo-SecureString -AsPlainText $Password -Force
        $Cred = New-Object -TypeName "System.Management.Automation.PSCredential" -ArgumentList $Username, $SecurePassword
            $Session = New-PSSession -ComputerName $Computer -Credential $Cred
         
            
             #Invocando comandos
             $Job = Invoke-Command -Session $Session  -ScriptBlock $agregarRutas -ArgumentList ($Computer,$ip_N1,$mask_N1,$gateway_N1) -AsJob 
             $Null = Wait-Job -Job $Job
            Remove-PSSession -Session $Session
    
    
    
    }
    elseif ($comboBox5.SelectedItem -eq 2) {
        $Username = "Administrador"
        $Password = "R3c542016C4ll"
    
        $Computer=$textbox1.Text; 
        $ip_N1=$TextBox100.Text;
        $mask_N1=$ComboBox110.SelectedItem.ToString();
        $gateway_N1=$TextBox104.Text;
        $ip_N2=$TextBox129.Text;
        $mask_N2=$ComboBox180.SelectedItem.ToString();
        $gateway_N2=$TextBox132.Text;
       
          $agregarRutas={
             
                Param($Computer,$ip_N1,$mask_N1,$gateway_N1,$ip_N2,$mask_N2,$gateway_N2)    
    
           
                route add -p $ip_N1/$mask_N1 $gateway_N1
                route add -p $ip_N2/$mask_N2 $gateway_N2
            
        
    
        }  
        $SecurePassword = ConvertTo-SecureString -AsPlainText $Password -Force
        $Cred = New-Object -TypeName "System.Management.Automation.PSCredential" -ArgumentList $Username, $SecurePassword
            $Session = New-PSSession -ComputerName $Computer -Credential $Cred
         
            
             #Invocando comandos
             $Job = Invoke-Command -Session $Session  -ScriptBlock $agregarRutas -ArgumentList ($Computer,$ip_N1,$mask_N1,$gateway_N1,$ip_N2,$mask_N2,$gateway_N2) -AsJob 
             $Null = Wait-Job -Job $Job
            Remove-PSSession -Session $Session
    
    }
    elseif ($comboBox5.SelectedItem -eq 3) {
        $Username = "Administrador"
        $Password = "R3c542016C4ll"
    
        $Computer=$textbox1.Text; 
        $ip_N1=$TextBox100.Text;
        $mask_N1=$ComboBox110.SelectedItem.ToString();
        $gateway_N1=$TextBox104.Text;
        $ip_N2=$TextBox129.Text;
        $mask_N2=$ComboBox180.SelectedItem.ToString();
        $gateway_N2=$TextBox132.Text;
        $ip_N3=$TextBox125.Text;
        $mask_N3=$ComboBox170.SelectedItem.ToString();
        $gateway_N3=$TextBox128.Text;
       
          $agregarRutas={
             
                Param($Computer,$ip_N1,$mask_N1,$gateway_N1,$ip_N2,$mask_N2,$gateway_N2,$ip_N3,$mask_N3,$gateway_N3)    
    
           
                route add -p $ip_N1/$mask_N1 $gateway_N1
                route add -p $ip_N2/$mask_N2 $gateway_N2
                route add -p $ip_N3/$mask_N3 $gateway_N3
        
    
        }  
        $SecurePassword = ConvertTo-SecureString -AsPlainText $Password -Force
        $Cred = New-Object -TypeName "System.Management.Automation.PSCredential" -ArgumentList $Username, $SecurePassword
            $Session = New-PSSession -ComputerName $Computer -Credential $Cred
         
            
             #Invocando comandos
             $Job = Invoke-Command -Session $Session  -ScriptBlock $agregarRutas -ArgumentList ($Computer,$ip_N1,$mask_N1,$gateway_N1,$ip_N2,$mask_N2,$gateway_N2,$ip_N3,$mask_N3,$gateway_N3) -AsJob 
             $Null = Wait-Job -Job $Job
            Remove-PSSession -Session $Session
    
    }
    elseif ($comboBox5.SelectedItem -eq 4) {
        $Username = "Administrador"
        $Password = "R3c542016C4ll"
    
        $Computer=$textbox1.Text; 
        $ip_N1=$TextBox100.Text;
        $mask_N1=$ComboBox110.SelectedItem.ToString();
        $gateway_N1=$TextBox104.Text;
        $ip_N2=$TextBox129.Text;
        $mask_N2=$ComboBox180.SelectedItem.ToString();
        $gateway_N2=$TextBox132.Text;
        $ip_N3=$TextBox125.Text;
        $mask_N3=$ComboBox170.SelectedItem.ToString();
        $gateway_N3=$TextBox128.Text;
        $ip_N4=$TextBox121.Text;
        $mask_N4=$ComboBox160.SelectedItem.ToString();
        $gateway_N4=$TextBox124.Text;
       
          $agregarRutas={
             
                Param($Computer,$ip_N1,$mask_N1,$gateway_N1,$ip_N2,$mask_N2,$gateway_N2,$ip_N3,$mask_N3,$gateway_N3,$ip_N4,$mask_N4,$gateway_N4)    
    
           
                route add -p $ip_N1/$mask_N1 $gateway_N1
                route add -p $ip_N2/$mask_N2 $gateway_N2
                route add -p $ip_N3/$mask_N3 $gateway_N3
                route add -p $ip_N4/$mask_N4 $gateway_N4
        
    
        }  
        $SecurePassword = ConvertTo-SecureString -AsPlainText $Password -Force
        $Cred = New-Object -TypeName "System.Management.Automation.PSCredential" -ArgumentList $Username, $SecurePassword
            $Session = New-PSSession -ComputerName $Computer -Credential $Cred
         
            
             #Invocando comandos
             $Job = Invoke-Command -Session $Session  -ScriptBlock $agregarRutas -ArgumentList ($Computer,$ip_N1,$mask_N1,$gateway_N1,$ip_N2,$mask_N2,$gateway_N2,$ip_N3,$mask_N3,$gateway_N3,$ip_N4,$mask_N4,$gateway_N4) -AsJob 
             $Null = Wait-Job -Job $Job
            Remove-PSSession -Session $Session
    
        
    }
    elseif ($comboBox5.SelectedItem -eq 5) {
        $Username = "Administrador"
        $Password = "R3c542016C4ll"
    
        $Computer=$textbox1.Text; 
        $ip_N1=$TextBox100.Text;
        $mask_N1=$ComboBox110.SelectedItem.ToString();
        $gateway_N1=$TextBox104.Text;
        $ip_N2=$TextBox129.Text;
        $mask_N2=$ComboBox180.SelectedItem.ToString();
        $gateway_N2=$TextBox132.Text;
        $ip_N3=$TextBox125.Text;
        $mask_N3=$ComboBox170.SelectedItem.ToString();
        $gateway_N3=$TextBox128.Text;
        $ip_N4=$TextBox121.Text;
        $mask_N4=$ComboBox160.SelectedItem.ToString();
        $gateway_N4=$TextBox124.Text;
        $ip_N5=$TextBox117.Text;
        $mask_N5=$ComboBox150.SelectedItem.ToString();
        $gateway_N5=$TextBox120.Text;
    
    
    
       
          $agregarRutas={
             
                Param($Computer,$ip_N1,$mask_N1,$gateway_N1,$ip_N2,$mask_N2,$gateway_N2,$ip_N3,$mask_N3,$gateway_N3,$ip_N4,$mask_N4,$gateway_N4,$ip_N5,$mask_N5,$gateway_N5)    
    
           
                route add -p $ip_N1/$mask_N1 $gateway_N1
                route add -p $ip_N2/$mask_N2 $gateway_N2
                route add -p $ip_N3/$mask_N3 $gateway_N3
                route add -p $ip_N4/$mask_N4 $gateway_N4
                route add -p $ip_N5/$mask_N5 $gateway_N5
        
    
        }  
        $SecurePassword = ConvertTo-SecureString -AsPlainText $Password -Force
        $Cred = New-Object -TypeName "System.Management.Automation.PSCredential" -ArgumentList $Username, $SecurePassword
            $Session = New-PSSession -ComputerName $Computer -Credential $Cred
         
            
             #Invocando comandos
             $Job = Invoke-Command -Session $Session  -ScriptBlock $agregarRutas -ArgumentList ($Computer,$ip_N1,$mask_N1,$gateway_N1,$ip_N2,$mask_N2,$gateway_N2,$ip_N3,$mask_N3,$gateway_N3,$ip_N4,$mask_N4,$gateway_N4,$ip_N5,$mask_N5,$gateway_N5) -AsJob 
             $Null = Wait-Job -Job $Job
            Remove-PSSession -Session $Session
    }
    elseif ($comboBox5.SelectedItem -eq 6) {
        $Username = "Administrador"
        $Password = "R3c542016C4ll"
    
        $Computer=$textbox1.Text; 
        $ip_N1=$TextBox100.Text;
        $mask_N1=$ComboBox110.SelectedItem.ToString();
        $gateway_N1=$TextBox104.Text;
        $ip_N2=$TextBox129.Text;
        $mask_N2=$ComboBox180.SelectedItem.ToString();
        $gateway_N2=$TextBox132.Text;
        $ip_N3=$TextBox125.Text;
        $mask_N3=$ComboBox170.SelectedItem.ToString();
        $gateway_N3=$TextBox128.Text;
        $ip_N4=$TextBox121.Text;
        $mask_N4=$ComboBox160.SelectedItem.ToString();
        $gateway_N4=$TextBox124.Text;
        $ip_N5=$TextBox117.Text;
        $mask_N5=$ComboBox150.SelectedItem.ToString();
        $gateway_N5=$TextBox120.Text;
        $ip_N6=$TextBox113.Text;
        $mask_N6=$ComboBox140.SelectedItem.ToString();
        $gateway_N6=$TextBox116.Text;
    
    
       
          $agregarRutas={
             
                Param($Computer,$ip_N1,$mask_N1,$gateway_N1,$ip_N2,$mask_N2,$gateway_N2,$ip_N3,$mask_N3,$gateway_N3,$ip_N4,$mask_N4,$gateway_N4,$ip_N5,$mask_N5,$gateway_N5,$ip_N6,$mask_N6,$gateway_N6)    
    
           
                route add -p $ip_N1/$mask_N1 $gateway_N1
                route add -p $ip_N2/$mask_N2 $gateway_N2
                route add -p $ip_N3/$mask_N3 $gateway_N3
                route add -p $ip_N4/$mask_N4 $gateway_N4
                route add -p $ip_N5/$mask_N5 $gateway_N5
                route add -p $ip_N6/$mask_N6 $gateway_N6
    
        }  
        $SecurePassword = ConvertTo-SecureString -AsPlainText $Password -Force
        $Cred = New-Object -TypeName "System.Management.Automation.PSCredential" -ArgumentList $Username, $SecurePassword
            $Session = New-PSSession -ComputerName $Computer -Credential $Cred
         
            
             #Invocando comandos
             $Job = Invoke-Command -Session $Session  -ScriptBlock $agregarRutas -ArgumentList ($Computer,$ip_N1,$mask_N1,$gateway_N1,$ip_N2,$mask_N2,$gateway_N2,$ip_N3,$mask_N3,$gateway_N3,$ip_N4,$mask_N4,$gateway_N4,$ip_N5,$mask_N5,$gateway_N5,$ip_N6,$mask_N6,$gateway_N6) -AsJob 
             $Null = Wait-Job -Job $Job
            Remove-PSSession -Session $Session
    }
    elseif ($comboBox5.SelectedItem -eq 7) {
        $Username = "Administrador"
        $Password = "R3c542016C4ll"
    
        $Computer=$textbox1.Text; 
        $ip_N1=$TextBox100.Text;
        $mask_N1=$ComboBox110.SelectedItem.ToString();
        $gateway_N1=$TextBox104.Text;
        $ip_N2=$TextBox129.Text;
        $mask_N2=$ComboBox180.SelectedItem.ToString();
        $gateway_N2=$TextBox132.Text;
        $ip_N3=$TextBox125.Text;
        $mask_N3=$ComboBox170.SelectedItem.ToString();
        $gateway_N3=$TextBox128.Text;
        $ip_N4=$TextBox121.Text;
        $mask_N4=$ComboBox160.SelectedItem.ToString();
        $gateway_N4=$TextBox124.Text;
        $ip_N5=$TextBox117.Text;
        $mask_N5=$ComboBox150.SelectedItem.ToString();
        $gateway_N5=$TextBox120.Text;
        $ip_N6=$TextBox113.Text;
        $mask_N6=$ComboBox140.SelectedItem.ToString();
        $gateway_N6=$TextBox116.Text;
        $ip_N7=$TextBox190.Text;
        $mask_N7=$ComboBox130.SelectedItem.ToString();
        $gateway_N7=$TextBox118.Text;
    
       
          $agregarRutas={
             
                Param($Computer,$ip_N1,$mask_N1,$gateway_N1,$ip_N2,$mask_N2,$gateway_N2,$ip_N3,$mask_N3,$gateway_N3,$ip_N4,$mask_N4,$gateway_N4,$ip_N5,$mask_N5,$gateway_N5,$ip_N6,$mask_N6,$gateway_N6,$ip_N7,$mask_N7,$gateway_N7)    
    
           
                route add -p $ip_N1/$mask_N1 $gateway_N1
                route add -p $ip_N2/$mask_N2 $gateway_N2
                route add -p $ip_N3/$mask_N3 $gateway_N3
                route add -p $ip_N4/$mask_N4 $gateway_N4
                route add -p $ip_N5/$mask_N5 $gateway_N5
                route add -p $ip_N6/$mask_N6 $gateway_N6
                route add -p $ip_N7/$mask_N7 $gateway_N7
        }  
        $SecurePassword = ConvertTo-SecureString -AsPlainText $Password -Force
        $Cred = New-Object -TypeName "System.Management.Automation.PSCredential" -ArgumentList $Username, $SecurePassword
            $Session = New-PSSession -ComputerName $Computer -Credential $Cred
         
            
             #Invocando comandos
             $Job = Invoke-Command -Session $Session  -ScriptBlock $agregarRutas -ArgumentList ($Computer,$ip_N1,$mask_N1,$gateway_N1,$ip_N2,$mask_N2,$gateway_N2,$ip_N3,$mask_N3,$gateway_N3,$ip_N4,$mask_N4,$gateway_N4,$ip_N5,$mask_N5,$gateway_N5,$ip_N6,$mask_N6,$gateway_N6,$ip_N7,$mask_N7,$gateway_N7) -AsJob 
             $Null = Wait-Job -Job $Job
            Remove-PSSession -Session $Session
    }
    else{
        $Username = "Administrador"
        $Password = "R3c542016C4ll"
    
        $Computer=$textbox1.Text; 
        $ip_N1=$TextBox100.Text;
        $mask_N1=$ComboBox110.SelectedItem.ToString();
        $gateway_N1=$TextBox104.Text;
        $ip_N2=$TextBox129.Text;
        $mask_N2=$ComboBox180.SelectedItem.ToString();
        $gateway_N2=$TextBox132.Text;
        $ip_N3=$TextBox125.Text;
        $mask_N3=$ComboBox170.SelectedItem.ToString();
        $gateway_N3=$TextBox128.Text;
        $ip_N4=$TextBox121.Text;
        $mask_N4=$ComboBox160.SelectedItem.ToString();
        $gateway_N4=$TextBox124.Text;
        $ip_N5=$TextBox117.Text;
        $mask_N5=$ComboBox150.SelectedItem.ToString();
        $gateway_N5=$TextBox120.Text;
        $ip_N6=$TextBox113.Text;
        $mask_N6=$ComboBox140.SelectedItem.ToString();
        $gateway_N6=$TextBox116.Text;
        $ip_N7=$TextBox190.Text;
        $mask_N7=$ComboBox130.SelectedItem.ToString();
        $gateway_N7=$TextBox118.Text;
        $ip_N8=$TextBox150.Text;
        $mask_N8=$ComboBox120.SelectedItem.ToString();
        $gateway_N8=$TextBox180.Text;
       
          $agregarRutas={
             
                Param($Computer,$ip_N1,$mask_N1,$gateway_N1,$ip_N2,$mask_N2,$gateway_N2,$ip_N3,$mask_N3,$gateway_N3,$ip_N4,$mask_N4,$gateway_N4,$ip_N5,$mask_N5,$gateway_N5,$ip_N6,$mask_N6,$gateway_N6,$ip_N7,$mask_N7,$gateway_N7,$ip_N8,$mask_N8,$gateway_N8)    
    
           
                route add -p $ip_N1/$mask_N1 $gateway_N1
                route add -p $ip_N2/$mask_N2 $gateway_N2
                route add -p $ip_N3/$mask_N3 $gateway_N3
                route add -p $ip_N4/$mask_N4 $gateway_N4
                route add -p $ip_N5/$mask_N5 $gateway_N5
                route add -p $ip_N6/$mask_N6 $gateway_N6
                route add -p $ip_N7/$mask_N7 $gateway_N7
                route add -p $ip_N8/$mask_N8 $gateway_N8
        }  
        $SecurePassword = ConvertTo-SecureString -AsPlainText $Password -Force
        $Cred = New-Object -TypeName "System.Management.Automation.PSCredential" -ArgumentList $Username, $SecurePassword
            $Session = New-PSSession -ComputerName $Computer -Credential $Cred
         
            
             #Invocando comandos
             $Job = Invoke-Command -Session $Session  -ScriptBlock $agregarRutas -ArgumentList ($Computer,$ip_N1,$mask_N1,$gateway_N1,$ip_N2,$mask_N2,$gateway_N2,$ip_N3,$mask_N3,$gateway_N3,$ip_N4,$mask_N4,$gateway_N4,$ip_N5,$mask_N5,$gateway_N5,$ip_N6,$mask_N6,$gateway_N6,$ip_N7,$mask_N7,$gateway_N7,$ip_N8,$mask_N8,$gateway_N8) -AsJob 
             $Null = Wait-Job -Job $Job
            Remove-PSSession -Session $Session
    }
         
    








  }