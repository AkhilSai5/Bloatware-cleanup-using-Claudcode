# Tier 1 Active Bloatware Removal
# Only disables packages that are currently ACTIVE
# TECNO_KJ8 - 2026-10-28

$activePackages = @(
    @{pkg="com.transsion.batterylab";       name="Battery Lab - Battery optimizer (shows ads)"},
    @{pkg="com.transsion.phonemanager";     name="Phone Manager - System optimizer (duplicate)"},
    @{pkg="com.transsion.scanningrecharger";name="Smart Scan - Junk file cleaner (duplicate)"},
    @{pkg="com.transsion.statisticalsales"; name="Statistical Sales - Analytics/telemetry"},
    @{pkg="com.xui.xhide";                  name="XHide - App hiding service"},
    @{pkg="com.transsion.deskclock";        name="Desk Clock - Use Google Clock instead"},
    @{pkg="com.transsion.calculator";       name="Calculator - Use Google Calculator instead"},
    @{pkg="com.transsion.fmradio";          name="FM Radio - Rarely used"},
    @{pkg="tech.palm.find";                 name="Palm Find - Pre-installed ad/search app"},
    @{pkg="tech.palm.id";                   name="Palm ID - Associated with Palm Find"},
    @{pkg="com.transsion.multiwindow";      name="Multi-Window - Built into Android already"}
)

Write-Host "========================================" -ForegroundColor Cyan
Write-Host "TIER 1 ACTIVE BLOATWARE REMOVAL" -ForegroundColor Cyan
Write-Host "Device: TECNO_KJ8" -ForegroundColor Cyan
Write-Host "Packages to disable: $($activePackages.Count)" -ForegroundColor Cyan
Write-Host "========================================" -ForegroundColor Cyan
Write-Host ""
Write-Host "This will DISABLE (not uninstall) these packages." -ForegroundColor Yellow
Write-Host "They can be restored later using the restore script." -ForegroundColor Yellow
Write-Host ""

$restoreCommands = @()
$successCount = 0
$failCount = 0

foreach ($app in $activePackages) {
    $pkg = $app.pkg
    $name = $app.name

    Write-Host "[$($successCount + $failCount + 1)/$($activePackages.Count)] Disabling: $pkg" -ForegroundColor Cyan
    Write-Host "    Purpose: $name" -ForegroundColor Gray

    # Disable the package
    $output = adb shell pm disable-user --user 0 $pkg 2>&1

    if ($LASTEXITCODE -eq 0 -or $output -match "disabled") {
        Write-Host "    [SUCCESS] Package disabled" -ForegroundColor Green
        $successCount++
        $restoreCommands += "adb shell pm enable $pkg  # $name"
    } else {
        Write-Host "    [FAILED] $output" -ForegroundColor Red
        $failCount++
    }
    Write-Host ""
}

Write-Host "========================================" -ForegroundColor Cyan
Write-Host "REMOVAL COMPLETE" -ForegroundColor Cyan
Write-Host "========================================" -ForegroundColor Cyan
Write-Host "Successfully disabled: $successCount packages" -ForegroundColor Green
Write-Host "Failed: $failCount packages" -ForegroundColor Red
Write-Host ""

# Save restore script
$restoreScriptContent = @"
#!/bin/bash
# Tier 1 Restore Script - TECNO_KJ8
# Generated: 2026-10-28
# This script restores all packages disabled in Tier 1 removal

echo "========================================"
echo "Restoring Tier 1 Disabled Packages"
echo "========================================"
echo ""

$($restoreCommands -join "`n")

echo ""
echo "========================================"
echo "Restoration complete!"
echo "========================================"
"@

$restoreScriptContent | Out-File -FilePath "tier1-restore.sh" -Encoding utf8
Write-Host "Restore script saved: tier1-restore.sh" -ForegroundColor Cyan
Write-Host ""
Write-Host "To restore all disabled packages, run:" -ForegroundColor Yellow
Write-Host "  bash tier1-restore.sh" -ForegroundColor White
Write-Host "  or manually run each command from the file" -ForegroundColor White