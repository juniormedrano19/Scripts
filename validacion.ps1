
$ip=$text1box.text
$ipNueva=$text1box.text
if($ip.length -eq 0 && $ipnueva.length -eq 0){
Add-Type -AssemblyName System.Windows.Forms
$errorMsg = "No puede quedar en blanco la dirección ip.
Vuelva a intentarlo nuevamente."
    $caption = "Error de contenido"
    [System.Windows.Forms.MessageBox]::Show($errorMsg, $caption)
}

$ip=$text1box.text
if($ip.length -eq 0){
Add-Type -AssemblyName System.Windows.Forms
$errorMsg = "No puede quedar en blanco la dirección ip.
Vuelva a intentarlo nuevamente."
    $caption = "Error de contenido"
    [System.Windows.Forms.MessageBox]::Show($errorMsg, $caption)
}
