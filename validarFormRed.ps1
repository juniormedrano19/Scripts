[void] [System.Reflection.Assembly]::LoadWithPartialName("System.Drawing") 
[void] [System.Reflection.Assembly]::LoadWithPartialName("System.Windows.Forms")  
$Label100=New-Object 'system.Windows.Forms.Label'
$Label102=New-Object 'system.Windows.Forms.Label'
$Label103=New-Object 'system.Windows.Forms.Label'
$Label104=New-Object 'system.Windows.Forms.Label'
$Label150=New-Object 'system.Windows.Forms.Label'
$Label160=New-Object 'system.Windows.Forms.Label'
$Label170=New-Object 'system.Windows.Forms.Label'
$Label180=New-Object 'system.Windows.Forms.Label'
$Label190=New-Object 'system.Windows.Forms.Label'
$Label110=New-Object 'system.Windows.Forms.Label'
$Label111=New-Object 'system.Windows.Forms.Label'
$Label112=New-Object 'system.Windows.Forms.Label'
$Label113=New-Object 'system.Windows.Forms.Label'
$Label114=New-Object 'system.Windows.Forms.Label'
$Label115=New-Object 'system.Windows.Forms.Label'
$Label116=New-Object 'system.Windows.Forms.Label'
$Label117=New-Object 'system.Windows.Forms.Label'
$Label118=New-Object 'system.Windows.Forms.Label'
$Label119=New-Object 'system.Windows.Forms.Label'
$Label120=New-Object 'system.Windows.Forms.Label'
$Label121=New-Object 'system.Windows.Forms.Label'
$Label122=New-Object 'system.Windows.Forms.Label'
$Label123=New-Object 'system.Windows.Forms.Label'
$Label124=New-Object 'system.Windows.Forms.Label'
$Label125=New-Object 'system.Windows.Forms.Label'
$Label126=New-Object 'system.Windows.Forms.Label'
$Label127=New-Object 'system.Windows.Forms.Label'
$Label128=New-Object 'system.Windows.Forms.Label'
$Label129=New-Object 'system.Windows.Forms.Label'
$Label130=New-Object 'system.Windows.Forms.Label'
$Label131=New-Object 'system.Windows.Forms.Label'
$Label132=New-Object 'system.Windows.Forms.Label'
$Label133=New-Object 'system.Windows.Forms.Label'
$Label134=New-Object 'system.Windows.Forms.Label'
$Label135=New-Object 'system.Windows.Forms.Label'
$Label136=New-Object 'system.Windows.Forms.Label'
$Label137=New-Object 'system.Windows.Forms.Label'
$Label138=New-Object 'system.Windows.Forms.Label'
$Label139=New-Object 'system.Windows.Forms.Label'
$Label140=New-Object 'system.Windows.Forms.Label'
$Label141=New-Object 'system.Windows.Forms.Label'
$Label142=New-Object 'system.Windows.Forms.Label'
$Label143=New-Object 'system.Windows.Forms.Label'
$Label144=New-Object 'system.Windows.Forms.Label'
$Label145=New-Object 'system.Windows.Forms.Label'
$Label146=New-Object 'system.Windows.Forms.Label'
$Label147=New-Object 'system.Windows.Forms.Label'
$Label148=New-Object 'system.Windows.Forms.Label'
$TextBox100=New-Object 'system.Windows.Forms.TextBox'
$TextBox102=New-Object 'system.Windows.Forms.TextBox'
$TextBox103=New-Object 'system.Windows.Forms.TextBox'
$TextBox104=New-Object 'system.Windows.Forms.TextBox'
$TextBox150=New-Object 'system.Windows.Forms.TextBox'
$TextBox160=New-Object 'system.Windows.Forms.TextBox'
$TextBox170=New-Object 'system.Windows.Forms.TextBox'
$TextBox180=New-Object 'system.Windows.Forms.TextBox'
$TextBox190=New-Object 'system.Windows.Forms.TextBox'
$TextBox110=New-Object 'system.Windows.Forms.TextBox'
$TextBox111=New-Object 'system.Windows.Forms.TextBox'
$TextBox112=New-Object 'system.Windows.Forms.TextBox'
$TextBox113=New-Object 'system.Windows.Forms.TextBox'
$TextBox114=New-Object 'system.Windows.Forms.TextBox'
$TextBox115=New-Object 'system.Windows.Forms.TextBox'
$TextBox116=New-Object 'system.Windows.Forms.TextBox'
$TextBox117=New-Object 'system.Windows.Forms.TextBox'
$TextBox118=New-Object 'system.Windows.Forms.TextBox'
$TextBox119=New-Object 'system.Windows.Forms.TextBox'
$TextBox120=New-Object 'system.Windows.Forms.TextBox'
$TextBox121=New-Object 'system.Windows.Forms.TextBox'
$TextBox122=New-Object 'system.Windows.Forms.TextBox'
$TextBox123=New-Object 'system.Windows.Forms.TextBox'
$TextBox124=New-Object 'system.Windows.Forms.TextBox'
$TextBox125=New-Object 'system.Windows.Forms.TextBox'
$TextBox126=New-Object 'system.Windows.Forms.TextBox'
$TextBox127=New-Object 'system.Windows.Forms.TextBox'
$TextBox128=New-Object 'system.Windows.Forms.TextBox'
$TextBox129=New-Object 'system.Windows.Forms.TextBox'
$TextBox130=New-Object 'system.Windows.Forms.TextBox'
$TextBox131=New-Object 'system.Windows.Forms.TextBox'
$TextBox132=New-Object 'system.Windows.Forms.TextBox'
$ComboBox110=New-Object 'system.Windows.Forms.ComboBox'
$ComboBox120=New-Object 'system.Windows.Forms.ComboBox'
$ComboBox130=New-Object 'system.Windows.Forms.ComboBox'
$ComboBox140=New-Object 'system.Windows.Forms.ComboBox'
$ComboBox150=New-Object 'system.Windows.Forms.ComboBox'
$ComboBox160=New-Object 'system.Windows.Forms.ComboBox'
$ComboBox170=New-Object 'system.Windows.Forms.ComboBox'
$ComboBox180=New-Object 'system.Windows.Forms.ComboBox'
$Button110=New-Object 'system.Windows.Forms.Button'



