[System.Reflection.Assembly]::LoadWithPartialName("System.Windows.Forms");
 
function Get-URL {
  $Form = New-Object System.Windows.Forms.Form;
  $Form.width = 300
  $Form.height = 110
  $Form.Text = ”Please enter a URL”
 
  $txtURL = new-object System.Windows.Forms.TextBox;
  $txtURL.Location = new-object System.Drawing.Size(130,7)
  $txtURL.Size = new-object System.Drawing.Size(130,30)
  $Form.Controls.Add($txtURL);
 
  $lblURL = new-object System.Windows.Forms.Label;
  $lblURL.Location = new-object System.Drawing.Size(10,10)
  $lblURL.size = new-object System.Drawing.Size(130,20)
  $lblURL.Text = "Please enter a URL:"
  $Form.Controls.Add($lblURL);
 
  $btnSubmit = new-object System.Windows.Forms.Button
  $btnSubmit.Location = new-object System.Drawing.Size(100,40)
  $btnSubmit.Size = new-object System.Drawing.Size(100,20)
  $btnSubmit.Text = "Submit"
  $btnSubmit.Add_Click({Return-Get-URL});
  $form.Controls.Add($btnSubmit);
 
  $Form.Add_Shown({$Form.Activate()});
  $x = $Form.ShowDialog();
  return $txtURL.Text;
}
 
function Return-Get-URL {
  $Form.Close();
}
 
$url = Get-URL
echo $url