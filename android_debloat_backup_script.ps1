<#
Android Debloat Backup & Restore Script
For Xiaomi Mi A2 (jasmine_sprout) - Backup created on 2026-10-28
#>

$ADB_PATH = "adb"
$DEVICE_ID = "4b726b1"
$BACKUP_DATE = "2026-10-28"
$BACKUP_DIR = ".\mi_a2_backup_$BACKUP_DATE"

function Show-Section {
    param([string]$Title)
    Write-Host ""
    Write-Host "=== $Title ==="
}

function Invoke-ADB {
    param([string]$Command)
    # Split the command string into separate args so adb sees them individually.
    $cmdArgs = $Command -split ' '
    & $ADB_PATH -s $DEVICE_ID @cmdArgs
}

function Backup-PackageList {
    Show-Section "Backing up package list"

    # Get all packages
    $packages = Invoke-ADB "shell pm list packages -f" | ForEach-Object { $_.Trim() }
    $packages | Out-File -FilePath "$BACKUP_DIR\all_packages.txt" -Encoding UTF8

    # Get package details
    $packageDetails = @()
    foreach ($pkg in $packages) {
        if ($pkg -and $pkg.StartsWith("package:")) {
            $pkgName = $pkg.Substring(8)
            try {
                $pkgPath = Invoke-ADB "shell pm path $pkgName" | Select-Object -First 1
                if ($pkgPath) {
                    $packageDetails += "$pkgName | $($pkgPath.Trim())"
                }
            } catch {
                $packageDetails += "$pkgName | ERROR: Could not retrieve path"
            }
        }
    }
    $packageDetails | Out-File -FilePath "$BACKUP_DIR\package_details.txt" -Encoding UTF8

    Write-Host "Package list backed up to $BACKUP_DIR\all_packages.txt"
}

function Backup-SystemApps {
    Show-Section "Backing up system apps list"

    Invoke-ADB "shell pm list packages -s" | Out-File -FilePath "$BACKUP_DIR\system_apps.txt" -Encoding UTF8
    Invoke-ADB "shell pm list packages -3" | Out-File -FilePath "$BACKUP_DIR\third_party_apps.txt" -Encoding UTF8
    Invoke-ADB "shell pm list packages -e" | Out-File -FilePath "$BACKUP_DIR\enabled_apps.txt" -Encoding UTF8
    Invoke-ADB "shell pm list packages -d" | Out-File -FilePath "$BACKUP_DIR\disabled_apps.txt" -Encoding UTF8

    Write-Host "System apps categorized and backed up"
}

function Backup-APKFiles {
    Show-Section "Backing up critical APK files"

    $apkDir = "$BACKUP_DIR\apk_backup"
    New-Item -ItemType Directory -Path $apkDir -Force | Out-Null

    $criticalPackages = @(
        "com.android.systemui",
        "com.android.settings",
        "com.android.phone",
        "com.android.dialer",
        "com.android.contacts",
        "com.android.providers.telephony",
        "com.android.mms"
    )

    foreach ($pkg in $criticalPackages) {
        $apkPath = Invoke-ADB "shell pm path $pkg" | Where-Object { $_ -match "package:(.*)" } | ForEach-Object { $matches[1].Trim() } | Select-Object -First 1
        if ($apkPath) {
            $fileName = "$pkg.apk"
            $localPath = "$apkDir\$fileName"
            Write-Host "Backing up: $pkg"
            Invoke-ADB "pull $apkPath $localPath" | Out-Null
        }
    }

    Write-Host "Critical APKs backed up to $apkDir"
}