############### CREACION DEL ELEMENTO ############
$Form2 = New-Object System.Windows.Forms.Form 
$Form2.Size = New-Object System.Drawing.Size(1100,750)  
$Form2.StartPosition = "CenterScreen" 
$Form2.FormBorderStyle = [System.Windows.Forms.FormBorderStyle]::Sizable
$Form2.MaximizeBox = $false
$Form2.Text = "ROUTES" 

if($ComboBox150.SelectedItem -eq '1'){
    $Form2.Controls.Add($Label100)
    $Form2.Controls.Add($Label102)
    $Form2.Controls.Add($Label103)
    $Form2.Controls.Add($Label104)
    $Form2.Controls.Add($Label150)
    $Form2.Controls.Add($Label160)
    $Form2.Controls.Add($TextBox100)
    $Form2.Controls.Add($TextBox102)
    $Form2.Controls.Add($TextBox103)
    $Form2.Controls.Add($TextBox104)
    $Form2.Controls.Remove($Label170)
$Form2.Controls.Remove($Label180)
$Form2.Controls.Remove($Label190)
$Form2.Controls.Remove($Label110)
$Form2.Controls.Remove($Label111)
$Form2.Controls.Remove($Label112)
$Form2.Controls.Remove($Label113)
$Form2.Controls.Remove($Label114)
$Form2.Controls.Remove($Label115)
$Form2.Controls.Remove($Label116)
$Form2.Controls.Remove($Label117)
$Form2.Controls.Remove($Label118)
$Form2.Controls.Remove($Label119)
$Form2.Controls.Remove($Label120)
$Form2.Controls.Remove($Label121)
$Form2.Controls.Remove($Label122)
$Form2.Controls.Remove($Label123)
$Form2.Controls.Remove($Label124)
$Form2.Controls.Remove($Label125)
$Form2.Controls.Remove($Label126)
$Form2.Controls.Remove($Label127)
$Form2.Controls.Remove($Label128)
$Form2.Controls.Remove($Label129)
$Form2.Controls.Remove($Label130)
$Form2.Controls.Remove($Label131)
$Form2.Controls.Remove($Label132)
$Form2.Controls.Remove($Label133)
$Form2.Controls.Remove($Label134)
$Form2.Controls.Remove($Label135)
$Form2.Controls.Remove($Label136)
$Form2.Controls.Remove($Label137)
$Form2.Controls.Remove($Label138)
$Form2.Controls.Remove($Label139)
$Form2.Controls.Remove($Label140)
$Form2.Controls.Remove($Label141)
$Form2.Controls.Remove($Label142)
$Form2.Controls.Remove($Label143)
$Form2.Controls.Remove($Label144)
$Form2.Controls.Remove($Label145)
$Form2.Controls.Remove($Label146)
$Form2.Controls.Remove($Label147)
$Form2.Controls.Remove($Label148)
$Form2.Controls.Remove($TextBox150)
$Form2.Controls.Remove($TextBox160)
$Form2.Controls.Remove($TextBox170)
$Form2.Controls.Remove($TextBox180)
$Form2.Controls.Remove($TextBox190)
$Form2.Controls.Remove($TextBox110)
$Form2.Controls.Remove($TextBox111)
$Form2.Controls.Remove($TextBox112)
$Form2.Controls.Remove($TextBox113)
$Form2.Controls.Remove($TextBox114)
$Form2.Controls.Remove($TextBox115)
$Form2.Controls.Remove($TextBox116)
$Form2.Controls.Remove($TextBox117)
$Form2.Controls.Remove($TextBox118)
$Form2.Controls.Remove($TextBox119)
$Form2.Controls.Remove($TextBox120)
$Form2.Controls.Remove($TextBox121)
$Form2.Controls.Remove($TextBox122)
$Form2.Controls.Remove($TextBox123)
$Form2.Controls.Remove($TextBox124)
$Form2.Controls.Remove($TextBox125)
$Form2.Controls.Remove($TextBox126)
$Form2.Controls.Remove($TextBox127)
$Form2.Controls.Remove($TextBox128)
$Form2.Controls.Remove($TextBox129)
$Form2.Controls.Remove($TextBox130)
$Form2.Controls.Remove($TextBox131)
$Form2.Controls.Remove($TextBox132)

}
else{
    $Form2.Controls.Remove($Label11)
}




