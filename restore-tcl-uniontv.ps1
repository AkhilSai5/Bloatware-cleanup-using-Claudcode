# Restore script for TCL UnionTV debloat
# Run with: .\restore-tcl-uniontv.ps1 (from PowerShell) or ./restore-tcl-uniontv.sh (from Bash)

$tv = "192.168.1.7:5555"

Write-Host "Re-enabling disabled packages on $tv..." -ForegroundColor Cyan

$packages = @(
    "com.google.android.tv.bugreportsender",
    "com.google.android.tvrecommendations",
    "com.google.android.leanbacklauncher.recommendations",
    "android.autoinstalls.config.tcl.device",
    "com.google.android.videos",
    "com.google.android.play.games",
    "com.google.android.tts",
    "com.tcl.common.terminalmanagerplus",
    "com.tcl.copydatatotv"
)

foreach ($pkg in $packages) {
    Write-Host "Enabling $pkg..." -NoNewline
    $res = adb -s $tv shell "pm enable $pkg" 2>&1
    Write-Host " Done." -ForegroundColor Green
}

Write-Host "`nAll packages re-enabled successfully." -ForegroundColor Green
Write-Host "You may want to reboot the TV now: adb -s $tv reboot" -ForegroundColor Yellow