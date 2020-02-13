
$nombres_1=get-ChildItem "\\192.9.65.164\c$\Users\Agente.DESKTOP-60OV35H\Desktop\Carteras Propias\CARTAS DE NO ADEUDO";
$nombre= $nombres_1.Name
$tiempo= $nombres_1.LastWriteTime
$ruta_1= get-ChildItem "\\192.9.65.189\c$\Users\supervisor\Desktop\Carteras_Jacqueline\CARTAS DE NO ADEUDO";
$tiempo1= $ruta_1.LastWriteTime
$nombre1=  $ruta_1.Name
$ruta2= get-ChildItem "\\192.9.65.212\c$\Users\Agente.PE-OP5-002\Desktop\CNAS-CD\CARTAS DE NO ADEUDO";
$tiempo2= $ruta2.LastWriteTime
$nombre2=  $ruta2.Name

for($i=0;$i -lt $nombre.length;$i++){
    $elemento=$nombre[$i]
    $peru=$nombre.IndexOf($elemento)
    $prueba=$ruta_1.length
for($j=0; $j -lt $prueba ; $j++){
    $peru1=$nombre1.IndexOf($elemento)

}
    if($nombre1.IndexOf($elemento) -ge 0){


if($tiempo[$peru] -gt $tiempo1[$peru1]){
   Copy-Item -Path "\\192.9.65.164\c$\Users\Agente.DESKTOP-60OV35H\Desktop\Carteras Propias\CARTAS DE NO ADEUDO\$elemento" -Destination "\\192.9.65.189\c$\Users\supervisor\Desktop\Carteras_Jacqueline\CARTAS DE NO ADEUDO\$elemento"
}
    
    }
    else{
  Copy-Item -Path "\\192.9.65.164\c$\Users\Agente.DESKTOP-60OV35H\Desktop\Carteras Propias\CARTAS DE NO ADEUDO\$elemento" -Destination "\\192.9.65.189\c$\Users\supervisor\Desktop\Carteras_Jacqueline\CARTAS DE NO ADEUDO\$elemento"
    }

}

$supervisor1=get-ChildItem "\\192.9.65.164\c$\Users\Agente.DESKTOP-60OV35H\Desktop\Carteras Propias\Supervisores";
$supervisor1Name= $supervisor1.Name;
$supervisor1Time=$supervisor1.LastWriteTime;
$supervisor_2= get-ChildItem "\\192.9.65.189\c$\Users\supervisor\Desktop\Carteras_Jacqueline\Supervisores"
$supervisor_2Name= $supervisor_2.Name;
$supervisor_2Time=$supervisor_2.LastWriteTime;

for($l=0;$l -lt $supervisor1Name.length;$l++){
    $elementoSup=$supervisor1Name[$l]
    $peru123=$supervisor1Name.IndexOf($elementoSup)
    $prueba2=$supervisor_2.length
for($m=0; $m -lt $prueba2 ; $m++){
    $peru789=$supervisor_2Name.IndexOf($elementoSup)

}
    if($supervisor_2Name.IndexOf($elementoSup) -ge 0){
if($supervisor1Time[$peru123] -gt $supervisor_2Time[$peru789]){
   Copy-Item -Path "\\192.9.65.164\c$\Users\Agente.DESKTOP-60OV35H\Desktop\Carteras Propias\Supervisores\$elementoSup" -Destination "\\192.9.65.189\c$\Users\supervisor\Desktop\Carteras_Jacqueline\Supervisores\$elementoSup"
}
    
    }
    else{
  Copy-Item -Path "\\192.9.65.164\c$\Users\Agente.DESKTOP-60OV35H\Desktop\Carteras Propias\Supervisores\$elementoSup" -Destination "\\192.9.65.189\c$\Users\supervisor\Desktop\Carteras_Jacqueline\Supervisores\$elementoSup"
    }

}