$Label100.text                     = "RUTA 1:"
$Label100.AutoSize                 = $true
$Label100.width                    = 25
$Label100.height                   = 10
$Label100.location                 = New-Object System.Drawing.Point(24,46)
$Label100.Font                     = 'Microsoft Sans Serif,10,style=Bold'
$Label100.ForeColor                = "#000000"



$TextBox100.multiline              = $true
$TextBox100.width                  = 180
$TextBox100.height                 = 30
$TextBox100.location               = New-Object System.Drawing.Point(114,454)
$TextBox100.Font                   = 'Microsoft Sans Serif,10'



$Label102.text                     = "DIRECCION IP"
$Label102.AutoSize                 = $true
$Label102.width                    = 25
$Label102.height                   = 10
$Label102.location                 = New-Object System.Drawing.Point(152,441)
$Label102.Font                     = 'Microsoft Sans Serif,10'


$Label103.text                     = "/"
$Label103.AutoSize                 = $true
$Label103.width                    = 25
$Label103.height                   = 10
$Label103.location                 = New-Object System.Drawing.Point(297,458)
$Label103.Font                     = 'Microsoft Sans Serif,14'


$TextBox102.multiline              = $false
$TextBox102.width                  = 0
$TextBox102.height                 = 30
$TextBox102.location               = New-Object System.Drawing.Point(307,455)
$TextBox102.Font                   = 'Microsoft Sans Serif,10'


$ComboBox110.text                  = "comboBox"
$ComboBox110.width                 = 55
$ComboBox110.height                = 74
$ComboBox110.location              = New-Object System.Drawing.Point(306,456)
$ComboBox110.Font                  = 'Microsoft Sans Serif,10'


$Label104.text                     = "Prefijo"
$Label104.AutoSize                 = $true
$Label104.width                    = 25
$Label104.height                   = 10
$Label104.location                 = New-Object System.Drawing.Point(313,444)
$Label104.Font                     = 'Microsoft Sans Serif,10'
$Form2.Controls.Add($Label104)

$TextBox103.multiline              = $true
$TextBox103.width                  = 180
$TextBox103.height                 = 30
$TextBox103.enabled                = $false
$TextBox103.location               = New-Object System.Drawing.Point(413,452)
$TextBox103.Font                   = 'Microsoft Sans Serif,10'
$Form2.Controls.Add($TextBox103)

$Label150.text                     = "MASCARA DE RED"
$Label150.AutoSize                 = $true
$Label150.width                    = 25
$Label150.height                   = 10
$Label150.location                 = New-Object System.Drawing.Point(438,438)
$Label150.Font                     = 'Microsoft Sans Serif,10'
$Form2.Controls.Add($Label150)

$TextBox104.multiline              = $true
$TextBox104.width                  = 180
$TextBox104.height                 = 30
$TextBox104.location               = New-Object System.Drawing.Point(659,450)
$TextBox104.Font                   = 'Microsoft Sans Serif,10'
$Form2.Controls.Add($TextBox104)

$Label160.text                     = "GATEWAY"
$Label160.AutoSize                 = $true
$Label160.width                    = 25
$Label160.height                   = 10
$Label160.location                 = New-Object System.Drawing.Point(713,438)
$Label160.Font                     = 'Microsoft Sans Serif,10'
$Form2.Controls.Add($Label160)

$Label170.text                     = "RUTA 8:"
$Label170.AutoSize                 = $true
$Label170.width                    = 25
$Label170.height                   = 10
$Label170.location                 = New-Object System.Drawing.Point(24,449)
$Label170.Font                     = 'Microsoft Sans Serif,10,style=Bold'
$Label170.ForeColor                = "#000000"
$Form2.Controls.Add($Label170)

$TextBox150.multiline              = $true
$TextBox150.width                  = 180
$TextBox150.height                 = 30
$TextBox150.location               = New-Object System.Drawing.Point(114,394)
$TextBox150.Font                   = 'Microsoft Sans Serif,10'
$Form2.Controls.Add($TextBox150)

