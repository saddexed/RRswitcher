$ErrorActionPreference = "Stop"
$notificationTitle = "Refresh Rate set from $($args[0])Hz -> $($args[1])Hz"
[Windows.UI.Notifications.ToastNotificationManager, Windows.UI.Notifications, ContentType = WindowsRuntime] > $null
$template = [Windows.UI.Notifications.ToastNotificationManager]::GetTemplateContent([Windows.UI.Notifications.ToastTemplateType]::ToastText01)
$toastXml = [xml] $template.GetXml()
$toastXml.GetElementsByTagName("text").AppendChild($toastXml.CreateTextNode($notificationTitle)) > $null
$xml = New-Object Windows.Data.Xml.Dom.XmlDocument
$xml.LoadXml($toastXml.OuterXml)
$toast = [Windows.UI.Notifications.ToastNotification]::new($xml)
$toast.Tag = "RRChange"
$toast.Group = "Test2"
$toast.ExpirationTime = [DateTimeOffset]::Now.AddSeconds(0)
$notifier = [Windows.UI.Notifications.ToastNotificationManager]::CreateToastNotifier("Refresh Rate Changed")
$notifier.Show($toast);