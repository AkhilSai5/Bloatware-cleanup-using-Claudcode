<#
Package Analysis Script for Mi A2 Debloat
Analyzes installed packages and categorizes them for safe debloating
#>

$BACKUP_DIR = ".\mi_a2_backup_2026-10-28"
$ADB_PATH = "adb"
$DEVICE_ID = "4b726b1"

function Invoke-ADB {
    param([string]$Command)
    $cmdArgs = $Command -split ' '
    & $ADB_PATH -s $DEVICE_ID @cmdArgs
}

Write-Host "=== Mi A2 Package Analysis ===" -ForegroundColor Cyan
Write-Host ""

# Parse package files
$allPackagesRaw = Get-Content "$BACKUP_DIR\all_packages.txt"
$disabledRaw = Get-Content "$BACKUP_DIR\disabled_apps.txt"
$thirdPartyRaw = Get-Content "$BACKUP_DIR\third_party_apps.txt"

# Extract package names
$allPackages = @()
foreach ($line in $allPackagesRaw) {
    # The APK path can contain an equals sign (for example, split APK paths).
    # Capture only the package name after the final equals sign.
    if ($line -match "=([^=]+)$") {
        $allPackages += $matches[1].Trim()
    }
}

$disabledPackages = @()
foreach ($line in $disabledRaw) {
    if ($line -match "package:(.+)$") {
        $disabledPackages += $matches[1].Trim()
    }
}

$thirdPartyPackages = @()
foreach ($line in $thirdPartyRaw) {
    if ($line -match "package:(.+)$") {
        $thirdPartyPackages += $matches[1].Trim()
    }
}

$enabledPackages = $allPackages | Where-Object { $disabledPackages -notcontains $_ }
$enabledSystemPackages = $enabledPackages | Where-Object { $thirdPartyPackages -notcontains $_ }

Write-Host "Package Statistics:" -ForegroundColor Yellow
Write-Host "  Total packages: $($allPackages.Count)"
Write-Host "  Enabled: $($enabledPackages.Count)"
Write-Host "  Disabled: $($disabledPackages.Count)"
Write-Host "  Third-party: $($thirdPartyPackages.Count)"
Write-Host "  System packages (enabled): $($enabledSystemPackages.Count)"
Write-Host ""

