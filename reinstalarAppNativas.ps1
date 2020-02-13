 '''
[cmdletbinding()]
param (
    [parameter(Mandatory=$true)]
    [String]$Equipos  
)
'''
Write-Host "Reinstalando APPS NATIVAS DE Windows10" -ForegroundColor Black -BackgroundColor White;
#$username = 'Agente' 
#$password = '123456' 
$username = 'Agente' 
$password = 'krivera2017'
#$username = 'Administrador' 
#$password = 'R3c542016C4ll'
Write-Host "Validando Usuario y Password"
$pw = ConvertTo-SecureString $password -AsPlainText -Force 
$cred = New-Object Management.Automation.PSCredential ($username, $pw) 
$Computers=Get-Content C:\Users\jmedrano\Desktop\powershell\pcs_claro


foreach($Computer in $Computers){
    $s = New-PSSession -computerName $Computer -credential $cred 

Write-Host "La ip actual es: $Computer" -ForegroundColor  Red -BackgroundColor Cyan ;
$usuario1={
     net localgroup Administradores Agente /add
      
}
$usuario2={
 net localgroup administradores agente /delete
}
$primerizo={
  
$atributos=@("Microsoft.3DBuilder","Microsoft.WindowsStore","Microsoft.Office.OneNote","king.com.CandyCrushFriends","Microsoft.WindowsMaps","Microsoft.People","Microsoft.MicrosoftSolitaireCollection","Microsoft.Office.Desktop","Microsoft.ZuneMusic","Microsoft.ZuneVideo","Microsoft.SkypeApp","Microsoft.XboxGameOverlay","Microsoft.WindowsSoundRecorder","microsoft.windowscommunicationsapps","Microsoft.WindowsCamera","Microsoft.XboxSpeechToTextOverlay","Microsoft.BingWeather","Microsoft.Messaging","Microsoft.BingNews")
foreach ($jmedrano in $atributos) {
#$set=Get-AppxProvisionedPackage -Online | Select PackageName,DisplayName | where-object{$_.DisplayName -eq $jmedrano}
#echo $set;
#echo $set.PackageName
#Remove-AppxProvisionedPackage -online -packagename $set.PackageName
#$jmedrano="Microsoft.windowscommunicationsapps"
$obtener=Get-AppxPackage |Select Name,PackageFullName| where-object{$_.Name -eq $jmedrano}
echo $obtener
#echo $obtener.PackageFullName
$obtener.PackageFullName >> C:\peru123456.txt
#Remove-AppxPackage -Package $obtener.Name;
Get-AppxPackage -AllUsers $obtener.Name | Remove-AppxPackage 
}

}
$reinstalar={
    
# Get all the provisioned packages
$Packages = (get-item 'HKLM:\Software\Microsoft\Windows\CurrentVersion\Appx\AppxAllUserStore\Applications') | Get-ChildItem

# Filter the list if provided a filter
$PackageFilter = $args[0]
if ([string]::IsNullOrEmpty($PackageFilter))
{
	echo "Sin filtro especificado, intentando volver a registrar todas las aplicaciones aprovisionadas"
}
else
{
	$Packages = $Packages | where {$_.Name -like $PackageFilter} 

	if ($Packages -eq $null)
	{
		echo "No provisioned apps match the specified filter."
		exit
	}
	else
	{
		echo "Registering the provisioned apps that match $PackageFilter"
	}
}

ForEach($Package in $Packages)
{
	# get package name & path
	$PackageName = $Package | Get-ItemProperty | Select-Object -ExpandProperty PSChildName
	$PackagePath = [System.Environment]::ExpandEnvironmentVariables(($Package | Get-ItemProperty | Select-Object -ExpandProperty Path))

	# register the package	
	echo "Attempting to register package: $PackageName"

	Add-AppxPackage -register $PackagePath -DisableDevelopmentMode
}


}


$Job = Invoke-Command -Session $s -ScriptBlock $reinstalar -AsJob 
 $Null = Wait-Job -Job $Job

 Write-Host "Completed" 
 Remove-PSSession -Session $s 
}