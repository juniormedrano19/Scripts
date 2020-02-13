$AlertMsg = {
  Add-Type -AssemblyName PresentationCore,PresentationFramework
  $ButtonType = [System.Windows.MessageBoxButton]::YesNo
  $MessageIcon = [System.Windows.MessageBoxImage]::Asterisk
  $MessageBody = "Estimado colaborador te invitamos a participar  de la convocatoria interna"
  $MessageTitle = "Convocatoria Interna - Oncosalud"
   
  $Result = [System.Windows.MessageBox]::Show($MessageBody,$MessageTitle,$ButtonType,$MessageIcon)

  switch($Result) {
    "Yes" {
      $ie=new-object -com internetexplorer.application
      $ie.navigate2("https://goo.gl/forms/DPXJJWynvT5lKxAK2")
      $ie.visible=$true
    }
  }
}


