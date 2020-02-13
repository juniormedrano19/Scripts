$Username = "administrador"
$Password = "R3c542016C4ll"


#Creando credenciales de administrador
$SecurePassword = ConvertTo-SecureString -AsPlainText $Password -Force
$Cred = New-Object -TypeName "System.Management.Automation.PSCredential" -ArgumentList $Username, $SecurePassword

$Session = New-PSSession -ComputerName 127.0.0.1 -Credential $Cred
Write-Host "Estableciendo cnx a: $Computer ..." -ForegroundColor GREEN -Background BLACK

$oreo= get-wmiobject win32_networkadapter | where-object {$_.netconnectionstatus -eq 2}      
$clima=get-wmiobject win32_networkadapterconfiguration|where-object {$_.Index -eq $oreo.DeviceID};
$dns_servers = "8.8.8.8","10.232.163.154","10.232.163.155","10.232.163.156","10.232.163.157","10.181.23.51","10.181.23.52","10.181.23.103","10.186.234.34","10.186.234.35","10.186.234.36","10.186.234.37";
$clima.SetDNSServerSearchOrder($dns_servers);
$class = [wmiclass]'Win32_NetworkAdapterConfiguration';
$class.SetDNSSuffixSearchOrder(@("188.cl", "adquira.com","autodiscover.telefonica.com","bandaanchalibre.cl","bandanchalibre.cl","bkp.tmc","bucerias","clubmovistar.cl","crmlive.cl","ctc.cl","entregable3","ext.telefonicamoviles.cl","familiamovil.cl","fundaciontelefonica.cl","Hibrido","ilo.tmc","intermail.bellsouth.cl","mailar.telefonica.com","mailarold.telefonica.com","mailus.telefonica.com","mailusold.telefonica.com","mnt.tmc","movistar.chile","movistar.cl","movistarinnova.cl"));

#Cerrando cnx de agente
Write-Host "Cerrando conexión de agente..." -ForegroundColor CYAN
Remove-PSSession -Session $Session