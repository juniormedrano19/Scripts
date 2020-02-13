$Username = "Administrador"
$Password = "R3c542016C4ll"
Write-Host "Validando Usuario y Password"
$pw = ConvertTo-SecureString $password -AsPlainText -Force 
$cred = New-Object Management.Automation.PSCredential ($username, $pw) 
$ipInicio="192.9.60.29"
$ipFinal="192.9.60.58"
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
$diferencia=([int]$ultima3 - [int]$inicio3)
$numeroDeTerminos= ([int]$ultima3 - [int]$inicio3 +1);


$ipNuevaInicial="192.9.61.1"
$InicialNueva=$ipNuevaInicial.Split(".")
$inicioNueva0=$InicialNueva[0];
$inicioNueva1=$InicialNueva[1];
$inicioNueva2=$InicialNueva[2];
[int]$inicioNueva3=$InicialNueva[3];
$primeraIpNueva=$inicioNueva0+"."+$inicioNueva1+"."+$inicioNueva2+"." ;

$ultimoTerminoNuevo=$inicioNueva3+$diferencia

$ultimaIpNueva=$inicioNueva0+"."+$inicioNueva1+"."+$inicioNueva2+"."+$ultimoTerminoNuevo ;
echo $ultimaipNueva
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
    echo $mundo[$i];
    echo $universo[$i];
    Write-Host "#####################" -ForegroundColor Blue -Background WHITE
  
}

    $s = New-PSSession -computerName $Computer -credential $cred 
  Write-Host "Estableciendo cnx a: $Computer" -ForegroundColor GREEN -Background BLACK;
  

$Job = Invoke-Command -Session $s -ScriptBlock $trabajo -AsJob 
 $Null = Wait-Job -Job $Job
 Write-Host "Completed" 
 Remove-PSSession -Session $s 
 Write-Host "---------------------------------" -ForegroundColor RED -Background BLACK
  
}