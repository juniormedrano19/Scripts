[void] [System.Reflection.Assembly]::LoadWithPartialName("System.Drawing") 
[void] [System.Reflection.Assembly]::LoadWithPartialName("System.Windows.Forms")  
$textbox1 = New-Object 'System.Windows.Forms.TextBox'
$textbox3 = New-Object 'System.Windows.Forms.TextBox'
$textbox2 = New-Object 'System.Windows.Forms.TextBox'
$textbox4=New-Object 'System.Windows.Forms.TextBox'
$textbox5=New-Object 'System.Windows.Forms.TextBox'
$Button = New-Object 'System.Windows.Forms.Button'
	$Button2 = New-Object 'System.Windows.Forms.Button'
	$Button1 = New-Object 'System.Windows.Forms.Button'
    $Button3 = New-Object 'System.Windows.Forms.Button'
    $Button4 = New-Object 'System.Windows.Forms.Button'
    $Button5 = New-Object 'System.Windows.Forms.Button'
    $Button6 = New-Object 'System.Windows.Forms.Button'
$Form = New-Object System.Windows.Forms.Form 

Function Get-FileName
{  
    $AssemblyFullName = 'System.Windows.Forms, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089'
    $Assembly = [System.Reflection.Assembly]::Load($AssemblyFullName)
    $OpenFileDialog = [System.Windows.Forms.OpenFileDialog]::new()
    $OpenFileDialog.AddExtension = $false
    $OpenFileDialog.CheckFileExists = $false
    $OpenFileDialog.DereferenceLinks = $true
    $OpenFileDialog.Filter = "Folders|`n"
    $OpenFileDialog.Multiselect = $false
    $OpenFileDialog.Title = "Select folder"
    $OpenFileDialogType = $OpenFileDialog.GetType()
    $FileDialogInterfaceType = $Assembly.GetType('System.Windows.Forms.FileDialogNative+IFileDialog')
    $IFileDialog = $OpenFileDialogType.GetMethod('CreateVistaDialog',@('NonPublic','Public','Static','Instance')).Invoke($OpenFileDialog,$null)
    $OpenFileDialogType.GetMethod('OnBeforeVistaDialog',@('NonPublic','Public','Static','Instance')).Invoke($OpenFileDialog,$IFileDialog)
    [uint32]$PickFoldersOption = $Assembly.GetType('System.Windows.Forms.FileDialogNative+FOS').GetField('FOS_PICKFOLDERS').GetValue($null)
    $FolderOptions = $OpenFileDialogType.GetMethod('get_Options',@('NonPublic','Public','Static','Instance')).Invoke($OpenFileDialog,$null) -bor $PickFoldersOption
    $FileDialogInterfaceType.GetMethod('SetOptions',@('NonPublic','Public','Static','Instance')).Invoke($IFileDialog,$FolderOptions)
    $VistaDialogEvent = [System.Activator]::CreateInstance($AssemblyFullName,'System.Windows.Forms.FileDialog+VistaDialogEvents',$false,0,$null,$OpenFileDialog,$null,$null).Unwrap()
    [uint32]$AdviceCookie = 0
    $AdvisoryParameters = @($VistaDialogEvent,$AdviceCookie)
    $AdviseResult = $FileDialogInterfaceType.GetMethod('Advise',@('NonPublic','Public','Static','Instance')).Invoke($IFileDialog,$AdvisoryParameters)
    $AdviceCookie = $AdvisoryParameters[1]
    $Result = $FileDialogInterfaceType.GetMethod('Show',@('NonPublic','Public','Static','Instance')).Invoke($IFileDialog,[System.IntPtr]::Zero)
    $FileDialogInterfaceType.GetMethod('Unadvise',@('NonPublic','Public','Static','Instance')).Invoke($IFileDialog,$AdviceCookie)
    if ($Result -eq [System.Windows.Forms.DialogResult]::OK) {
      $FileDialogInterfaceType.GetMethod('GetResult',@('NonPublic','Public','Static','Instance')).Invoke($IFileDialog,$null)
      
    }

    
 $textbox1.Text= $OpenFileDialog.filename

$prueba=Get-ChildItem $OpenFileDialog.filename
$textbox3.Text=$prueba.Length;
#$prueba=Get-ChildItem C:\Users\jmedrano\Desktop\pruebita\
$suma=0;
$nombreRuta=$OpenFileDialog.filename
for($i=0;$i -lt $prueba.Length;$i++){
 $nombre=$prueba[$i].Name
   $ruta=Get-ChildItem "$nombreRuta\$nombre"

 $suma=$suma+$ruta.Length


}

$textbox2.Text= $suma

$prueba1=Get-ChildItem -Path $nombreRuta -File -Recurse | Measure-Object -Property Length -Sum
$redondeo=$prueba1.Sum 
$byte=1048576 
$operacion=$redondeo/$byte
$byteMega= 'Mb'
$rounded=[math]::Round($operacion,2)
$textbox4.Text= "$rounded $byteMega " ;
$byte1=1073741824 
$operacion1=$redondeo/$byte1
$byteGiga= 'Gb'
$rounded1=[math]::Round($operacion1,3)
$textbox5.Text="$rounded1 $byteGiga" ;

} #end function Get-FileName


