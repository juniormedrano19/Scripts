Write-Host "Windows10" -ForegroundColor Black -BackgroundColor White;
$username = 'Administrador' 
$password = 'R3c542016C4ll' 
Write-Host "Validando Usuario y Password"
$pw = ConvertTo-SecureString $password -AsPlainText -Force 
$cred = New-Object Management.Automation.PSCredential ($username, $pw) 
$Computers=Get-Content C:\Users\jmedrano\Desktop\powershell\pcs_claro


foreach($Computer in $Computers){
    $s = New-PSSession -computerName $Computer -credential $cred 

Write-Host "La ip actual es: $Computer" -ForegroundColor  Red -BackgroundColor Cyan ;
#$aplicativos=Get-Content C:\Users\jmedrano\Desktop\aplicaciones
#$aplicativos=("123","456")
#foreach($aplicativo in $aplicativos){
    $prueba={
$aplicativo=@("microsoft.windowscommunicationsapps");
 #Write-Output $aplicativos | Out-File -FilePath C:\junior.txt -Append
 Write-Output $aplicativo | Out-File -FilePath C:\test.txt -Append
 Get-AppxPackage *$aplicativo* | Remove-AppxPackage;

    } 
}

$Job = Invoke-Command -Session $s -ScriptBlock $prueba -AsJob 
 $Null = Wait-Job -Job $Job

 Write-Host "Completed" 
 Remove-PSSession -Session $s 
}