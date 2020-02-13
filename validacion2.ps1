#sources:http://www.powershell.nu/2009/01/21/dropdown-menu-using-windowsforms/

# Save $args in another Variable $server
$server = "192.9.100.201"

# Edit This item to change the DropDown Values
[array]$DropDownArray = "ping", "traceroute", "nslookup"

# This Function Returns the Selected Value and their actions then Closes the Form
function Return-DropDown {
	$Choice = $DropDown.SelectedItem.ToString()
	#$Form.Close()
        if ($choice -eq "ping") 
        {
            write-host "PiNG $server"
            ping $server | Out-Default
        }
        elseif ($choice -eq "traceroute") 
        {
            write-host "TRACEROUTE $server"
           tracert $server| Out-Default
            write-host
        }
        elseif ($choice -eq "nslookup") 
        {
            write-host "NSLOOKUP $server"
           nslookup $server| Out-Default
            write-host
        }    	
}

[System.Reflection.Assembly]::LoadWithPartialName("System.Windows.Forms")
[System.Reflection.Assembly]::LoadWithPartialName("System.Drawing")

$Form = New-Object System.Windows.Forms.Form

$Form.width = 300
$Form.height = 150
$Form.Text = "$server - Network Tools"

$DropDown = new-object System.Windows.Forms.ComboBox
$DropDown.Location = new-object System.Drawing.Size(100,10)
$DropDown.Size = new-object System.Drawing.Size(130,30)

ForEach ($Item in $DropDownArray) {
	$DropDown.Items.Add($Item)
}

$Form.Controls.Add($DropDown)

$DropDownLabel = new-object System.Windows.Forms.Label
$DropDownLabel.Location = new-object System.Drawing.Size(10,10)
$DropDownLabel.size = new-object System.Drawing.Size(100,20)
$DropDownLabel.Text = $args
$args = $server
$Form.Controls.Add($DropDownLabel)

$Button = new-object System.Windows.Forms.Button
$Button.Location = new-object System.Drawing.Size(100,50)
$Button.Size = new-object System.Drawing.Size(100,20)
$Button.Text = "OK"
$Button.Add_Click({Return-DropDown})
$form.Controls.Add($Button)

$Form.Add_Shown({$Form.Activate()})
$Form.ShowDialog()