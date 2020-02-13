<#   
================================================================================ 
========= GUI-FileOpenDialog.ps1 ======================================= 
================================================================================ 
 Name: GUI-FileOpenDialog.ps1  
 Purpose: Demonstrate how to Open a GUI File Open Dialog to collect a filename and path using PowerShell 
 Author: Dan Stolts - dstolts&microsoft.com - http://ITProGuru.com 
 Syntax/Execution: Copy portion of script you want to use and paste into PowerShell (or ISE)  
 Description: How to change default and current Location using GUI popup Dialog in PowerShell 
 Disclaimer: Use at your own Risk!  See details at http://ITProGuru.com/privacy  
 Limitations:  
         * Must Run PowerShell (or ISE)  
        * UAC may get in the way depending on your settings (See: http://ITProGuru.com/PS-UAC) 
        * You may want to change the FileType Filter 
        * In ISE, the dialog box sometimes pops under the ISE so you may have to toggle to it 
 ================================================================================ 
#># Class Details:  https://msdn.microsoft.com/en-us/library/system.windows.forms.openfiledialog(v=vs.110).aspx 
$openFileDialog = New-Object windows.forms.openfiledialog   
    $openFileDialog.initialDirectory = [System.IO.Directory]::GetCurrentDirectory()   
    $openFileDialog.title = "Select PublishSettings Configuration File to Import"   
    $openFileDialog.filter = "All files (*.*)| *.*"   
    $openFileDialog.filter = "PublishSettings Files|*.publishsettings|All Files|*.*" 
    $openFileDialog.ShowHelp = $True   
    Write-Host "Select Downloaded Settings File... (see FileOpen Dialog)" -ForegroundColor Green  
    $result = $openFileDialog.ShowDialog()   # Display the Dialog / Wait for user response 
    # in ISE you may have to alt-tab or minimize ISE to see dialog box 
    $result 
    if($result -eq "OK")    {    
            Write-Host "Selected Downloaded Settings File:"  -ForegroundColor Green  
            $OpenFileDialog.filename   
            # $OpenFileDialog.CheckFileExists 
             
            # Import-AzurePublishSettingsFile -PublishSettingsFile $openFileDialog.filename  
            # Unremark the above line if you actually want to perform an import of a publish settings file  
            Write-Host "Import Settings File Imported!" -ForegroundColor Green 
        } 
        else { Write-Host "Import Settings File Cancelled!" -ForegroundColor Yellow} 
    
# video of Script https://channel9.msdn.com/Series/GuruPowerShell 
# More scripts from Dan Stolts "ITProGuru" at http://ITProGuru.com/Scripts