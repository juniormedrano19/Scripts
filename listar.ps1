Write-Host "Validar si tienen instalado CISCO VPN" -ForegroundColor Black -BackgroundColor White;
$username = 'Administrador' 
$password = 'R3c542016C4ll' 
Write-Host "Validando Usuario y Password"
$pw = ConvertTo-SecureString $password -AsPlainText -Force 
$cred = New-Object Management.Automation.PSCredential ($username, $pw) 
$Computers=Get-Content C:\Users\jmedrano\Desktop\pcs_claro
#$i=10;
foreach($Computer in $Computers){
    $s = New-PSSession -computerName $Computer -credential $cred 

Write-Host "La ip actual es: $Computer" -ForegroundColor  Red -BackgroundColor Cyan ;

$validar={

    if(Get-WmiObject win32_product |select name| where {$_.name -like 'Cisco*'}){
        $localIpAddress=((ipconfig | findstr [0-9].\.)[0]).Split()[-1];

    $localIpAddress>C:\movistarpcs.txt;
    }
    else{
        "No esta instalado">C:\movistarerror.txt;
}
}

$Job = Invoke-Command -Session $s -ScriptBlock $validar -AsJob 
 $Null = Wait-Job -Job $Job

 Write-Host "Completed" 
 Remove-PSSession -Session $s 
}