function ConvertToMp3([switch] $inputObject, [string] $vlc = 'C:\Program Files (x86)\VideoLAN\VLC\vlc.exe') {
    process {
        Write-Host $_
        $bitrate = 160
$channels = 2
        $codec = $comboBox1.SelectedItem.ToString()
        $newFile = $_.FullName.Replace("'", "\'").Replace($_.Extension, ".$codec")
       # &"$vlc" -I dummy "$_" ":sout=#transcode{acodec=$codec,vcodec=dummy}:standard{access=file,mux=raw,dst=`'$newFile`'}" vlc://quit | out-null
       &"$vlc" -I dummy -vvv "$_" ":sout=#transcode{acodec=`"mp3`",ab=`"$bitrate`",`"channels=$channels`"}:standard{access=`"file`",mux=`"wav`",dst=`"$newFile`"}" vlc://quit | out-null
       
       # Uncomment the next line when you're sure everything is working right
        Remove-Item $_.FullName.Replace('[', '`[').Replace(']', '`]')
        $audio=Get-ItemProperty -Path $newFile

        if($audio.Length -gt 1000000){
            $texto="Mb"
            $operando=$audio.Length/1000000
            $redondear=[math]::Round($operando,2)
            $size= [string]$redondear +" "+$texto ;
   
          $dataGridView.Rows.Add($newFile,$size,"")
        }else{
            $texto1="Kb"
            $operando1=$audio.Length/1000
            $redondear1=[math]::Round($operando1,2)
            [string]$size= [string]$redondear1 +" "+ $texto1 ;
          
       $dataGridView.Rows.Add($newFile,$size,"")
        }
        $hora=Get-Date -DisplayHint DateTime
        $DesktopPath = [Environment]::GetFolderPath("Desktop")
        if (!(Test-Path "$DesktopPath\logs")) {
            New-item -path "$DesktopPath\logs" –type directory
            "La conversión fue exitosa en $newFile" + " - " + $hora >> $DesktopPath\logs\log_exitoso.txt
        }
        else{
            "La conversión fue exitosa en $newFile" + " - " + $hora >> $DesktopPath\logs\log_exitoso.txt
        }
      
    }
}

function ConvertAllToMp3([string] $sourcePath) {

   
if( ($textbox1.Text -eq '') -or ($comboBox1.Text -eq '')){
    Add-Type -AssemblyName System.Windows.Forms
$errorMsg = "No puede quedar en blanco el tipo de Extensión a Convertir.
Vuelva a intentarlo nuevamente."
    $caption = "Error de contenido"
    [System.Windows.Forms.MessageBox]::Show($errorMsg, $caption)
}else{


    $texto=$textbox2.Text
    Add-Type -AssemblyName PresentationCore,PresentationFramework
    $ButtonType = [System.Windows.MessageBoxButton]::YesNo
    $MessageboxTitle = "ADVERTENCIA"
    $Messageboxbody = "Desea continuar con la conversión de los $texto audios"
    $MessageIcon = [System.Windows.MessageBoxImage]::Warning
  $Resultado=  [System.Windows.MessageBox]::Show($Messageboxbody,$MessageboxTitle,$ButtonType,$messageicon)
if($Resultado -eq 'Yes'){
    Get-ChildItem "$sourcePath\*" -recurse -include *.wav,*.wma,*.aac,*.ogg,*.m4a,*.mp3 | ConvertToMp3
}
}



}

