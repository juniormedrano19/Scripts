   # Load Windows Forms assembly

            [void][System.Reflection.Assembly]::LoadWithPartialName("System.Windows.Forms") 
            [void][System.Windows.Forms.Application]::EnableVisualStyles()

            # Create a GUI

            $form = New-Object System.Windows.Forms.Form
            $form.text = "Software Uninstall"
            $form.Size = New-Object System.Drawing.Size(920,550)
            $form.BackColor='SkyBlue'
            $form.FormBorderStyle = [System.Windows.Forms.FormBorderStyle]::Fixed3D
            $form.StartPosition = [System.Windows.Forms.FormStartPosition]::CenterScreen
            $dataGridView = New-Object System.Windows.Forms.DataGridView
            $dataGridView.Size = New-Object System.Drawing.Size(900,400)
            $dataGridView.DefaultCellStyle.BackColor = 'LightBlue'

            #Button 

            $button = New-Object System.Windows.Forms.Button
            $button.Location = New-Object System.Drawing.Size(400,420)
            $button.Size = New-Object System.Drawing.Size(75,25)
            $button.BackColor = "LightGreen"
            $button.text = "Refresh"
            $form.Controls.Add($button)
            $form.Controls.Add($dataGridView)

            # Note Label
            $Label0 = New-Object System.Windows.Forms.Label
            $Label0.Location = New-Object System.Drawing.Size(15,450)
            $Label0.Size = New-Object System.Drawing.Size(880,50)
            $Label0.Backcolor = [System.Drawing.Color]::Yellow
            $Label0.Font = New-Object System.Drawing.Font("Calibri",14,[System.Drawing.FontStyle]::Bold) 
            $Label0.Text = "Note: This Script Cannot Uninstall Policy Restricted Apps such as McAfee etc. Repair option is not Available in this Version. For Reinstall of Software Kindly use SCCM."
            $form.Controls.Add($Label0) 


            # Select appropriate columns

            $dataGridView.Columns.Insert(0, (New-Object System.Windows.Forms.DataGridViewButtonColumn))
            $dataGridView.ColumnCount = 8
            $dataGridView.ColumnHeadersVisible = $true
            #$dataGridView.HeaderText = "Uninstall"
            $dataGridView.Columns[0].Name = "Uninstall"
            $dataGridView.Columns[1].Name = "Description"
            $dataGridView.Columns[2].Name = "IdentifyingNumber"
            $dataGridView.Columns[3].Name = "Name"
            $dataGridView.Columns[4].Name = "Vendor"
            $dataGridView.Columns[5].Name = "Version"
            $dataGridView.Columns[6].Name = "Caption"
            $dataGridView.Columns[7].Name = "InstallLocation"

            $dataGridView.Columns[0].width = 50
            $dataGridView.Columns[1].width = 200

            # Get a list of items

            Get-WmiObject -Class Win32_Product | foreach {
                $dataGridView.Rows.Add("Uninstall",$_.Description,$_.IdentifyingNumber,$_.Name,$_.Vendor,$_.Version,$_.Caption,$_.InstallLocation) | out-null
            }


            # Refresh

            function gridClick(){
                                    $rowIndex = $dataGridView.CurrentRow.Index
                                    $columnIndex = $dataGridView.CurrentCell.ColumnIndex

                                    If ($columnIndex -eq '0')
                                        {
                                            $columnIndex0 = $dataGridView.ColumnIndex+1
                                            $columnIndex1 = $dataGridView.ColumnIndex+2
                                            $columnIndex2 = $dataGridView.ColumnIndex+3
                                            $columnIndex3 = $dataGridView.ColumnIndex+4
                                            $columnIndex5 = $dataGridView.ColumnIndex+5

                                            $IdentifyingNumber = $dataGridView.Rows[$rowIndex].Cells[$columnIndex1].value
                                            $Name = $dataGridView.Rows[$rowIndex].Cells[$columnIndex0].value
                                            $Version = $dataGridView.Rows[$rowIndex].Cells[$columnIndex5].value

                                            Write-Host $dataGridView.Rows[$rowIndex].Cells[$columnIndex0].value
                                            Write-Host $dataGridView.Rows[$rowIndex].Cells[$columnIndex1].value
                                            Write-Host $dataGridView.Rows[$rowIndex].Cells[$columnIndex5].value


                                            $classKey1 = New-Object PSObject -Property @{
                                                                                            IdentifyingNumber=$IdentifyingNumber
                                                                                            Name=$Name
                                                                                            Version=$Version
                                                                                        }| select IdentifyingNumber, Name, Version

                                            # Write-Host $classKey


                                            $classkey = "IdentifyingNumber=`"$($classKey1.IdentifyingNumber)"",Name=""$($classKey1.Name)"",Version=""$($classKey1.Version)`""


                                            $wshell = New-Object -ComObject Wscript.Shell

                                            $OUTPUT = [System.Windows.Forms.MessageBox]::Show("You Have Selected $Name. Do You Want to Proceed With The Uninstall", "Warning!!!", 4)

                                            if ($OUTPUT -eq "YES" ){       

                                                    Try{

                                                         ([wmi]”\\localhost\root\cimv2:Win32_Product.$classKey”).uninstall()


                                                       }
                                                    Catch{
                                                            Write-Warning $_
                                                         }
                                                }
                                        <#    Else
                                                {
                                                    $wshell = New-Object -ComObject Wscript.Shell

                                                    $wshell.Popup("You Have Selected No, Click Ok to Continue" ,0,"Warning!!!",0x0)
                                                }  
                                        }#>
                                   # Vaid Cell 
                                  <# Else
                                        {   

                                            $wshell = New-Object -ComObject Wscript.Shell

                                            $OUTPUT = $wshell.Popup("You Have Selected Invalid Column. Please click on Uninstall Button" ,0,"Warning!!!",0x0)   
                                        } #>
                                }


            $button.Add_Click({
                $selectedRow = $dataGridView.CurrentRow.Index

                $dataGridView.Rows.Clear()

                start-sleep -s 7

            Get-WmiObject -Class Win32_Product | foreach {
                $dataGridView.Rows.Add("Uninstall",$_.Description,$_.IdentifyingNumber,$_.Name,$_.Vendor,$_.Version,$_.Caption,$_.InstallLocation) | out-null
            }

            })

            $Uninstall = $dataGridView.add_DoubleClick({gridClick})


            # Show the form

            [void]$form.ShowDialog() 