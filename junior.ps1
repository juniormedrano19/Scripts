$ruta=[Environment]::GetFolderPath("Desktop")
if (!(Test-Path "$ruta\logsRed")) {
#New-Item  –ItemType Directory -Path "$ruta\logsRed"
mkdir  $ruta\logsRed
}


if($comboBox1.SelectedItem -eq 'RANGO DE IPS')
{

$Username = "Administrador"
$Password = "R3c542016C4ll"

$Computer1=$textbox2.Text.Trim(); 
$Computer2=$textbox3.Text.Trim(); 
$texto4=$textbox4.Text.Trim();

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

if(($ip1[2] -eq $ip2[2]) -and ($ip1[3] -lt $ip2[3]) -and(($validacion1 -eq $true) -and ($validacion2 -eq $true) )){

  $cambio={
     
        Param($Computer1,$Computer2,$texto4)    



Write-Host $texto4
$direccionIp=$Computer1.split(".");
$nuevaip=$direccionIp[0]+"."+$direccionIp[1]+"."+$direccionIp[2]+"."+$texto4



  $oreo= get-wmiobject win32_networkadapter | where-object {$_.netconnectionstatus -eq 2 -and $_.ServiceName -eq 'rt640x64' }
          
        $clima=get-wmiobject win32_networkadapterconfiguration|where-object {$_.Index -eq $oreo.DeviceID};
         $clima.SetGateways($nuevaip);

    


}  
$SecurePassword = ConvertTo-SecureString -AsPlainText $Password -Force
$Cred = New-Object -TypeName "System.Management.Automation.PSCredential" -ArgumentList $Username, $SecurePassword
  



for($inicio3;$inicio3 -le $ultima3;$inicio3++){
    $Computer3=$primeraIP+$inicio3;

  
    $hora=Get-Date -DisplayHint DateTime

$Session = New-PSSession -ComputerName $Computer3 -Credential $Cred
if($Session -eq $Null){
  #Write-Host "No se puede conectar" -ForegroundColor Blue -Background White
  "No se pudo conectar(Rango) en $Computer3" + " - " + $hora >> "$ruta\logsRed\log.txt"
    # $outputBox1.text= "No se pudo conectar en $ipAntiguaInicial"+ " - " + $hora;   
    $Message="No se pudo conectar(Rango) en $Computer3"+ " - " + $hora;   
      $textbox8.AppendText("`r`n$Message");
         $textbox8.Refresh()
     $textbox8.ScrollToCaret()
     }
    else{
     #Invocando comandos
     $Job = Invoke-Command -Session $Session  -ScriptBlock $cambio -ArgumentList ($Computer1,$Computer2,$texto4) -AsJob 
     $Null = Wait-Job -Job $Job
    Remove-PSSession -Session $Session
    "Cambiar Gateway -(Rango) Inicio exitoso en $Computer3" + " - " + $hora >>  "$ruta\logsRed\log.txt"
    #$outputBox1.text= "Inicio exitoso en $ipNewInicial"
 $Message="Cambiar Gateway -(Rango) Inicio exitoso en $Computer3";   
 $textbox8.AppendText("`r`n$Message");
 $textbox8.Refresh()
$textbox8.ScrollToCaret()
    }
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

elseif($comboBox1.SelectedItem -eq 'IP'){
    $Username = "Administrador"
    $Password = "R3c542016C4ll"
  
    $Computer=$textbox1.Text; 
    $texto4=$textbox4.Text.Trim();
  
      $cambio={
         
            Param($Computer,$texto4)    
  
  
  
  Write-Host $texto4
  $direccionIp=$Computer.split(".");
  $nuevaip=$direccionIp[0]+"."+$direccionIp[1]+"."+$direccionIp[2]+"."+$texto4
  
  
  
      $oreo= get-wmiobject win32_networkadapter | where-object {$_.netconnectionstatus -eq 2 -and $_.ServiceName -eq 'rt640x64' }
              
            $clima=get-wmiobject win32_networkadapterconfiguration|where-object {$_.Index -eq $oreo.DeviceID};
             $clima.SetGateways($nuevaip);
   
        
    
  
    }  
    $SecurePassword = ConvertTo-SecureString -AsPlainText $Password -Force
    $Cred = New-Object -TypeName "System.Management.Automation.PSCredential" -ArgumentList $Username, $SecurePassword
    $hora=Get-Date -DisplayHint DateTime
   
    $Session = New-PSSession -ComputerName $Computer -Credential $Cred
    if($Session -eq $Null){
      #Write-Host "No se puede conectar" -ForegroundColor Blue -Background White
      "No se pudo conectar(IP) en $Computer" + " - " + $hora >> "$ruta\logsRed\log.txt"
        # $outputBox1.text= "No se pudo conectar en $ipAntiguaInicial"+ " - " + $hora;   
        $Message="No se pudo conectar(IP) en $Computer"+ " - " + $hora;   
          $textbox8.AppendText("`r`n$Message");
             $textbox8.Refresh()
         $textbox8.ScrollToCaret()
         }
        else{

        
         #Invocando comandos
         $Job = Invoke-Command -Session $Session  -ScriptBlock $cambio -ArgumentList ($Computer,$texto4) -AsJob 
         $Null = Wait-Job -Job $Job
        Remove-PSSession -Session $Session
        "Cambiar Gateway -(IP)Inicio exitoso en $Computer" + " - " + $hora >>  "$ruta\logsRed\log.txt"
        #$outputBox1.text= "Inicio exitoso en $ipNewInicial"
     $Message="Cambiar Gateway -(IP)Inicio exitoso en $Computer";   
     $textbox8.AppendText("`r`n$Message");
     $textbox8.Refresh()
  $textbox8.ScrollToCaret()
        }
  
  
}
elseif($comboBox1.SelectedItem -eq 'ARCHIVO TXT'){
    $Username = "Administrador"
    $Password = "R3c542016C4ll"
    
   $Computer=Get-Content $OpenFileDialog.FileName


    #$Computer1=$textbox2.Text.Trim(); 
    #$Computer2=$textbox3.Text.Trim(); 
    $texto4=$textbox4.Text.Trim();
    
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
    
    if(($ip1[2] -eq $ip2[2]) -and ($ip1[3] -lt $ip2[3]) -and(($validacion1 -eq $true) -and ($validacion2 -eq $true) )){
    
      $cambio={
         
            Param($texto4)    
    
    
    
    Write-Host $texto4
    $direccionIp=$Computer1.split(".");
    $nuevaip=$direccionIp[0]+"."+$direccionIp[1]+"."+$direccionIp[2]+"."+$texto4
    
    
    
      $oreo= get-wmiobject win32_networkadapter | where-object {$_.netconnectionstatus -eq 2 -and $_.ServiceName -eq 'rt640x64' }
              
            $clima=get-wmiobject win32_networkadapterconfiguration|where-object {$_.Index -eq $oreo.DeviceID};
             $clima.SetGateways($nuevaip);
    
        
    
    
    }  
    $SecurePassword = ConvertTo-SecureString -AsPlainText $Password -Force
    $Cred = New-Object -TypeName "System.Management.Automation.PSCredential" -ArgumentList $Username, $SecurePassword
      
    
    foreach($newComputer in $Computer){
    
    
      
        $hora=Get-Date -DisplayHint DateTime
    
    $Session = New-PSSession -ComputerName $newComputer -Credential $Cred
    if($Session -eq $Null){
      #Write-Host "No se puede conectar" -ForegroundColor Blue -Background White
      "No se pudo conectar(Rango) en $newComputer" + " - " + $hora >> "$ruta\logsRed\log.txt"
        # $outputBox1.text= "No se pudo conectar en $ipAntiguaInicial"+ " - " + $hora;   
        $Message="No se pudo conectar(Rango) en $newComputer"+ " - " + $hora;   
          $textbox8.AppendText("`r`n$Message");
             $textbox8.Refresh()
         $textbox8.ScrollToCaret()
         }
        else{
         #Invocando comandos
         $Job = Invoke-Command -Session $Session  -ScriptBlock $cambio -ArgumentList ($Computer1,$Computer2,$texto4) -AsJob 
         $Null = Wait-Job -Job $Job
        Remove-PSSession -Session $Session
        "Cambiar Gateway -(Rango) Inicio exitoso en $newComputer" + " - " + $hora >>  "$ruta\logsRed\log.txt"
        #$outputBox1.text= "Inicio exitoso en $ipNewInicial"
     $Message="Cambiar Gateway -(Rango) Inicio exitoso en $newComputer";   
     $textbox8.AppendText("`r`n$Message");
     $textbox8.Refresh()
    $textbox8.ScrollToCaret()
        }
    
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