$Form.Size = New-Object System.Drawing.Size(1100,750)  
$Form.StartPosition = "CenterScreen" 
$Form.FormBorderStyle = [System.Windows.Forms.FormBorderStyle]::Sizable
$Form.MaximizeBox = $false
$Form.Text = "CONVERTIDOR DE AUDIO" 
# This base64 string holds the bytes that make up the orange 'G' icon (just an example for a 32x32 pixel image)
#$iconBase64      = 'iVBORw0KGgoAAAANSUhEUgAAACAAAAAgCAIAAAD8GO2jAAAAAXNSR0IArs4c6QAAAARnQU1BAACxjwv8YQUAAAAJcEhZcwAADsMAAA7DAcdvqGQAAAAZdEVYdFNvZnR3YXJlAHBhaW50Lm5ldCA0LjAuMTnU1rJkAAAB50lEQVRIS7WWzytEURTHZ2FhaWFhYWFhYWFhaWFh6c+wsGCapJBJU0hRSrOgLBVSmkQoSpqyUJISapIFJU0i1KQp1PG9826vO9+Z97Pr22dz3pxzv/PO/fUSkvxfOLYOx9bh2DocBzPZKlPtku2VuS7JtMlwIydUw7EnGO50Rd4ehPRdlru87GWUMZVU4LgOqLza0cP56PdHNga4NthgsUc+i3qIQOH9qDzAYLZTyiVd7Ah/8/lGztclNyLbY5JfksKxeuiKRvAzwOy93OsyR+9Pam6HajLHm5UfXhTQT34GqDH1eCGjTZxjkmqQmQ5+6Gdgth5NQLsoIRwca7AoTZ1k1UM0p7Y/QXCsof4sdOvRrRlgeZgyu49eY/0cTDO76ShzcJnTQ0O0NvA2XioWqjIrcKy5PdQ1kLl90CKsVC9F2GiYVVPuiQaDiRb1TzGWw9eHzoEiGGwO6hpHWFRe04vuu4pggCPIFPwowSWmAXa/qdKr5zaOaQBwyps6W+UEh/gGtasFlrjCKC2+ATia15WucHpf76vna/2ylVLntnmeRzbApsUQ4RXZwAFnAC7eMMLNSrWhDEC6RfUac1D3+sRew87HhVzvC4PjYLBecRxhDsByn/qEoYRqOLYOx9bh2DocWyaZ+APgBBKhVfsHwAAAAABJRU5ErkJggg=='
$iconBase64      = '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'
$iconBytes       = [Convert]::FromBase64String($iconBase64)
$stream          = New-Object IO.MemoryStream($iconBytes, 0, $iconBytes.Length)
$stream.Write($iconBytes, 0, $iconBytes.Length);
$iconImage       = [System.Drawing.Image]::FromStream($stream, $true)
$Form.Icon       = [System.Drawing.Icon]::FromHandle((New-Object System.Drawing.Bitmap -Argument $stream).GetHIcon())




$Form.Controls.Add($textbox1)
$Form.Controls.Add($textbox3)
$Form.Controls.Add($textbox2)
$Form.Controls.Add($textbox4)
$Form.Controls.Add($textbox5)


#Etiqueta de Ruta de Ubicación

$label                           = New-Object system.Windows.Forms.Label
$label.text                      = "Ruta de ubicación"
$label.AutoSize                  = $true
$label.width                     = 40
$label.height                    = 30
$label.location                  = New-Object System.Drawing.Point(55,30)
$label.Font                      = 'Comic Sans MS,10'
$Form.Controls.Add($label) 

#Etiqueta de Total de Archivos

$label2                           = New-Object system.Windows.Forms.Label
$label2.text                      = "Total de Archivos"
$label2.AutoSize                  = $true
$label2.width                     = 40
$label2.height                    = 30
$label2.location                  = New-Object System.Drawing.Point(55,75)
$label2.Font                      = 'Comic Sans MS,10'
$Form.Controls.Add($label2) 
###################
$label3                           = New-Object system.Windows.Forms.Label
$label3.text                      = "Total de Audios"
$label3.AutoSize                  = $true
$label3.width                     = 40
$label3.height                    = 30
$label3.location                  = New-Object System.Drawing.Point(55,115)
$label3.Font                      = 'Comic Sans MS,10'
$Form.Controls.Add($label3) 

