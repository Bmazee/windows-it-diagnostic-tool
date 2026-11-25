# Windows Tier 1 IT Diagnostic Script
# Gathers basic hardware, OS, disk space, and network connectivity details

$ReportPath = "$env:USERPROFILE\Desktop\IT_Diagnostic_Report_$(Get-Date -Format 'yyyyMMdd_HHmm').txt"

Write-Output "==========================================" | Tee-Object -FilePath $ReportPath
Write-Output "   SYSTEM DIAGNOSTIC & HEALTH REPORT      " | Tee-Object -FilePath $ReportPath -Append
Write-Output "   Generated: $(Get-Date)                 " | Tee-Object -FilePath $ReportPath -Append
Write-Output "==========================================`n" | Tee-Object -FilePath $ReportPath -Append

# 1. Computer & OS Info
$OS = Get-CimInstance Win32_OperatingSystem
$CS = Get-CimInstance Win32_ComputerSystem
Write-Output "[1] SYSTEM INFORMATION" | Tee-Object -FilePath $ReportPath -Append
Write-Output "Computer Name : $($CS.Name)" | Tee-Object -FilePath $ReportPath -Append
Write-Output "Manufacturer  : $($CS.Manufacturer) $($CS.Model)" | Tee-Object -FilePath $ReportPath -Append
Write-Output "OS Version    : $($OS.Caption) ($($OS.OSArchitecture))" | Tee-Object -FilePath $ReportPath -Append
Write-Output "Last Boot     : $($OS.LastBootUpTime)`n" | Tee-Object -FilePath $ReportPath -Append

# 2. Disk Space Check (C: Drive)
$Disk = Get-CimInstance Win32_LogicalDisk -Filter "DeviceID='C:'"
$FreeGB = [math]::Round($Disk.FreeSpace / 1GB, 2)
$TotalGB = [math]::Round($Disk.Size / 1GB, 2)
Write-Output "[2] STORAGE (C: DRIVE)" | Tee-Object -FilePath $ReportPath -Append
Write-Output "Free Space    : $FreeGB GB / $TotalGB GB`n" | Tee-Object -FilePath $ReportPath -Append

# 3. Network & Internet Connectivity
Write-Output "[3] NETWORK DIAGNOSTICS" | Tee-Object -FilePath $ReportPath -Append
$IP = (Get-NetIPAddress -AddressFamily IPv4 | Where-Object {$_.InterfaceAlias -notlike "*Loopback*"}).IPAddress -join ", "
$PingTest = Test-Connection -ComputerName 8.8.8.8 -Count 2 -Quiet
Write-Output "IPv4 Address  : $IP" | Tee-Object -FilePath $ReportPath -Append
Write-Output "Internet Ping : $(if ($PingTest) {'CONNECTED (8.8.8.8 reachable)'} else {'DISCONNECTED'})`n" | Tee-Object -FilePath $ReportPath -Append

Write-Output "Report saved to: $ReportPath"