$Label180.text                     = "DIRECCION IP"
$Label180.AutoSize                 = $true
$Label180.width                    = 25
$Label180.height                   = 10
$Label180.location                 = New-Object System.Drawing.Point(152,381)
$Label180.Font                     = 'Microsoft Sans Serif,10'
$Form2.Controls.Add($Label180)

$Label190.text                     = "/"
$Label190.AutoSize                 = $true
$Label190.width                    = 25
$Label190.height                   = 10
$Label190.location                 = New-Object System.Drawing.Point(297,398)
$Label190.Font                     = 'Microsoft Sans Serif,14'
$Form2.Controls.Add($Label190)

$TextBox160.multiline              = $false
$TextBox160.width                  = 0
$TextBox160.height                 = 30
$TextBox160.location               = New-Object System.Drawing.Point(307,395)
$TextBox160.Font                   = 'Microsoft Sans Serif,10'
$Form2.Controls.Add($TextBox160)

$ComboBox120.text                  = "comboBox"
$ComboBox120.width                 = 55
$ComboBox120.height                = 74
$ComboBox120.location              = New-Object System.Drawing.Point(306,396)
$ComboBox120.Font                  = 'Microsoft Sans Serif,10'
$Form2.Controls.Add($ComboBox120)

$Label110.text                    = "Prefijo"
$Label110.AutoSize                = $true
$Label110.width                   = 25
$Label110.height                  = 10
$Label110.location                = New-Object System.Drawing.Point(313,384)
$Label110.Font                    = 'Microsoft Sans Serif,10'
$Form2.Controls.Add($Label0)

$TextBox170.multiline              = $true
$TextBox170.width                  = 180
$TextBox170.height                 = 30
$TextBox170.enabled                = $false
$TextBox170.location               = New-Object System.Drawing.Point(413,392)
$TextBox170.Font                   = 'Microsoft Sans Serif,10'
$Form2.Controls.Add($TextBox170)

$Label111.text                    = "MASCARA DE RED"
$Label111.AutoSize                = $true
$Label111.width                   = 25
$Label111.height                  = 10
$Label111.location                = New-Object System.Drawing.Point(438,378)
$Label111.Font                    = 'Microsoft Sans Serif,10'
$Form2.Controls.Add($Label111)

$TextBox180.multiline              = $true
$TextBox180.width                  = 180
$TextBox180.height                 = 30
$TextBox180.location               = New-Object System.Drawing.Point(659,390)
$TextBox180.Font                   = 'Microsoft Sans Serif,10'
$Form2.Controls.Add($TextBox180)

$Label112.text                    = "GATEWAY"
$Label112.AutoSize                = $true
$Label112.width                   = 25
$Label112.height                  = 10
$Label112.location                = New-Object System.Drawing.Point(713,378)
$Label112.Font                    = 'Microsoft Sans Serif,10'
$Form2.Controls.Add($Label112)

$Label113.text                    = "RUTA 7:"
$Label113.AutoSize                = $true
$Label113.width                   = 25
$Label113.height                  = 10
$Label113.location                = New-Object System.Drawing.Point(22,390)
$Label113.Font                    = 'Microsoft Sans Serif,10,style=Bold'
$Label113.ForeColor               = "#000000"
$Form2.Controls.Add($Label113)

$TextBox190.multiline              = $true
$TextBox190.width                  = 180
$TextBox190.height                 = 30
$TextBox190.location               = New-Object System.Drawing.Point(113,338)
$TextBox190.Font                   = 'Microsoft Sans Serif,10'
$Form2.Controls.Add($TextBox190)

$Label114.text                    = "DIRECCION IP"
$Label114.AutoSize                = $true
$Label114.width                   = 25
$Label114.height                  = 10
$Label114.location                = New-Object System.Drawing.Point(151,325)
$Label114.Font                    = 'Microsoft Sans Serif,10'
$Form2.Controls.Add($Label114)

$Label115.text                    = "/"
$Label115.AutoSize                = $true
$Label115.width                   = 25
$Label115.height                  = 10
$Label115.location                = New-Object System.Drawing.Point(296,342)
$Label115.Font                    = 'Microsoft Sans Serif,14'
$Form2.Controls.Add($Label115)

$TextBox110.multiline             = $false
$TextBox110.width                 = 0
$TextBox110.height                = 30
$TextBox110.location              = New-Object System.Drawing.Point(306,339)
$TextBox110.Font                  = 'Microsoft Sans Serif,10'
$Form2.Controls.Add($TextBox110)




$ComboBox130.text                  = "comboBox"
$ComboBox130.width                 = 55
$ComboBox130.height                = 74
$ComboBox130.location              = New-Object System.Drawing.Point(305,340)
$ComboBox130.Font                  = 'Microsoft Sans Serif,10'
$Form2.Controls.Add($ComboBox130)

$Label116.text                    = "Prefijo"
$Label116.AutoSize                = $true
$Label116.width                   = 25
$Label116.height                  = 10
$Label116.location                = New-Object System.Drawing.Point(312,328)
$Label116.Font                    = 'Microsoft Sans Serif,10'
$Form2.Controls.Add($Label116)

