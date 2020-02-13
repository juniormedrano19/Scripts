<#   
================================================================================ 
========= GUI-Set-Locaiton.ps1 ======================================= 
================================================================================ 
 Name: AzureSubscriptions 
 Purpose: Demonstrate how to change default and current Location using GUI popup Dialog 
 Author: Dan Stolts - dstolts&microsoft.com - http://ITProGuru.com 
 Syntax/Execution: Copy portion of script you want to use and paste into PowerShell (or ISE)  
 Description: How to change default and current Location using GUI popup Dialog in PowerShell 
 Disclaimer: Use at your own Risk!  See details at http://ITProGuru.com/privacy  
 Limitations:  
         * Must Run PowerShell (or ISE)  
        * UAC may get in the way depending on your settings (See: http://ITProGuru.com/PS-UAC) 
 ================================================================================ 
#> 
# Use GUI to select default location 
$object = New-Object -comObject Shell.Application    
$folder = $object.BrowseForFolder(0, "Please select Upload/Download Folder location", 0) 
if ($folder -ne $null) { 
    $myPath = $folder.self.Path.substring(0,$folder.self.path.length)    # Set the Path 
    if ($folder.self.path.substring($folder.self.path.length - 1, 1) -ne "\") { 
        # Add Trailing backslash  
        $myPath = $folder.self.Path.substring(0,$folder.self.path.length) + "\"}      
    Write-Host $myPath "has been set as the current location" -ForegroundColor Green  
    Set-Location $myPath 
} 
   
# video of Script https://channel9.msdn.com/Series/GuruPowerShell 
# More scripts from Dan Stolts "ITProGuru" at http://ITProGuru.com/Scripts    