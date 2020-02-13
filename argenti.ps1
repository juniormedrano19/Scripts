[void][reflection.assembly]::Load('System.Windows.Forms, Version=2.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089')
	[void][reflection.assembly]::Load('System.Data, Version=2.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089')
	[void][reflection.assembly]::Load('System.Drawing, Version=2.0.0.0, Culture=neutral, PublicKeyToken=b03f5f7f11d50a3a')
	[void][reflection.assembly]::Load('System.DirectoryServices, Version=2.0.0.0, Culture=neutral, PublicKeyToken=b03f5f7f11d50a3a')
	[void][reflection.assembly]::Load('System.ServiceProcess, Version=2.0.0.0, Culture=neutral, PublicKeyToken=b03f5f7f11d50a3a')

	[System.Windows.Forms.Application]::EnableVisualStyles()
	$MainForm = New-Object 'System.Windows.Forms.Form'
	$textboxMainForm = New-Object 'System.Windows.Forms.TextBox'
	$buttonOpenChildForm = New-Object 'System.Windows.Forms.Button'
	$InitialFormWindowState = New-Object 'System.Windows.Forms.FormWindowState'
    	$buttonOpenChildForm_Click={
		#TODO: Place custom script here
		$textboxMainForm.Text = ''
        Call-ChildForm_psf
		if ($ChildForm_textboxChildForm -ne '')
		{
			$textboxMainForm.Text = $ChildForm_textboxChildForm
		}		
	}

    function Call-ChildForm_psf
{

	[void][reflection.assembly]::Load('System.Windows.Forms, Version=2.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089')
	[void][reflection.assembly]::Load('System.Data, Version=2.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089')
	[void][reflection.assembly]::Load('System.Drawing, Version=2.0.0.0, Culture=neutral, PublicKeyToken=b03f5f7f11d50a3a')
	[void][reflection.assembly]::Load('System.DirectoryServices, Version=2.0.0.0, Culture=neutral, PublicKeyToken=b03f5f7f11d50a3a')
	[void][reflection.assembly]::Load('System.ServiceProcess, Version=2.0.0.0, Culture=neutral, PublicKeyToken=b03f5f7f11d50a3a')

	[System.Windows.Forms.Application]::EnableVisualStyles()
	$formChildForm = New-Object 'System.Windows.Forms.Form'
	$labelSendMessage = New-Object 'System.Windows.Forms.Label'
	$textboxChildForm = New-Object 'System.Windows.Forms.TextBox'
	$buttonOK = New-Object 'System.Windows.Forms.Button'
	$InitialFormWindowState = New-Object 'System.Windows.Forms.FormWindowState'

	$FormEvent_Load={
		$buttonOK.Enabled = $false	
	}
	
	$textboxChildForm_TextChanged={
		
		$buttonOK.Enabled = $false
		if ($textboxChildForm.Text -ne '') {
			$buttonOK.Enabled = $true
		}
	}
	
	$buttonOK_Click = {
	
	}
	
	$labelSendMessage_Click = { }	
	
	$Form_StateCorrection_Load=
	{
	
		$formChildForm.WindowState = $InitialFormWindowState
	}
	
	$Form_StoreValues_Closing=
	{

		$script:ChildForm_textboxChildForm = $textboxChildForm.Text
	}

	
	$Form_Cleanup_FormClosed=
	{
	
		try
		{
			$labelSendMessage.remove_Click($labelSendMessage_Click)
			$textboxChildForm.remove_TextChanged($textboxChildForm_TextChanged)
			$buttonOK.remove_Click($buttonOK_Click)
			$formChildForm.remove_Load($FormEvent_Load)
			$formChildForm.remove_Load($Form_StateCorrection_Load)
			$formChildForm.remove_Closing($Form_StoreValues_Closing)
			$formChildForm.remove_FormClosed($Form_Cleanup_FormClosed)
		}
		catch [Exception]
		{ }
	}

	$formChildForm.SuspendLayout()
	
	$formChildForm.Controls.Add($labelSendMessage)
	$formChildForm.Controls.Add($textboxChildForm)
	$formChildForm.Controls.Add($buttonOK)
	$formChildForm.AcceptButton = $buttonOK
	$formChildForm.AutoScaleDimensions = '6, 13'
	$formChildForm.AutoScaleMode = 'Font'
	$formChildForm.ClientSize = '383, 140'
	$formChildForm.FormBorderStyle = 'FixedDialog'
	$formChildForm.Margin = '5, 5, 5, 5'
	$formChildForm.MaximizeBox = $False
	$formChildForm.MinimizeBox = $False
	$formChildForm.Name = 'formChildForm'
	$formChildForm.StartPosition = 'CenterScreen'
	$formChildForm.Text = 'Child Form'
	$formChildForm.add_Load($FormEvent_Load)

	$labelSendMessage.Location = '12, 9'
	$labelSendMessage.Name = 'labelSendMessage'
	$labelSendMessage.Size = '215, 19'
	$labelSendMessage.TabIndex = 2
	$labelSendMessage.Text = 'Send a message to Main Form'
	$labelSendMessage.add_Click($labelSendMessage_Click)

	$textboxChildForm.Font = 'Segoe UI, 12pt'
	$textboxChildForm.Location = '10, 43'
	$textboxChildForm.Margin = '5, 5, 5, 5'
	$textboxChildForm.Multiline = $True
	$textboxChildForm.Name = 'textboxChildForm'
	$textboxChildForm.Size = '359, 38'
	$textboxChildForm.TabIndex = 1
	$textboxChildForm.add_TextChanged($textboxChildForm_TextChanged)

	$buttonOK.Anchor = 'Bottom, Left, Right'
	$buttonOK.DialogResult = 'OK'
	$buttonOK.Location = '273, 95'
	$buttonOK.Name = 'buttonOK'
	$buttonOK.Size = '98, 33'
	$buttonOK.TabIndex = 0
	$buttonOK.Text = '&OK'
	$buttonOK.UseVisualStyleBackColor = $True
	$buttonOK.add_Click($buttonOK_Click)
	$formChildForm.ResumeLayout()

	$InitialFormWindowState = $formChildForm.WindowState

	$formChildForm.add_Load($Form_StateCorrection_Load)

	$formChildForm.add_FormClosed($Form_Cleanup_FormClosed)

	$formChildForm.add_Closing($Form_StoreValues_Closing)

	return $formChildForm.ShowDialog()

}

	
    $MainForm.SuspendLayout()
    	$MainForm.Controls.Add($textboxMainForm)
	$MainForm.Controls.Add($buttonOpenChildForm)
	$MainForm.AutoScaleDimensions = '6, 13'
	$MainForm.AutoScaleMode = 'Font'
	$MainForm.ClientSize = '424, 150'
	$MainForm.Margin = '5, 5, 5, 5'
	$MainForm.Name = 'MainForm'
	$MainForm.Text = 'Main Form'
	$MainForm.add_Load($OnLoadFormEvent)

	$textboxMainForm.Font = 'Segoe UI, 12pt'
	$textboxMainForm.Location = '12, 80'
	$textboxMainForm.Margin = '5, 5, 5, 5'
	$textboxMainForm.Multiline = $True
	$textboxMainForm.Name = 'textboxMainForm'
	$textboxMainForm.ReadOnly = $True
	$textboxMainForm.Size = '400, 51'
	$textboxMainForm.TabIndex = 1
	$textboxMainForm.add_TextChanged($textboxMainForm_TextChanged)

	$buttonOpenChildForm.Location = '12, 12'
	$buttonOpenChildForm.Name = 'buttonOpenChildForm'
	$buttonOpenChildForm.Size = '144, 37'
	$buttonOpenChildForm.TabIndex = 0
	$buttonOpenChildForm.Text = 'Open Child Form'
	$buttonOpenChildForm.UseVisualStyleBackColor = $True
	$buttonOpenChildForm.add_Click($buttonOpenChildForm_Click)
	$MainForm.ResumeLayout()

	$InitialFormWindowState = $MainForm.WindowState

	$MainForm.add_Load($Form_StateCorrection_Load)

	$MainForm.add_FormClosed($Form_Cleanup_FormClosed)
	
	$MainForm.add_Closing($Form_StoreValues_Closing)
	
	return $MainForm.ShowDialog()