$TextBox111.multiline             = $true
$TextBox111.width                 = 180
$TextBox111.height                = 30
$TextBox111.enabled               = $false
$TextBox111.location              = New-Object System.Drawing.Point(412,336)
$TextBox111.Font                  = 'Microsoft Sans Serif,10'
$Form2.Controls.Add($TextBox111)

$Label117.text                    = "MASCARA DE RED"
$Label117.AutoSize                = $true
$Label117.width                   = 25
$Label117.height                  = 10
$Label117.location                = New-Object System.Drawing.Point(437,322)
$Label117.Font                    = 'Microsoft Sans Serif,10'
$Form2.Controls.Add($Label117)

$TextBox112.multiline             = $true
$TextBox112.width                 = 180
$TextBox112.height                = 30
$TextBox112.location              = New-Object System.Drawing.Point(658,334)
$TextBox112.Font                  = 'Microsoft Sans Serif,10'
$Form2.Controls.Add($TextBox112)

$Label118.text                    = "GATEWAY"
$Label118.AutoSize                = $true
$Label118.width                   = 25
$Label118.height                  = 10
$Label118.location                = New-Object System.Drawing.Point(712,322)
$Label118.Font                    = 'Microsoft Sans Serif,10'
$Form2.Controls.Add($Label118)

$Label119.text                    = "RUTA 6:"
$Label119.AutoSize                = $true
$Label119.width                   = 25
$Label119.height                  = 10
$Label119.location                = New-Object System.Drawing.Point(24,339)
$Label119.Font                    = 'Microsoft Sans Serif,10,style=Bold'
$Label119.ForeColor               = "#000000"
$Form2.Controls.Add($Label119)

$TextBox113.multiline             = $true
$TextBox113.width                 = 180
$TextBox113.height                = 30
$TextBox113.location              = New-Object System.Drawing.Point(114,275)
$TextBox113.Font                  = 'Microsoft Sans Serif,10'
$Form2.Controls.Add($TextBox113)

$Label120.text                    = "DIRECCION IP"
$Label120.AutoSize                = $true
$Label120.width                   = 25
$Label120.height                  = 10
$Label120.location                = New-Object System.Drawing.Point(152,262)
$Label120.Font                    = 'Microsoft Sans Serif,10'
$Form2.Controls.Add($Label120)

$Label121.text                    = "/"
$Label121.AutoSize                = $true
$Label121.width                   = 25
$Label121.height                  = 10
$Label121.location                = New-Object System.Drawing.Point(297,279)
$Label121.Font                    = 'Microsoft Sans Serif,14'
$Form2.Controls.Add($Label121)

$TextBox114.multiline             = $false
$TextBox114.width                 = 0
$TextBox114.height                = 30
$TextBox114.location              = New-Object System.Drawing.Point(307,276)
$TextBox114.Font                  = 'Microsoft Sans Serif,10'
$Form2.Controls.Add($TextBox114)

$ComboBox140.text                  = "comboBox"
$ComboBox140.width                 = 55
$ComboBox140.height                = 74
$ComboBox140.location              = New-Object System.Drawing.Point(306,277)
$ComboBox140.Font                  = 'Microsoft Sans Serif,10'
$Form2.Controls.Add($ComboBox140)

$Label122.text                    = "Prefijo"
$Label122.AutoSize                = $true
$Label122.width                   = 25
$Label122.height                  = 10
$Label122.location                = New-Object System.Drawing.Point(313,265)
$Label122.Font                    = 'Microsoft Sans Serif,10'
$Form2.Controls.Add($Label122)

$TextBox115.multiline             = $true
$TextBox115.width                 = 180
$TextBox115.height                = 30
$TextBox115.enabled               = $false
$TextBox115.location              = New-Object System.Drawing.Point(413,273)
$TextBox115.Font                  = 'Microsoft Sans Serif,10'
$Form2.Controls.Add($TextBox115)

$Label123.text                    = "MASCARA DE RED"
$Label123.AutoSize                = $true
$Label123.width                   = 25
$Label123.height                  = 10
$Label123.location                = New-Object System.Drawing.Point(438,259)
$Label123.Font                    = 'Microsoft Sans Serif,10'
$Form2.Controls.Add($Label123)

$TextBox116.multiline             = $true
$TextBox116.width                 = 180
$TextBox116.height                = 30
$TextBox116.location              = New-Object System.Drawing.Point(659,271)
$TextBox116.Font                  = 'Microsoft Sans Serif,10'
$Form2.Controls.Add($TextBox116)

$Label124.text                    = "GATEWAY"
$Label124.AutoSize                = $true
$Label124.width                   = 25
$Label124.height                  = 10
$Label124.location                = New-Object System.Drawing.Point(713,259)
$Label124.Font                    = 'Microsoft Sans Serif,10'
$Form2.Controls.Add($Label124)

