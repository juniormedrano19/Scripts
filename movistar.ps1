$oreo= get-wmiobject win32_networkadapter | where-object {$_.netconnectionstatus -eq 2 -and $_.ServiceName -eq 'rt640x64' }
            
$clima=get-wmiobject win32_networkadapterconfiguration|where-object {$_.Index -eq $oreo.DeviceID};
#set-DnsClientServerAddress -InterfaceAlias $oreo.netconnectionid -ServerAddresses 10.232.163.154,10.232.163.155,10.232.163.156,10.232.163.157,10.181.23.51,10.181.23.52,10.181.23.103,10.186.234.34,10.186.234.35,10.186.234.36,10.186.234.37;
#$dns_servers = "8.8.8.8","10.232.163.154","10.232.163.155","10.232.163.156","10.232.163.157","10.181.23.51","10.181.23.52","10.181.23.103","10.186.234.34","10.186.234.35","10.186.234.36","10.186.234.37";

$dns_servers = "192.9.60.91","8.8.8.8";

$clima.SetDNSServerSearchOrder($dns_servers);
#$lista=("www.google.com","www.wikipedia.com","hola.peru");
#$clima.SetDNSDomainSuffixSearchOrder($lista);

$class = [wmiclass]'Win32_NetworkAdapterConfiguration';

$class.SetDNSSuffixSearchOrder(@("188.cl", "adquira.com","autodiscover.telefonica.com","bandaanchalibre.cl","bandanchalibre.cl","bkp.tmc","bucerias","clubmovistar.cl","crmlive.cl","ctc.cl","entregable3","ext.telefonicamoviles.cl","familiamovil.cl","fundaciontelefonica.cl","Hibrido","ilo.tmc","intermail.bellsouth.cl","mailar.telefonica.com","mailarold.telefonica.com","mailus.telefonica.com","mailusold.telefonica.com","mnt.tmc","movistar.chile","movistar.cl","movistarinnova.cl"));



#Set-DnsClientGlobalSetting -SuffixSearchList @("188.cl", "adquira.com","autodiscover.telefonica.com","bandaanchalibre.cl","bandanchalibre.cl","bkp.tmc","bucerias","clubmovistar.cl","crmlive.cl","ctc.cl","entregable3","ext.telefonicamoviles.cl","familiamovil.cl","fundaciontelefonica.cl","Hibrido","ilo.tmc","intermail.bellsouth.cl","mailar.telefonica.com","mailarold.telefonica.com","mailus.telefonica.com","mailusold.telefonica.com","mnt.tmc","movistar.chile","movistar.cl","movistarinnova.cl");