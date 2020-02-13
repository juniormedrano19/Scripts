$acl = Get-Acl "C:\SipRecsa"

#$rule = New-Object System.Security.AccessControl.FileSystemAccessRule("domain\user or usergroup","Modify", "ContainerInherit, ObjectInherit", "None", "Allow")
#$acl.AddAccessRule($rule)

$rule = New-Object System.Security.AccessControl.FileSystemAccessRule("BUILTIN\Usuarios","FullControl", "Allow")
$acl.SetAccessRule($rule)

Set-Acl "C:\SipRecsa" $acl
















$UsersAm = "Users" #presenting the sAMAccountname in this format  
#stops it displaying in Distinguished Name format  
 
#Define FileSystemAccessRights:identifies what type of access we are defining, whether it is Full Access, Read, Write, Modify 
 
$FileSystemAccessRights = [System.Security.AccessControl.FileSystemRights]"FullControl" 
 
#define InheritanceFlags:defines how the security propagates to child objects by default 
#Very important - so that users have ability to create or delete files or folders  
#in their folders 
 
$InheritanceFlags = [System.Security.AccessControl.InheritanceFlags]::"ContainerInherit", "ObjectInherit" 
 
#Define PropagationFlags: specifies which access rights are inherited from the parent folder (users folder). 
 
$PropagationFlags = [System.Security.AccessControl.PropagationFlags]::None 
 
#Define AccessControlType:defines if the rule created below will be an 'allow' or 'Deny' rule 
 
$AccessControl =[System.Security.AccessControl.AccessControlType]::Allow  
#define a new access rule to apply to users folfers 
 
$NewAccessrule = New-Object System.Security.AccessControl.FileSystemAccessRule($UsersAm, $FileSystemAccessRights, $InheritanceFlags, $PropagationFlags, $AccessControl)  
 
 
#set acl for each user folder#First, define the folder for each user 
 
#$userfolder = "\\70411SRV1\Users$\$($ADUser.sAMAccountname)" 
$userfolder = "C:\SipRecsa"
 
$currentACL = Get-ACL -path $userfolder 
#Add this access rule to the ACL 
$currentACL.SetAccessRule($NewAccessrule) 
#Write the changes to the user folder 
Set-ACL -path $userfolder -AclObject $currentACL 



$UserObj = New-Object System.Security.Principal.NTAccount($hostname,$user)


    $acl = Get-Acl $newpath
    $acl.SetAccessRuleProtection($True, $False)
    $accessRule = New-Object System.Security.AccessControl.FileSystemAccessRule("$domain\$user","AppendData,CreateDirectories,CreateFiles,DeleteSubdirectoriesAndFiles,ExecuteFile,ListDirectory,Modify,Read,ReadAndExecute,ReadAttributes,ReadData,ReadExtendedAttributes,ReadPermissions,Synchronize,Traverse,Write,WriteAttributes,WriteData,WriteExtendedAttributes","ContainerInherit, ObjectInherit","None","Allow")
    $acl.SetAccessRule($accessRule)
    $accessRule = New-Object System.Security.AccessControl.FileSystemAccessRule("NT AUTHORITY\SYSTEM","FullControl","ContainerInherit, ObjectInherit","None","Allow")
    $acl.SetAccessRule($accessRule)
    $accessRule = New-Object System.Security.AccessControl.FileSystemAccessRule("BUILTIN\Administrators","FullControl","ContainerInherit, ObjectInherit","None","Allow")
    $acl.SetAccessRule($accessRule)
    $accessRule = New-Object System.Security.AccessControl.FileSystemAccessRule("1OAK\$user","Delete","ContainerInherit, ObjectInherit","None","Allow")
    $acl.removeAccessRule($accessRule)
    $acl.SetOwner($UserObj)
    $acl | Set-Acl $newpath