$Label125.text                    = "RUTA 5:"
$Label125.AutoSize                = $true
$Label125.width                   = 25
$Label125.height                  = 10
$Label125.location                = New-Object System.Drawing.Point(24,276)
$Label125.Font                    = 'Microsoft Sans Serif,10,style=Bold'
$Label125.ForeColor               = "#000000"
$Form2.Controls.Add($Label125)

$TextBox117.multiline             = $true
$TextBox117.width                 = 180
$TextBox117.height                = 30
$TextBox117.location              = New-Object System.Drawing.Point(114,214)
$TextBox117.Font                  = 'Microsoft Sans Serif,10'
$Form2.Controls.Add($TextBox117)

$Label126.text                    = "DIRECCION IP"
$Label126.AutoSize                = $true
$Label126.width                   = 25
$Label126.height                  = 10
$Label126.location                = New-Object System.Drawing.Point(152,201)
$Label126.Font                    = 'Microsoft Sans Serif,10'
$Form2.Controls.Add($Label126)

$Label127.text                    = "/"
$Label127.AutoSize                = $true
$Label127.width                   = 25
$Label127.height                  = 10
$Label127.location                = New-Object System.Drawing.Point(297,218)
$Label127.Font                    = 'Microsoft Sans Serif,14'
$Form2.Controls.Add($Label127)

$TextBox118.multiline             = $false
$TextBox118.width                 = 0
$TextBox118.height                = 30
$TextBox118.location              = New-Object System.Drawing.Point(307,215)
$TextBox118.Font                  = 'Microsoft Sans Serif,10'
$Form2.Controls.Add($TextBox118)

$ComboBox150.text                  = "comboBox"
$ComboBox150.width                 = 55
$ComboBox150.height                = 74
$ComboBox150.location              = New-Object System.Drawing.Point(306,216)
$ComboBox150.Font                  = 'Microsoft Sans Serif,10'
$Form2.Controls.Add($ComboBox150)

$Label128.text                    = "Prefijo"
$Label128.AutoSize                = $true
$Label128.width                   = 25
$Label128.height                  = 10
$Label128.location                = New-Object System.Drawing.Point(313,204)
$Label128.Font                    = 'Microsoft Sans Serif,10'
$Form2.Controls.Add($Label128)

$TextBox119.multiline             = $true
$TextBox119.width                 = 180
$TextBox119.height                = 30
$TextBox119.enabled               = $false
$TextBox119.location              = New-Object System.Drawing.Point(413,212)
$TextBox119.Font                  = 'Microsoft Sans Serif,10'
$Form2.Controls.Add($TextBox119)

$Label129.text                    = "MASCARA DE RED"
$Label129.AutoSize                = $true
$Label129.width                   = 25
$Label129.height                  = 10
$Label129.location                = New-Object System.Drawing.Point(438,198)
$Label129.Font                    = 'Microsoft Sans Serif,10'
$Form2.Controls.Add($Label129)

$TextBox120.multiline             = $true
$TextBox120.width                 = 180
$TextBox120.height                = 30
$TextBox120.location              = New-Object System.Drawing.Point(659,210)
$TextBox120.Font                  = 'Microsoft Sans Serif,10'
$Form2.Controls.Add($TextBox120)

$Label130.text                    = "GATEWAY"
$Label130.AutoSize                = $true
$Label130.width                   = 25
$Label130.height                  = 10
$Label130.location                = New-Object System.Drawing.Point(713,198)
$Label130.Font                    = 'Microsoft Sans Serif,10'
$Form2.Controls.Add($Label130)

$Label131.text                    = "RUTA 4:"
$Label131.AutoSize                = $true
$Label131.width                   = 25
$Label131.height                  = 10
$Label131.location                = New-Object System.Drawing.Point(24,215)
$Label131.Font                    = 'Microsoft Sans Serif,10,style=Bold'
$Label131.ForeColor               = "#000000"
$Form2.Controls.Add($Label131)

$TextBox121.multiline             = $true
$TextBox121.width                 = 180
$TextBox121.height                = 30
$TextBox121.location              = New-Object System.Drawing.Point(113,154)
$TextBox121.Font                  = 'Microsoft Sans Serif,10'
$Form2.Controls.Add($TextBox121)

$Label132.text                    = "DIRECCION IP"
$Label132.AutoSize                = $true
$Label132.width                   = 25
$Label132.height                  = 10
$Label132.location                = New-Object System.Drawing.Point(151,141)
$Label132.Font                    = 'Microsoft Sans Serif,10'
$Form2.Controls.Add($Label132)

$Label133.text                    = "/"
$Label133.AutoSize                = $true
$Label133.width                   = 25
$Label133.height                  = 10
$Label133.location                = New-Object System.Drawing.Point(296,158)
$Label133.Font                    = 'Microsoft Sans Serif,14'
$Form2.Controls.Add($Label133)

