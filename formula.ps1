$peru= get-content C:\Users\jmedrano\Desktop\SEPTIEMBRE-RECSA.csv
$separar= $peru.split(",")
$suma=0;
for ($i=11;$i -lt 2064100;$i=$i+6){
    $separar[$i] >> C:\Users\jmedrano\Desktop\magnavozSet.txt
 
    
}


$lectura= get-content C:\Users\jmedrano\Desktop\magnavozSet.txt