$pagares = get-ChildItem "\\192.9.65.164\c$\Users\Agente.DESKTOP-60OV35H\Desktop\Carteras Propias\DOCUMENTOS PAGARES";
$pagaresName= $pagares.Name;
$pagaresTime=$pagares.LastWriteTime;
$pagares2 = get-ChildItem "\\192.9.65.189\c$\Users\supervisor\Desktop\Carteras_Jacqueline\DOCUMENTOS PAGARES"
$pagares2_Name= $pagares2.Name;
$pagares2_Time=$pagares2.LastWriteTime;


for($i=0;$i -lt $pagaresName.length;$i++){
    $elementoPagare=$pagaresName[$i]
    $peruPagare=$pagaresName.IndexOf($elementoPagare)
    $pruebaPagare=$pagares2.length
for($j=0; $j -lt $pruebaPagare ; $j++){
    $peruPagare1=$pagares2_Name.IndexOf($elementoPagare)

}
    if($pagares2_Name.IndexOf($elementoPagare) -ge 0){

if($pagaresTime[$peruPagare] -gt $pagares2_Time[$peruPagare1]){
    Remove-Item -Recurse -Force -ErrorAction SilentlyContinue "\\192.9.65.189\c$\Users\supervisor\Desktop\Carteras_Jacqueline\DOCUMENTOS PAGARES\$elementoPagare";
   Copy-Item -Path "\\192.9.65.164\c$\Users\Agente.DESKTOP-60OV35H\Desktop\Carteras Propias\DOCUMENTOS PAGARES\$elementoPagare" -Destination "\\192.9.65.189\c$\Users\supervisor\Desktop\Carteras_Jacqueline\DOCUMENTOS PAGARES\$elementoPagare" -Recurse
}
    
    }
    else{
  Copy-Item -Path "\\192.9.65.164\c$\Users\Agente.DESKTOP-60OV35H\Desktop\Carteras Propias\DOCUMENTOS PAGARES\$elementoPagare" -Destination "\\192.9.65.189\c$\Users\supervisor\Desktop\Carteras_Jacqueline\DOCUMENTOS PAGARES\$elementoPagare" -Recurse
    }

}


    $nombres_1=get-ChildItem "\\192.9.65.164\c$\Users\Agente.DESKTOP-60OV35H\Desktop\Carteras Propias\CARTAS DE NO ADEUDO";
    $nombre= $nombres_1.Name
    $tiempo= $nombres_1.LastWriteTime
    $ruta_1= get-ChildItem "\\192.9.65.212\c$\Users\Agente.PE-OP5-002\Desktop\CNAS-CD\CARTAS DE NO ADEUDO";
    $tiempo1= $ruta_1.LastWriteTime
    $nombre1=  $ruta_1.Name

    
    for($i=0;$i -lt $nombre.length;$i++){
        $elemento=$nombre[$i]
        $peru=$nombre.IndexOf($elemento)
        $prueba=$ruta_1.length
    for($j=0; $j -lt $prueba ; $j++){
        $peru1=$nombre1.IndexOf($elemento)
    
    }
        if($nombre1.IndexOf($elemento) -ge 0){
    
    
    if($tiempo[$peru] -gt $tiempo1[$peru1]){
       Copy-Item -Path "\\192.9.65.164\c$\Users\Agente.DESKTOP-60OV35H\Desktop\Carteras Propias\CARTAS DE NO ADEUDO\$elemento" -Destination "\\192.9.65.212\c$\Users\Agente.PE-OP5-002\Desktop\CNAS-CD\CARTAS DE NO ADEUDO\$elemento"
    }
        
        }
        else{
      Copy-Item -Path "\\192.9.65.164\c$\Users\Agente.DESKTOP-60OV35H\Desktop\Carteras Propias\CARTAS DE NO ADEUDO\$elemento" -Destination "\\192.9.65.212\c$\Users\Agente.PE-OP5-002\Desktop\CNAS-CD\CARTAS DE NO ADEUDO\$elemento"
        }
    
    }
    
    $supervisor1=get-ChildItem "\\192.9.65.164\c$\Users\Agente.DESKTOP-60OV35H\Desktop\Carteras Propias\Supervisores";
    $supervisor1Name= $supervisor1.Name;
    $supervisor1Time=$supervisor1.LastWriteTime;
    $supervisor_2= get-ChildItem "\\192.9.65.212\c$\Users\Agente.PE-OP5-002\Desktop\CNAS-CD\Supervisores"
    $supervisor_2Name= $supervisor_2.Name;
    $supervisor_2Time=$supervisor_2.LastWriteTime;
    
    for($l=0;$l -lt $supervisor1Name.length;$l++){
        $elementoSup=$supervisor1Name[$l]
        $peru123=$supervisor1Name.IndexOf($elementoSup)
        $prueba2=$supervisor_2.length
    for($m=0; $m -lt $prueba2 ; $m++){
        $peru789=$supervisor_2Name.IndexOf($elementoSup)
    
    }
        if($supervisor_2Name.IndexOf($elementoSup) -ge 0){
    if($supervisor1Time[$peru123] -gt $supervisor_2Time[$peru789]){
        
       Copy-Item -Path "\\192.9.65.164\c$\Users\Agente.DESKTOP-60OV35H\Desktop\Carteras Propias\Supervisores\$elementoSup" -Destination "\\192.9.65.212\c$\Users\Agente.PE-OP5-002\Desktop\CNAS-CD\Supervisores\$elementoSup"
    }
        
        }
        else{
      Copy-Item -Path "\\192.9.65.164\c$\Users\Agente.DESKTOP-60OV35H\Desktop\Carteras Propias\Supervisores\$elementoSup" -Destination "\\192.9.65.212\c$\Users\Agente.PE-OP5-002\Desktop\CNAS-CD\Supervisores\$elementoSup"
        }
    
    }
    
    
    
    $pagares = get-ChildItem "\\192.9.65.164\c$\Users\Agente.DESKTOP-60OV35H\Desktop\Carteras Propias\DOCUMENTOS PAGARES";
    $pagaresName= $pagares.Name;
    $pagaresTime=$pagares.LastWriteTime;
    $pagares2 = get-ChildItem "\\192.9.65.212\c$\Users\Agente.PE-OP5-002\Desktop\CNAS-CD\DOCUMENTOS PAGARES"
    $pagares2_Name= $pagares2.Name;
    $pagares2_Time=$pagares2.LastWriteTime;
    
    
    for($i=0;$i -lt $pagaresName.length;$i++){
        $elementoPagare=$pagaresName[$i]
        $peruPagare=$pagaresName.IndexOf($elementoPagare)
        $pruebaPagare=$pagares2.length
    for($j=0; $j -lt $pruebaPagare ; $j++){
        $peruPagare1=$pagares2_Name.IndexOf($elementoPagare)
    
    }
        if($pagares2_Name.IndexOf($elementoPagare) -ge 0){
    
    if($pagaresTime[$peruPagare] -gt $pagares2_Time[$peruPagare1]){
        Remove-Item -Recurse -Force -ErrorAction SilentlyContinue "\\192.9.65.212\c$\Users\Agente.PE-OP5-002\Desktop\CNAS-CD\DOCUMENTOS PAGARES\$elementoPagare";
       Copy-Item -Path "\\192.9.65.164\c$\Users\Agente.DESKTOP-60OV35H\Desktop\Carteras Propias\DOCUMENTOS PAGARES\$elementoPagare" -Destination "\\192.9.65.212\c$\Users\Agente.PE-OP5-002\Desktop\CNAS-CD\DOCUMENTOS PAGARES\$elementoPagare" -Recurse
    }
        
        }
        else{
      Copy-Item -Path "\\192.9.65.164\c$\Users\Agente.DESKTOP-60OV35H\Desktop\Carteras Propias\DOCUMENTOS PAGARES\$elementoPagare" -Destination "\\192.9.65.212\c$\Users\Agente.PE-OP5-002\Desktop\CNAS-CD\DOCUMENTOS PAGARES\$elementoPagare" -Recurse
        }
    
    }
    
    Add-Type -AssemblyName System.Windows.Forms
$errorMsg = "Archivos transferidos y actualizados en la carpeta \\192.9.65.189 y \\192.9.65.212"
    $caption = "RECSA TI PERU - COMPRA DE CARTERA"
    [System.Windows.Forms.MessageBox]::Show($errorMsg, $caption)