$TextBox122.multiline             = $false
$TextBox122.width                 = 0
$TextBox122.height                = 30
$TextBox122.location              = New-Object System.Drawing.Point(306,155)
$TextBox122.Font                  = 'Microsoft Sans Serif,10'
$Form2.Controls.Add($TextBox122)

$ComboBox160.text                  = "comboBox"
$ComboBox160.width                 = 55
$ComboBox160.height                = 74
$ComboBox160.location              = New-Object System.Drawing.Point(305,156)
$ComboBox160.Font                  = 'Microsoft Sans Serif,10'
$Form2.Controls.Add($ComboBox160)

$Label134.text                    = "Prefijo"
$Label134.AutoSize                = $true
$Label134.width                   = 25
$Label134.height                  = 10
$Label134.location                = New-Object System.Drawing.Point(312,144)
$Label134.Font                    = 'Microsoft Sans Serif,10'
$Form2.Controls.Add($Label134)

$TextBox123.multiline             = $true
$TextBox123.width                 = 180
$TextBox123.height                = 30
$TextBox123.enabled               = $false
$TextBox123.location              = New-Object System.Drawing.Point(412,152)
$TextBox123.Font                  = 'Microsoft Sans Serif,10'
$Form2.Controls.Add($TextBox123)

$Label135.text                    = "MASCARA DE RED"
$Label135.AutoSize                = $true
$Label135.width                   = 25
$Label135.height                  = 10
$Label135.location                = New-Object System.Drawing.Point(437,138)
$Label135.Font                    = 'Microsoft Sans Serif,10'
$Form2.Controls.Add($Label135)

$TextBox124.multiline             = $true
$TextBox124.width                 = 180
$TextBox124.height                = 30
$TextBox124.location              = New-Object System.Drawing.Point(658,150)
$TextBox124.Font                  = 'Microsoft Sans Serif,10'
$Form2.Controls.Add($TextBox124)

$Label136.text                    = "GATEWAY"
$Label136.AutoSize                = $true
$Label136.width                   = 25
$Label136.height                  = 10
$Label136.location                = New-Object System.Drawing.Point(712,138)
$Label136.Font                    = 'Microsoft Sans Serif,10'
$Form2.Controls.Add($Label136)

$Label137.text                    = "RUTA 3:"
$Label137.AutoSize                = $true
$Label137.width                   = 25
$Label137.height                  = 10
$Label137.location                = New-Object System.Drawing.Point(24,156)
$Label137.Font                    = 'Microsoft Sans Serif,10,style=Bold'
$Label137.ForeColor               = "#000000"
$Form2.Controls.Add($Label137)

$TextBox125.multiline             = $true
$TextBox125.width                 = 180
$TextBox125.height                = 30
$TextBox125.location              = New-Object System.Drawing.Point(113,98)
$TextBox125.Font                  = 'Microsoft Sans Serif,10'
$Form2.Controls.Add($TextBox125)

$Label138.text                    = "DIRECCION IP"
$Label138.AutoSize                = $true
$Label138.width                   = 25
$Label138.height                  = 10
$Label138.location                = New-Object System.Drawing.Point(151,85)
$Label138.Font                    = 'Microsoft Sans Serif,10'
$Form2.Controls.Add($Label138)

$Label139.text                    = "/"
$Label139.AutoSize                = $true
$Label139.width                   = 25
$Label139.height                  = 10
$Label139.location                = New-Object System.Drawing.Point(296,102)
$Label139.Font                    = 'Microsoft Sans Serif,14'
$Form2.Controls.Add($Label139)

$TextBox126.multiline             = $false
$TextBox126.width                 = 0
$TextBox126.height                = 30
$TextBox126.location              = New-Object System.Drawing.Point(306,99)
$TextBox126.Font                  = 'Microsoft Sans Serif,10'
$Form2.Controls.Add($TextBox126)

$ComboBox170.text                  = "comboBox"
$ComboBox170.width                 = 55
$ComboBox170.height                = 74
$ComboBox170.location              = New-Object System.Drawing.Point(305,100)
$ComboBox170.Font                  = 'Microsoft Sans Serif,10'
$Form2.Controls.Add($ComboBox170)

$Label140.text                    = "Prefijo"
$Label140.AutoSize                = $true
$Label140.width                   = 25
$Label140.height                  = 10
$Label140.location                = New-Object System.Drawing.Point(312,88)
$Label140.Font                    = 'Microsoft Sans Serif,10'
$Form2.Controls.Add($Label140)

$TextBox127.multiline             = $true
$TextBox127.width                 = 180
$TextBox127.height                = 30
$TextBox127.enabled               = $false
$TextBox127.location              = New-Object System.Drawing.Point(412,96)
$TextBox127.Font                  = 'Microsoft Sans Serif,10'
$Form2.Controls.Add($TextBox127)