####################
$label4                           = New-Object system.Windows.Forms.Label
$label4.text                      = "Convertir A"
$label4.AutoSize                  = $true
$label4.width                     = 40
$label4.height                    = 30
$label4.location                  = New-Object System.Drawing.Point(55,205)
$label4.Font                      = 'Comic Sans MS,10'
$Form.Controls.Add($label4) 


####################
$label5                           = New-Object system.Windows.Forms.Label
$label5.text                      = "PESO"
$label5.AutoSize                  = $true
$label5.width                     = 40
$label5.height                    = 30
$label5.location                  = New-Object System.Drawing.Point(55,160)
$label5.Font                      = 'Comic Sans MS,10'
$Form.Controls.Add($label5) 


function limpiarDatos{
    $textbox1.Text="";
    $textbox3.Text="";
    $textbox2.Text="";
    $textbox4.Text="";
    $textbox5.Text="";
  $comboBox1.Text="";
  $dataGridView.Rows.Clear()
$dataGridView.DataSource = $null
    
    }


    $cancelarButton1={
        $Form.Close()
  }
  
  function Abrir{
  Invoke-Item $textbox1.text;

  }

  function segundo{
    $ruta=[Environment]::GetFolderPath("Desktop")
    
        $Excel = New-Object -ComObject Excel.Application
    $WorkBook = $Excel.Workbooks.Add()
    $WorkSheet = $WorkBook.Worksheets.Item(1)
    $WorkSheet.Name = 'REPORTE'
    $i=1;
    $WorkSheet.Cells.Item($i,1) = "AUDIO"
    $WorkSheet.Cells.Item($i,2) = "PESO"
    $WorkSheet.Cells.Item($i,3) = "CONVERTIDO"
   
    
    $WorkSheet.Cells.Item($i,1).Font.Bold = $True
    $WorkSheet.Cells.Item($i,2).Font.Bold = $True
    $WorkSheet.Cells.Item($i,3).Font.Bold = $True
    
    
    for($i=1;$i -le ($dataGridView.Rows.Count); $i++){
        for($j=0; $j -le ($dataGridView.Columns.Count) ; $j++){
    $WorkSheet.Cells.Item(($i+1),($j+1)) = $dataGridView.Rows[$i-1].Cells[$j].value
    
        }
    
    }
    
    Add-Type -AssemblyName System.Windows.Forms
        $dlg = New-Object System.Windows.Forms.SaveFileDialog
        $dlg.Filter = "Excel Files|*.xlsx"
        $dlg.SupportMultiDottedExtensions = $true;
        $dlg.InitialDirectory = "$ruta"
    
    
    if($dlg.ShowDialog() -eq 'Ok'){
      echo "you chose to create $($dlg.filename)"
    }
    $WorkBook.SaveAs($dlg.filename)
    $Excel.Quit()
    }




###############################

$computerNames = @('mp3','wav','ogg')
$comboBox1 = New-Object System.Windows.Forms.ComboBox
$comboBox1.Font = 'Segoe UI, 12pt'
$comboBox1.Location = New-Object System.Drawing.Point(200,205)
$comboBox1.Size = New-Object System.Drawing.Size(200, 40)
foreach($computer in $computerNames)
{
  $comboBox1.Items.add($computer)
}
$Form.Controls.Add($comboBox1)



############TextBox Ruta de Ubicación
	$textbox1.Font = 'Comic Sans MS,10'
	$textbox1.Location = '200,25'
	$textbox1.Margin = '5, 5, 5, 5'
	$textbox1.Multiline = $True
	$textbox1.Name = 'textbox5'
	$textbox1.Size = '500, 30'
	$textbox1.TabIndex = 1
	$textbox1.add_TextChanged($textbox1_TextChanged)
