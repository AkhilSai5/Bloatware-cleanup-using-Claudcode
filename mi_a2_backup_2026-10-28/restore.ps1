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