$Label141.text                    = "MASCARA DE RED"
$Label141.AutoSize                = $true
$Label141.width                   = 25
$Label141.height                  = 10
$Label141.location                = New-Object System.Drawing.Point(437,82)
$Label141.Font                    = 'Microsoft Sans Serif,10'
$Form2.Controls.Add($Label141)

$TextBox128.multiline             = $true
$TextBox128.width                 = 180
$TextBox128.height                = 30
$TextBox128.location              = New-Object System.Drawing.Point(658,94)
$TextBox128.Font                  = 'Microsoft Sans Serif,10'
$Form2.Controls.Add($TextBox128)

$Label142.text                    = "GATEWAY"
$Label142.AutoSize                = $true
$Label142.width                   = 25
$Label142.height                  = 10
$Label142.location                = New-Object System.Drawing.Point(712,82)
$Label142.Font                    = 'Microsoft Sans Serif,10'
$Form2.Controls.Add($Label142)

$Label143.text                    = "RUTA 2:"
$Label143.AutoSize                = $true
$Label143.width                   = 25
$Label143.height                  = 10
$Label143.location                = New-Object System.Drawing.Point(24,101)
$Label143.Font                    = 'Microsoft Sans Serif,10,style=Bold'
$Label143.ForeColor               = "#000000"
$Form2.Controls.Add($Label143)

$TextBox129.multiline             = $true
$TextBox129.width                 = 180
$TextBox129.height                = 30
$TextBox129.location              = New-Object System.Drawing.Point(114,35)
$TextBox129.Font                  = 'Microsoft Sans Serif,10'
$Form2.Controls.Add($TextBox129)

$Label144.text                    = "DIRECCION IP"
$Label144.AutoSize                = $true
$Label144.width                   = 25
$Label144.height                  = 10
$Label144.location                = New-Object System.Drawing.Point(152,22)
$Label144.Font                    = 'Microsoft Sans Serif,10'
$Form2.Controls.Add($Label144)

$Label145.text                    = "/"
$Label145.AutoSize                = $true
$Label145.width                   = 25
$Label145.height                  = 10
$Label145.location                = New-Object System.Drawing.Point(297,39)
$Label145.Font                    = 'Microsoft Sans Serif,14'
$Form2.Controls.Add($Label145)

$TextBox130.multiline             = $false
$TextBox130.width                 = 0
$TextBox130.height                = 30
$TextBox130.location              = New-Object System.Drawing.Point(307,36)
$TextBox130.Font                  = 'Microsoft Sans Serif,10'
$Form2.Controls.Add($TextBox130)

$ComboBox180.text                  = "comboBox"
$ComboBox180.width                 = 55
$ComboBox180.height                = 74
$ComboBox180.location              = New-Object System.Drawing.Point(306,37)
$ComboBox180.Font                  = 'Microsoft Sans Serif,10'
$Form2.Controls.Add($ComboBox180)

$Label146.text                    = "Prefijo"
$Label146.AutoSize                = $true
$Label146.width                   = 25
$Label146.height                  = 10
$Label146.location                = New-Object System.Drawing.Point(313,25)
$Label146.Font                    = 'Microsoft Sans Serif,10'
$Form2.Controls.Add($Label146)

$TextBox131.multiline             = $true
$TextBox131.width                 = 180
$TextBox131.height                = 30
$TextBox131.enabled               = $false
$TextBox131.location              = New-Object System.Drawing.Point(413,33)
$TextBox131.Font                  = 'Microsoft Sans Serif,10'
$Form2.Controls.Add($TextBox131)

$Label147.text                    = "MASCARA DE RED"
$Label147.AutoSize                = $true
$Label147.width                   = 25
$Label147.height                  = 10
$Label147.location                = New-Object System.Drawing.Point(438,19)
$Label147.Font                    = 'Microsoft Sans Serif,10'
$Form2.Controls.Add($Label147)

$TextBox132.multiline             = $true
$TextBox132.width                 = 180
$TextBox132.height                = 30
$TextBox132.location              = New-Object System.Drawing.Point(659,31)
$TextBox132.Font                  = 'Microsoft Sans Serif,10'
$Form2.Controls.Add($TextBox132)

$Label148.text                    = "GATEWAY"
$Label148.AutoSize                = $true
$Label148.width                   = 25
$Label148.height                  = 10
$Label148.location                = New-Object System.Drawing.Point(713,19)
$Label148.Font                    = 'Microsoft Sans Serif,10'
$Form2.Controls.Add($Label148)

$Button110.BackColor               = "#acc9f8"
$Button110.text                    = "ACEPTAR"
$Button110.width                   = 150
$Button110.height                  = 40
$Button110.location                = New-Object System.Drawing.Point(747,593)
$Button110.Font                    = 'Microsoft Sans Serif,10'
$Form2.Controls.Add($Button110)










$Form2.Add_Shown({$Form.Activate()})
[void] $Form2.ShowDialog();
