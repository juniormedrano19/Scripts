
$Memory = Get-CimInstance -ClassName Win32_ComputerSystem -ComputerName $env:computerName | Select-Object @{Name="Installed Memory (RAM)";Expression={[math]::Round($_.TotalPhysicalMemory / 1GB)}}
$Class = Get-CimInstance -ClassName Win32_OperatingSystem -ComputerName $env:computername


$Object = New-Object -TypeName PSObject
$Object | Add-Member -MemberType NoteProperty -Name ComputerName -Value $env:computerName.ToUpper()
$Object | Add-Member -MemberType NoteProperty -Name Architecture -Value $Class.OSArchitecture
$Object | Add-Member -MemberType NoteProperty -Name OperatingSystem -Value $Class.Caption
$Object | Add-Member -MemberType NoteProperty -Name ServicePack -Value $Class.ServicePackMajorVersion
$Object | Add-Member -MemberType NoteProperty -Name InstalledMemoryRam -Value $Memory.'Installed Memory (RAM)'