function Backup-DeviceInfo {
    Show-Section "Backing up device information"

    $model = (Invoke-ADB "shell getprop ro.product.model" 2>$null).Trim()
    $name = (Invoke-ADB "shell getprop ro.product.name" 2>$null).Trim()
    $manuf = (Invoke-ADB "shell getprop ro.product.manufacturer" 2>$null).Trim()
    $version = (Invoke-ADB "shell getprop ro.build.version.release" 2>$null).Trim()
    $buildId = (Invoke-ADB "shell getprop ro.build.display.id" 2>$null).Trim()
    $fingerprint = (Invoke-ADB "shell getprop ro.build.fingerprint" 2>$null).Trim()

    $deviceInfo = "Device ID: $DEVICE_ID`n" +
                  "Backup Date: $BACKUP_DATE`n" +
                  "Device Model: $model`n" +
                  "Device Name: $name`n" +
                  "Manufacturer: $manuf`n" +
                  "Android Version: $version`n" +
                  "Build ID: $buildId`n" +
                  "Build Fingerprint: $fingerprint"

    $deviceInfo | Out-File -FilePath "$BACKUP_DIR\device_info.txt" -Encoding UTF8

    Write-Host "Device information backed up"
}

function Create-RestoreScript {
    Show-Section "Creating restore script"

    $restoreScriptPath = "$BACKUP_DIR\restore.ps1"
    $restoreContent = @'
# Mi A2 Debloat Restore Script
# Run this to restore any disabled or uninstalled packages

$ADB_PATH = "adb"
$DEVICE_ID = "4b726b1"
$BACKUP_DIR = ".\mi_a2_backup_2026-10-28"

function Invoke-ADB {
    param([string]$Command)
    $cmdArgs = $Command -split ' '
    & $ADB_PATH -s $DEVICE_ID @cmdArgs
}

function Restore-DisabledPackages {
    Write-Host "Restoring disabled packages..."

    if (Test-Path "$BACKUP_DIR\disabled_apps.txt") {
        $disabledPackages = Get-Content "$BACKUP_DIR\disabled_apps.txt" |
            Where-Object { $_ -match "^package:(.+)$" } |
            ForEach-Object { $matches[1].Trim() }

        foreach ($pkg in $disabledPackages) {
            Write-Host "  Enabling: $pkg"
            Invoke-ADB "shell pm enable --user 0 $pkg"
        }
        Write-Host "Done."
    } else {
        Write-Host "No disabled_apps.txt found in $BACKUP_DIR"
    }
}

function Restore-UninstalledPackages {
    Write-Host ""
    Write-Host "To restore uninstalled packages, you will need to:"
    Write-Host "1. Check $BACKUP_DIR\package_details.txt for APK paths"
    Write-Host "2. Use: adb install <apk_path>"
    Write-Host "3. Or re-enable system packages with: adb shell cmd package install-existing <package_name>"
}

Write-Host "=== Mi A2 Restore Options ==="
Write-Host "1. Restore disabled packages"
Write-Host "2. View backup information"
Write-Host "3. Exit"

$choice = Read-Host "Select option (1-3)"

switch ($choice) {
    "1" { Restore-DisabledPackages }
    "2" {
        if (Test-Path "$BACKUP_DIR\device_info.txt") {
            Get-Content "$BACKUP_DIR\device_info.txt"
        }
        if (Test-Path "$BACKUP_DIR\all_packages.txt") {
            Write-Host ""
            Write-Host "Total packages backed up: $(@(Get-Content "$BACKUP_DIR\all_packages.txt").Count)"
        }
    }
    "3" { exit }
    default { Write-Host "Invalid option" }
}
'@

    $restoreContent | Out-File -FilePath $restoreScriptPath -Encoding UTF8
    Write-Host "Restore script created: $restoreScriptPath"
}

# Main execution
Write-Host "=== Mi A2 Debloat Backup Utility ==="
Write-Host "Backup directory: $BACKUP_DIR"

New-Item -ItemType Directory -Path $BACKUP_DIR -Force | Out-Null

try {
    Backup-DeviceInfo
    Backup-PackageList
    Backup-SystemApps
    Backup-APKFiles
    Create-RestoreScript

    Write-Host ""
    Write-Host "=== Backup Complete ==="
    Write-Host "All backup files saved to: $BACKUP_DIR"
    Write-Host ""
    Write-Host "Next steps:"
    Write-Host "1. Review package analysis before making changes"
    Write-Host "2. Use the restore script ($BACKUP_DIR\restore.ps1) if needed"
    Write-Host "3. Never disable critical system packages without research"

} catch {
    Write-Host "Error during backup: $_"
    exit 1
}