# Known safe-to-disable bloatware for Xiaomi Mi A2 (Android One device)
# This is based on community debloat lists and Android One specifics
$knownBloatware = @{
    # Google apps that can be safely disabled (personal preference)
    "com.google.android.apps.magazines" = "Google News - Safe to disable if you don't read news"
    "com.google.android.apps.tachyon" = "Google Duo - Safe to disable if you don't video call"
    "com.google.android.music" = "Google Play Music (discontinued) - Safe to disable"
    "com.google.android.videos" = "Google Play Movies - Safe to disable if you don't rent movies"
    "com.google.android.apps.turbo" = "Device Health Services - Battery stats, safe to disable"
    "com.google.android.apps.wellbeing" = "Digital Wellbeing - Safe to disable, just loses usage stats"
    "com.google.android.feedback" = "Google Feedback - Safe to disable, sends crash reports"
    "com.google.android.partnersetup" = "Partner Setup - Safe to disable after initial setup"
    "com.google.android.marvin.talkback" = "TalkBack - Accessibility service, disable if not needed"
    "com.google.android.projection.gearhead" = "Android Auto - Safe to disable if you don't use it"
    "com.google.android.tts" = "Google TTS - Safe to disable if you don't use text-to-speech"
    "com.google.android.keep" = "Google Keep - Safe to disable if you don't use it"
    "com.google.android.printservice.recommendation" = "Print Service - Safe to disable if you don't print"

    # Xiaomi/Android One bloat
    "com.miui.bugreport" = "Mi Bug Report - Safe to disable"
    "com.miui.spock" = "Mi UI Component - Safe to disable"
    "android.autoinstalls.config.Xiaomi.jasmine" = "Xiaomi Auto-install config - Safe to disable"

    # Qualcomm bloatware (hardware specific, not needed for normal use)
    "com.qualcomm.qti.qms.service.telemetry" = "Qualcomm Telemetry - Safe to disable, data collection"
    "com.qualcomm.qti.qms.service.connectionsecurity" = "Qualcomm Connection Security - Safe to disable"
    "com.qualcomm.qti.workloadclassifier" = "Workload Classifier - AI learning, safe to disable"
    "com.qualcomm.qti.smq" = "Qualcomm SMQ - Safe to disable"
    "com.qualcomm.qti.qmmi" = "Qualcomm MMI Test - Factory testing, safe to disable"
    "com.qualcomm.atfwd" = "Qualcomm AT Forwarding - Safe to disable"
    "com.qualcomm.qti.confdialer" = "Conference Dialer - Safe to disable"
    "com.qualcomm.qti.poweroffalarm" = "Power Off Alarm - Safe to disable (some alarms may not work when off)"
    "com.qualcomm.qti.networksetting" = "Network Setting - Can disable if you don't need advanced network settings"

    # Test/debug apps (factory testing)
    "com.longcheertel.midtest" = "Factory Test App - Safe to disable"
    "com.longcheertel.AutoTest" = "Auto Test - Factory testing, safe to disable"
    "com.longcheertel.cit" = "CIT Test - Factory testing, safe to disable"
    "com.longcheertel.modemlog" = "Modem Logger - Debug tool, safe to disable"
    "com.goodix.gftest" = "Goodix Fingerprint Test - Factory test, safe to disable"
    "com.fingerprints.sensortesttool" = "Fingerprint Sensor Test - Factory test, safe to disable"

    # Android system apps that can be disabled
    "com.android.egg" = "Android Easter Egg - Safe to disable, just a game"
    "com.android.protips" = "Pro Tips - Home screen tips, safe to disable"
    "com.android.dreams.basic" = "Screensaver - Safe to disable if you don't use screensaver"
    "com.android.dreams.phototable" = "Photo Screensaver - Safe to disable"
    "com.android.bips" = "Default Print Service - Safe to disable if you don't print"
    "com.android.printspooler" = "Print Spooler - Safe to disable if you don't print"
    "com.android.wallpaper.livepicker" = "Live Wallpaper Picker - Safe to disable if you don't use live wallpapers"
    "com.android.bookmarkprovider" = "Bookmark Provider - Safe to disable"
    "com.android.providers.partnerbookmarks" = "Partner Bookmarks - Safe to disable"
    "com.android.traceur" = "System Tracing - Developer tool, safe to disable"
    "com.android.apppredictionservice" = "App Prediction - Safe to disable, just loses suggestions"
    "com.android.carrierdefaultapp" = "Carrier Default App - Safe to disable"
    "com.android.calllogbackup" = "Call Log Backup - Safe to disable"
    "com.android.bluetoothmidiservice" = "Bluetooth MIDI - Safe to disable if you don't use MIDI devices"

    # Other
    "com.dsi.ant.server" = "ANT Radio Service - Fitness device protocol, safe to disable if not using ANT devices"
    "com.google.ar.lens" = "Google Lens AR - Safe to disable if you don't use AR features"
    "com.google.android.apps.work.oobconfig" = "Work OOB Config - Enterprise setup, safe to disable"
    "com.google.android.gmsintegration" = "GMS Integration - Safe to disable"
}

# Critical packages that should NEVER be disabled
$criticalPackages = @(
    "com.android.systemui",
    "com.android.settings",
    "com.android.phone",
    "com.android.providers.contacts",
    "com.android.providers.telephony",
    "com.android.providers.media",
    "com.android.providers.settings",
    "com.android.server.telecom",
    "com.android.launcher3",
    "com.android.camera",
    "com.google.android.gms",
    "com.google.android.gsf",
    "com.google.android.packageinstaller",
    "com.google.android.permissioncontroller"
)

# Analyze disabled packages
Write-Host "=== Currently Disabled Packages Analysis ===" -ForegroundColor Cyan
Write-Host ""

$disabledBloatware = @()
$disabledThirdParty = @()
$disabledCritical = @()
$disabledUnknown = @()

foreach ($pkg in $disabledPackages) {
    if ($knownBloatware.ContainsKey($pkg)) {
        $disabledBloatware += $pkg
    } elseif ($thirdPartyPackages -contains $pkg) {
        $disabledThirdParty += $pkg
    } elseif ($criticalPackages -contains $pkg) {
        $disabledCritical += $pkg
    } else {
        $disabledUnknown += $pkg
    }
}

