$appArray = @("3dbuilder", "windowsalarms", "Appconnector", "windowscommunicationsapps", "windowscamera", "CandyCrushSaga",
              "officehub", "skypeapp", "getstarted","zunemusic", "windowsmaps", "Messaging", "solitairecollection", "ConnectivityStore", "bingfinance",
              "zunevideo", "bingnews", "onenote", "people", "CommsPhone", "windowsphone", "photos", "WindowsScan", "bingsports", "windowsstore",
              "Office.Sway", "Twitter", "soundrecord", "bingweather", "xboxapp", "XboxOneSmartGlass")
$appNames = @("3D Builder", "Alarms & Clock", "App Connector", "Calendar and Mail", "Camera", "Candy Crush Saga", "Get Office", "Get Skype", 
              "Get Started", "Groove Music", "Maps", "Messaging", "Microsoft Solitaire Collection", "Microsoft Wi-Fi", "Money", "Movie & TV", "News", 
              "OneNote", "People", "Phone", "Phone Companion", "Photos", "Scan", "Sports", "Store (Not Recommended)", "Sway", "Twitter", "Voice Recorder", 
              "Weather", "Xbox", "Xbox One SmartGlass")

Do{
    $index = 1;

    Write-Host "Select An Option Below to Uninstall...`n"

    foreach ($app in $appNames){
        Write-Host "'$index': $app"
        $index++
    }

    Write-Host "'0': Exit"

    Write-Host "`n"
    $userOption = Read-Host -Prompt "Option: "

    if($userOption -gt 0){

        $appOption = $userOption - 1

        Get-appxpackage -allusers | where-object {$_.packagefullname -like "*$($appArray[$appOption])*"} | remove-appxpackage
        Get-appxprovisionedpackage –online | where-object {$_.packagefullname –like "*$($appArray[$appOption])*"} | remove-appxprovisionedpackage –online

        $appList = Get-appxpackage -allusers | where-object {$_.packagename -like "*$($appArray[$appOption])*"}

        Write-Host "'$appList'"

        $userOption = 0
    }

}While($userOption -ne 0)


Write-Host "Exiting Script..."