############TextBox Ruta Total de Archivos
    	$textbox3.Font = 'Segoe UI, 12pt'
	$textbox3.Location = '200, 70'
	$textbox3.Margin = '5, 5, 5, 5'
	$textbox3.Multiline = $True
	$textbox3.Name = 'textbox5'
    $textbox3.Size = '200, 30'
    $textbox3.Enabled=$false
	$textbox3.TabIndex = 1
    

############TextBox Ruta de Ubicación
$textbox2.Font = 'Segoe UI, 12pt'
$textbox2.Location = '200,115'
$textbox2.Margin = '5, 5, 5, 5'
$textbox2.Multiline = $True
$textbox2.Name = 'textbox5'
$textbox2.Size = '200, 30'
$textbox2.Enabled=$false
$textbox2.TabIndex = 1

############TextBox Ruta Total de Archivos
 
$textbox4.Font = 'Segoe UI, 12pt'
$textbox4.Location = '200,160'
$textbox4.Margin = '5, 5, 5, 5'
$textbox4.Multiline = $True
$textbox4.Name = 'textbox5'
$textbox4.Size = '200, 30'
$textbox4.Enabled=$false
$textbox4.TabIndex = 1

########################################
$textbox5.Font = 'Segoe UI, 12pt'
$textbox5.Location = '500,160'
$textbox5.Margin = '5, 5, 5, 5'
$textbox5.Multiline = $True
$textbox5.Name = 'textbox5'
$textbox5.Size = '200, 30'
$textbox5.Enabled=$false
$textbox5.TabIndex = 1



################################################
$dataGridView = New-Object System.Windows.Forms.DataGridView
$dataGridView.Size=New-Object System.Drawing.Size(790,400)
$dataGridView.Location= New-Object System.Drawing.Point(250,250)
$Form.Controls.Add($dataGridView)
$dataGridView.ColumnCount = 3
$dataGridView.ColumnHeadersVisible = $true;
$dataGridView.Columns[0].width='600'
$dataGridView.Columns[1].width='80'
$dataGridView.Columns[2].width='100'
$dataGridView.Columns[0].Name = "AUDIO"
$dataGridView.Columns[1].Name = "PESO"
$dataGridView.Columns[2].Name = "CONVERTIDO"




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
$Button2.Text = "CONVERTIR" 
$Button2.UseVisualStyleBackColor = $True
$Button2.BackColor = [System.Drawing.Color]::LightBlue
$Button2.Add_Click({ConvertAllToMp3($textbox1.Text)}) 
$Form.Controls.Add($Button2)	

##########################################
$Button3.Location = New-Object System.Drawing.Size(62,510) 
$Button3.Size = New-Object System.Drawing.Size(150,50) 
$Button3.Text = "GENERAR REPORTE" 
$Button3.UseVisualStyleBackColor = $True
$Button3.BackColor = [System.Drawing.Color]::LightBlue
$Button3.Add_Click({segundo}) 
$Form.Controls.Add($Button3)	

$Button4.Location = New-Object System.Drawing.Size(62,590) 
$Button4.Size = New-Object System.Drawing.Size(150,50) 
$Button4.Text = "SALIR" 
$Button4.UseVisualStyleBackColor = $True
$Button4.BackColor = [System.Drawing.Color]::LightBlue
$Button4.Add_Click($cancelarButton1) 
$Form.Controls.Add($Button4)	
###########
$Button5.Location = New-Object System.Drawing.Size(700,20) 
$Button5.Size = New-Object System.Drawing.Size(100,40) 
$Button5.Text = "UBICACION" 
$Button5.UseVisualStyleBackColor = $True
$Button5.BackColor = [System.Drawing.Color]::LightBlue
$Button5.Add_Click({Get-FileName}) 
$Form.Controls.Add($Button5)	


$Button6.Location = New-Object System.Drawing.Size(740,160) 
$Button6.Size = New-Object System.Drawing.Size(140,40) 
$Button6.Text = "CARPETA DE AUDIOS CONVERTIDOS" 
$Button6.UseVisualStyleBackColor = $True
$Button6.BackColor = [System.Drawing.Color]::LightBlue
$Button6.Add_Click({Abrir}) 
$Form.Controls.Add($Button6)	



$Form.Add_Shown({$Form.Activate()})
[void] $Form.ShowDialog();
