# Get the monitor information once and reuse it
$monitor = Get-CimInstance -Namespace root/WMI -ClassName WmiMonitorBrightness
$current = $monitor.CurrentBrightness
$methodInstance = Get-CimInstance -Namespace root/WMI -Class WmiMonitorBrightnessMethods

$value = $args[0]
# 0 true 1 false
if ($value) {
    $target = $current - 10
    if ($target -lt 0) {
        $target = 0
    }
} else {
    $target = $current + 10
    if ($target -gt 100) {
        $target = 100
    }
}

Write-Output "Current Brightness: $($current) Target Brightness: $($target)"
# Use the cached instance
Invoke-CimMethod -InputObject $methodInstance -MethodName WmiSetBrightness -Arguments @{Brightness = $target; Timeout = 0} | Out-Null
