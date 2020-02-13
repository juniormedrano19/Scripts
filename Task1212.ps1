$TaskName = "addRoute"
$TaskDescription = "Agregar rutas estáticas"
$TaskCommand = "c:\windows\system32\WindowsPowerShell\v1.0\powershell.exe"
$TaskScript = "C:\PS\StartupScript.ps1"
$TaskArg = "-WindowStyle Hidden -NonInteractive -Executionpolicy unrestricted -file $TaskScript"
$TaskStartTime = [datetime]::Now.AddMinutes(1)
$service = new-object -ComObject("Schedule.Service")
$service.Connect()
$rootFolder = $service.GetFolder("\")
$TaskDefinition = $service.NewTask(0)
$TaskDefinition.RegistrationInfo.Description = "$TaskDescription"
$TaskDefinition.Settings.Enabled = $true
$TaskDefinition.Settings.AllowDemandStart = $true
$triggers = $TaskDefinition.Triggers
#http://msdn.microsoft.com/en-us/library/windows/desktop/aa383915(v=vs.85).aspx
$trigger = $triggers.Create(8)

$Trigger= New-ScheduledTaskTrigger -AtStartup
#$Trigger1= New-ScheduledTaskTrigger -AtLogon
#$scheduleObject = New-Object -ComObject schedule.service
#$scheduleObject.connect()
#$rootFolder = $scheduleObject.GetFolder("\")
$settings =New-ScheduledTaskSettingsSet -Compatibility Win8
$peru=hostname;
$usuario="Administrador"
#$User= "$hostname\$usuario"
$Action= New-ScheduledTaskAction -Execute "C:\Windows\prueba.bat"
Register-ScheduledTask -TaskName "AAABB" -Description "Agregar rutas estáticas"  -Trigger $Trigger   -User "$env:USERDOMAIN\$usuario" -Password 'R3c542016C4ll' -Action $Action -Settings $settings

















$taskService.RootFolder.DeleteTask("TaskName", false);

$taskDefinition = $taskService.NewTask();                        
$taskDefinition.RegistrationInfo.Author = $WindowsIdentity.GetCurrent().Name;

$taskDefinition.RegistrationInfo.Description = "Runs Task with arguments: " + $arguments;
$taskDefinition.Principal.LogonType = $TaskLogonType.InteractiveTokenOrPassword;

$action = new ExecAction($path, $arguments);
$taskDefinition.Actions.Add($action);
$taskService.RootFolder.RegisterTaskDefinition("TaskName", $taskDefinition, $TaskCreation.Create, "domain\\user", $password, $TaskLogonType.InteractiveTokenOrPassword);

//get task:
$task = $taskService.RootFolder.GetTasks().Where(a => a.Name == ("TaskName").FirstOrDefault();
log.Info("Start task " + $task.Name + " with arguemtns " + $arguments);

try
{
    $task.Run();
}
catch (Exception ex)
{
    $log.Error("Error starting task in TaskSheduler with message: " + $ex.Message);
}









$RegistryKeyPath="HKLM:\System\CurrentControlSet\Control\Lsa"
$RegistryKey="disabledomaincreds"
$value="0"
Set-ItemProperty -Path "$RegistryKeyPath" -Name $RegistryKey -Value $Value; 
$TaskName="abc122";
$Interval="1" #in minutes
$TaskToRun="c:\windows\prueba.bat";
$NoOfDaystoRun="7";
$peru=hostname;
$usuario="jmedrano"
$RunAsUser="$peru\$usuario"
$RunAsUserPwd="jmedrano2017"
$a=schtasks.exe /create /RU $RunAsUser /RP $RunAsUserPwd /SC DAILY /RI $Interval /TN $TaskName /TR $TaskToRun /RL HIGHEST



#$settings =New-ScheduledTaskSettingsSet -Compatibility Win8
$peru=hostname;
$usuario="Administrador"
$RunAsUser="$peru\$usuario"
$RunAsUserPwd="R3c542016C4ll"
schtasks /Create /S $peru /RU $RunAsUser /RP $RunAsUserPwd /SC ONSTART /TN "AAABB" /TR "C:\Windows\prueba.bat" /RL HIGHEST /NP
#Set-ScheduledTask -TaskName "AAABB" -Settings $settings -user $RunAsUser -Password $RunAsUserPwd 
#schtasks /Change /TN "AAABB" /S $peru /RU $RunAsUser  /RP $RunAsUserPwd /RL HIGHEST 
