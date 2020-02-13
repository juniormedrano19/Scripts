[void] [System.Reflection.Assembly]::LoadWithPartialName("System.Drawing") 
[void] [System.Reflection.Assembly]::LoadWithPartialName("System.Windows.Forms")  #loading the necessary .net libraries (using void to suppress output)

$Form.Add_Shown({$Form.Activate()})
[void] $Form.ShowDialog()   #activating the form
$InputBox = New-Object System.Windows.Forms.TextBox #creating the text box
$InputBox.Location = New-Object System.Drawing.Size(20,50) #location of the text box (px) in relation to the primary window's edges (length, height)
$InputBox.Size = New-Object System.Drawing.Size(150,20) #the size in px of the text box (length, height)
$Form.Controls.Add($InputBox) #activating the text box inside the primary window
$outputBox = New-Object System.Windows.Forms.TextBox #creating the text box
$outputBox.Location = New-Object System.Drawing.Size(10,150) #location of the text box (px) in relation to the primary window's edges (length, height)
$outputBox.Size = New-Object System.Drawing.Size(565,200) #the size in px of the text box (length, height)
$outputBox.MultiLine = $True #declaring the text box as multi-line
$outputBox.ScrollBars = "Vertical" #adding scroll bars if required
$Form.Controls.Add($outputBox) #activating the text box inside the primary window
$Button = New-Object System.Windows.Forms.Button #create the button
$Button.Location = New-Object System.Drawing.Size(400,30) #location of the button (px) in relation to the primary window's edges (length, height)
$Button.Size = New-Object System.Drawing.Size(110,80) #the size in px of the button (length, height)
$Button.Text = "Action" #labeling the button
$Button.Add_Click({}) #the action triggered by the button
$Form.Controls.Add($Button) #activating the button inside the primary window
function pingInfo {
$wks=$InputBox.text; #we're taking the text from the input box into the variable $wks
$pingResult=ping $wks | fl | out-string;  #ping $wks
$outputBox.text=$pingResult #send the ping results to the output box
                     } #end pingInfo
$Button.Add_Click({pingInfo})
[void] [System.Reflection.Assembly]::LoadWithPartialName("System.Drawing") 
[void] [System.Reflection.Assembly]::LoadWithPartialName("System.Windows.Forms")  

$Form = New-Object System.Windows.Forms.Form    
$Form.Size = New-Object System.Drawing.Size(600,400)  

############################################## Start functions

function pingInfo {
$wks=$InputBox.text;
$pingResult=ping $wks | fl | out-string;
$outputBox.text=$pingResult
                     } #end pingInfo

############################################## end functions

############################################## Start text fields

$InputBox = New-Object System.Windows.Forms.TextBox 
$InputBox.Location = New-Object System.Drawing.Size(20,50) 
$InputBox.Size = New-Object System.Drawing.Size(150,20) 
$Form.Controls.Add($InputBox) 

$outputBox = New-Object System.Windows.Forms.TextBox 
$outputBox.Location = New-Object System.Drawing.Size(10,150) 
$outputBox.Size = New-Object System.Drawing.Size(565,200) 
$outputBox.MultiLine = $True 
$outputBox.ScrollBars = "Vertical" 
$Form.Controls.Add($outputBox) 

############################################## end text fields

############################################## Start buttons

$Button = New-Object System.Windows.Forms.Button 
$Button.Location = New-Object System.Drawing.Size(400,30) 
$Button.Size = New-Object System.Drawing.Size(110,80) 
$Button.Text = "Ping" 
$Button.Add_Click({pingInfo}) 
$Form.Controls.Add($Button) 

############################################## end buttons

$Form.Add_Shown({$Form.Activate()})
[void] $Form.ShowDialog();