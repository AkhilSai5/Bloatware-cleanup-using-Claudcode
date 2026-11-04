# UNDO SCRIPT - Reverses all the bloatware/startup/ads changes
# Run as Administrator for registry changes: PowerShell -ExecutionPolicy Bypass -File undo_changes.ps1

Write-Host "=== UNDO SCRIPT FOR BLOATWARE REMOVAL ===" -ForegroundColor Cyan

# ===== ADVERTISING & PRIVACY SETTINGS =====
Write-Host "`nRestoring advertising and privacy settings..." -ForegroundColor Yellow

# Advertising ID
Set-ItemProperty -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\AdvertisingInfo" -Name "Enabled" -Value 1 -ErrorAction SilentlyContinue

# Lock screen settings
$cdmPath = "HKCU:\Software\Microsoft\Windows\CurrentVersion\ContentDeliveryManager"
Set-ItemProperty -Path $cdmPath -Name "RotatingLockScreenEnabled" -Value 1 -ErrorAction SilentlyContinue
Set-ItemProperty -Path $cdmPath -Name "RotatingLockScreenOverlayEnabled" -Value 1 -ErrorAction SilentlyContinue
Set-ItemProperty -Path $cdmPath -Name "SubscribedContent-338387Enabled" -Value 1 -ErrorAction SilentlyContinue

# Start menu suggestions
Set-ItemProperty -Path $cdmPath -Name "SubscribedContent-338388Enabled" -Value 1 -ErrorAction SilentlyContinue
Set-ItemProperty -Path $cdmPath -Name "SubscribedContent-338389Enabled" -Value 1 -ErrorAction SilentlyContinue
Set-ItemProperty -Path $cdmPath -Name "SubscribedContent-310093Enabled" -Value 1 -ErrorAction SilentlyContinue

# Search settings
$searchPath = "HKCU:\Software\Microsoft\Windows\CurrentVersion\Search"
Set-ItemProperty -Path $searchPath -Name "BingSearchEnabled" -Value 1 -ErrorAction SilentlyContinue

# ===== STARTUP PROGRAMS =====
Write-Host "`nRestoring startup programs..." -ForegroundColor Yellow

# utweb (uTorrent Web) - restore if it exists
$utwebPath = "C:\Users\ADMIN\AppData\Roaming\uTorrent Web\utweb.exe"
if (Test-Path $utwebPath) {
    Set-ItemProperty -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\Run" -Name "utweb" -Value """$utwebPath"" /MINIMIZED" -ErrorAction SilentlyContinue
}

# Chrome auto-launch - re-enable
Set-ItemProperty -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\Run" -Name "GoogleChromeAutoLaunch_E4340140938E2EEDEA5F946244E09BA3" -Value """C:\Program Files\Google\Chrome\Application\chrome.exe"" --no-startup-window /prefetch:5" -ErrorAction SilentlyContinue

# Teams auto-launch - re-enable
Set-ItemProperty -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\Run" -Name "Teams" -Value """C:\Users\ADMIN\AppData\Local\Microsoft\WindowsApps\MSTeams_8wekyb3d8bbwe\ms-teams.exe"" msteams:system-initiated" -ErrorAction SilentlyContinue

# ===== EDGE AUTO-LAUNCH ENTRIES =====
# These 4 entries were identified
$edgePaths = @(
    "MicrosoftEdgeAutoLaunch_8E32580D4032BD4E45D3D85AB6E09F85",
    "MicrosoftEdgeAutoLaunch_1FC6D83648A4D8A788E84FF6E7A7FE94",
    "MicrosoftEdgeAutoLaunch_8B7E9DFBC50C6B22E93B73054C36964C",
    "MicrosoftEdgeAutoLaunch_563C189C3573491F32CCE8CBABEF2D85"
)

foreach ($entry in $edgePaths) {
    Set-ItemProperty -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\Run" -Name $entry -Value """C:\Program Files (x86)\Microsoft\Edge\Application\msedge.exe"" --win-session-start" -ErrorAction SilentlyContinue
}

# ===== INSTALLED APPS RESTORE NOTES =====
Write-Host "`n=== APP REMOVAL RESTORATION NOTES ===" -ForegroundColor Yellow
Write-Host "The following apps were removed from startup/disabled:" -ForegroundColor White
Write-Host "1. uTorrent Web - To restore: Run uTorrent Web installer from original source" -ForegroundColor White
Write-Host "2. Microsoft bloatware apps - To restore: Reinstall from Microsoft Store if needed" -ForegroundColor White
Write-Host "3. Teams - Already restored to startup above" -ForegroundColor White

# ===== FINAL MESSAGE =====
Write-Host "`n=== RESTORE COMPLETE ===" -ForegroundColor Green
Write-Host "Changes have been reverted. You may need to:" -ForegroundColor White
Write-Host "1. Restart for all settings to take effect" -ForegroundColor White
Write-Host "2. Reinstall any uninstalled apps from original sources" -ForegroundColor White
Write-Host "3. Check Settings > Privacy & security for advertising preferences" -ForegroundColor White
# ===== SPEED OPTIMIZATIONS RESTORATION =====
Write-Host "
Restoring speed optimization settings..." -ForegroundColor Yellow

# Re-enable visual effects (transparency, animations)
Set-ItemProperty -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\Themes\Personalize" -Name "EnableTransparency" -Value 1 -ErrorAction SilentlyContinue
Set-ItemProperty -Path "HKCU:\Control Panel\Desktop\WindowMetrics" -Name "MinAnimate" -Value "1" -ErrorAction SilentlyContinue
Set-ItemProperty -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" -Name "TaskbarAnimations" -Value 1 -ErrorAction SilentlyContinue
Set-ItemProperty -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" -Name "ListviewAlphaSelect" -Value 1 -ErrorAction SilentlyContinue
Set-ItemProperty -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" -Name "ListviewShadow" -Value 1 -ErrorAction SilentlyContinue
Set-ItemProperty -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\VisualEffects" -Name "VisualFXSetting" -Value 0 -ErrorAction SilentlyContinue

# Re-enable background apps
Set-ItemProperty -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\BackgroundAccessApplications" -Name "GlobalUserDisabled" -Value 0 -ErrorAction SilentlyContinue

# Re-enable services
Set-Service Spooler -StartupType Automatic -ErrorAction SilentlyContinue
Start-Service Spooler -ErrorAction SilentlyContinue

Set-Service bthserv -StartupType Manual -ErrorAction SilentlyContinue

Set-Service DiagTrack -StartupType Automatic -ErrorAction SilentlyContinue
Start-Service DiagTrack -ErrorAction SilentlyContinue

Set-Service SysMain -StartupType Automatic -ErrorAction SilentlyContinue
Start-Service SysMain -ErrorAction SilentlyContinue

# Restore Balanced power plan
powercfg /setactive 381b4222-f694-41f0-9685-ff5bb260df2e

Write-Host "Speed optimizations reverted." -ForegroundColor Green