Write-Host "Disabled Bloatware ($($disabledBloatware.Count)):" -ForegroundColor Green
foreach ($pkg in $disabledBloatware) {
    Write-Host "  ✓ $pkg - $($knownBloatware[$pkg])"
}

Write-Host ""
Write-Host "Disabled Third-Party Apps ($($disabledThirdParty.Count)):" -ForegroundColor Yellow
foreach ($pkg in $disabledThirdParty) {
    Write-Host "  ⚠ $pkg"
}

if ($disabledCritical.Count -gt 0) {
    Write-Host ""
    Write-Host "WARNING - Disabled Critical Packages ($($disabledCritical.Count)):" -ForegroundColor Red
    foreach ($pkg in $disabledCritical) {
        Write-Host "  ⛔ $pkg - SHOULD BE RE-ENABLED!" -ForegroundColor Red
    }
}

Write-Host ""
Write-Host "Disabled Unknown Packages ($($disabledUnknown.Count)):" -ForegroundColor Gray
foreach ($pkg in $disabledUnknown) {
    Write-Host "  ? $pkg"
}

# Analyze enabled packages for potential debloating
Write-Host ""
Write-Host "=== Potential Bloatware Still Enabled ===" -ForegroundColor Cyan
Write-Host ""

$potentialBloatware = @()
foreach ($pkg in $enabledSystemPackages) {
    if ($knownBloatware.ContainsKey($pkg)) {
        $potentialBloatware += $pkg
    }
}

Write-Host "Found $($potentialBloatware.Count) bloatware packages that can be safely disabled:" -ForegroundColor Green
foreach ($pkg in $potentialBloatware) {
    Write-Host "  • $pkg"
    Write-Host "    $($knownBloatware[$pkg])" -ForegroundColor Gray
}

# Generate recommendations
Write-Host ""
Write-Host "=== Recommendations ===" -ForegroundColor Cyan
Write-Host ""

if ($disabledCritical.Count -gt 0) {
    Write-Host "⚠ CRITICAL: You have disabled some critical system packages!" -ForegroundColor Red
    Write-Host "These should be re-enabled to ensure your phone works properly:"
    foreach ($pkg in $disabledCritical) {
        Write-Host "  adb shell pm enable --user 0 $pkg" -ForegroundColor Yellow
    }
    Write-Host ""
}

if ($potentialBloatware.Count -gt 0) {
    Write-Host "✓ You can safely disable $($potentialBloatware.Count) more bloatware packages." -ForegroundColor Green
    Write-Host "Run the following commands to disable them:"
    Write-Host ""
    foreach ($pkg in $potentialBloatware) {
        Write-Host "  adb shell pm disable-user --user 0 $pkg"
    }
}

# Save detailed report
$reportPath = "$BACKUP_DIR\debloat_report.txt"
$report = @"
Mi A2 Debloat Report - Generated on 2026-10-28
================================================

SUMMARY
-------
Total Packages: $($allPackages.Count)
Enabled: $($enabledPackages.Count)
Disabled: $($disabledPackages.Count)
Third-party: $($thirdPartyPackages.Count)
System (enabled): $($enabledSystemPackages.Count)

DISABLED PACKAGES ANALYSIS
--------------------------
Bloatware (Good): $($disabledBloatware.Count)
Third-party: $($disabledThirdParty.Count)
Critical (BAD): $($disabledCritical.Count)
Unknown: $($disabledUnknown.Count)

"@

if ($disabledCritical.Count -gt 0) {
    $report += "WARNING - CRITICAL PACKAGES DISABLED:`n"
    foreach ($pkg in $disabledCritical) {
        $report += "  ⛔ $pkg`n"
    }
    $report += "`n"
}

if ($potentialBloatware.Count -gt 0) {
    $report += "POTENTIAL BLOATWARE TO DISABLE:`n"
    foreach ($pkg in $potentialBloatware) {
        $report += "  • $pkg - $($knownBloatware[$pkg])`n"
    }
}

$report | Out-File -FilePath $reportPath -Encoding UTF8
Write-Host ""
Write-Host "Detailed report saved to: $reportPath" -ForegroundColor Green
