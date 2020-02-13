<#   
================================================================================ 
========= GUI-FileSaveDialog.ps1 ======================================= 
================================================================================ 
 Name: GUI-FileSaveDialog.ps1 
 Purpose: Demonstrate how to Open a GUI File Save Dialog to collect a filename and path using PowerShell 
 Author: Dan Stolts - dstolts$microsoft.com - http://ITProGuru.com 
 Syntax/Execution: Copy portion of script you want to use and paste into PowerShell (or ISE)  
 Description: How to collect filename and path for a save as operation using GUI popup Dialog in PowerShell 
 Disclaimer: Use at your own Risk!  See details at http://ITProGuru.com/privacy  
 Limitations:  
         * Must Run PowerShell (or ISE)  
        * UAC may get in the way depending on your settings (See: http://ITProGuru.com/PS-UAC) 
        * You may want to change the FileType Filter 
        * In ISE, the dialog box sometimes pops under the ISE so you may have to toggle to it 
 ================================================================================ 
#> 
# Class Details:  https://msdn.microsoft.com/en-us/library/system.windows.forms.savefiledialog(v=vs.110).aspx 
$SaveFileDialog = New-Object windows.forms.savefiledialog   
    $SaveFileDialog.initialDirectory = [System.IO.Directory]::GetCurrentDirectory()   
    $SaveFileDialog.title = "Save File to Disk"   
    #$SaveFileDialog.filter = "All files (*.*)| *.*"   
    #$SaveFileDialog.filter = "PublishSettings Files|*.publishsettings|All Files|*.*" 
    $SaveFileDialog.filter = "Log Files|*.Log|PublishSettings Files|*.publishsettings|All Files|*.*" 
    $SaveFileDialog.ShowHelp = $True   
    Write-Host "Where would you like to create log file?... (see File Save Dialog)" -ForegroundColor Green  
    $result = $SaveFileDialog.ShowDialog()    
    $result 
    if($result -eq "OK")    {    
            Write-Host "Selected File and Location:"  -ForegroundColor Green  
            $SaveFileDialog.filename   
        } 
        else { Write-Host "File Save Dialog Cancelled!" -ForegroundColor Yellow} 
#$SaveFileDialog.Dispose() 
 
# video of Script https://channel9.msdn.com/Series/GuruPowerShell 
# More scripts from Dan Stolts "ITProGuru" at http://ITProGuru.com/Scripts