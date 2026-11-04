# Tier 1 Debloat Script - TECNO_KJ8
# Safest batch: Cleaners, optimizers, telemetry, duplicate utilities
# Date: 2026-10-28

$device = "120533148P056211"

# Packages to remove (Tier 1 - Safest)
$tier1Packages = @(
    # Cleaner/Optimizer Bloat - All duplicate Android's built-in features
    @{pkg="com.transsion.phonemaster";      name="Phone Master - Phone optimizer/cleaner (ads)" },
    @{pkg="com.transsion.batterylab";       name="Battery Lab - Battery saver (duplicate)" },
    @{pkg="com.transsion.trancare";         name="Trancare - Device care (redundant)" },
    @{pkg="com.transsion.phonemanager";     name="Phone Manager - Another optimizer" },
    @{pkg="com.transsion.aisupportercore";  name="AI Supporter Core - Background optimizer" },
    @{pkg="com.transsion.scanningrecharger";name="Smart Scan - Cache cleaner (duplicate)" },
    @{pkg="com.transsion.spacesaversdk";    name="Space Saver SDK - Used by other cleaner apps" },

    # Telemetry/Analytics - Privacy concerns
    @{pkg="com.transsion.uxdetector";       name="UX Detector - User analytics tracking" },
    @{pkg="com.transsion.statisticalsales"; name="Statistical Sales - Usage statistics" },
    @{pkg="com.transsion.succ";             name="SUCC - Unknown background collection" },
    @{pkg="com.xui.xhide";                  name="XHide - App hiding (security concern)" },

    # Duplicate Utility Apps - Built into Android
    @{pkg="com.transsion.deskclock";        name="Desk Clock - Duplicate (use Google Clock)" },
    @{pkg="com.transsion.calculator";       name="Calculator - Duplicate (use Google Calculator)" },
    @{pkg="com.transsion.fmradio";          name="FM Radio - Rarely used, needs antenna" },

    # Promotional/Pre-installed bloat
    @{pkg="com.transsion.necessity";        name="Necessity App - Promotional app" },
    @{pkg="tech.palm.find";                 name="Palm Find - Ad/search app (preinstalled)" },
    @{pkg="tech.palm.id";                   name="Palm ID - Required by Palm Find" },

    # Redundant features
    @{pkg="com.transsion.hamal";            name="Hamal Browser - Duplicate browser" },
    @{pkg="com.transsion.magicfont";        name="Magic Font - Custom fonts (use system)" },
    @{pkg="com.transsion.multiwindow";      name="Multi-Window - Built into Android" }
)

Write-Host "========================================" -ForegroundColor Cyan
Write-Host "TIER 1 DEBLOAT - Safest Batch" -ForegroundColor Cyan
Write-Host "Device: TECNO_KJ8" -ForegroundColor Cyan
Write-Host "Packages to disable: $($tier1Packages.Count)" -ForegroundColor Cyan
Write-Host "========================================" -ForegroundColor Cyan
Write-Host ""

# Create restore script content
$restoreScript = @"
# Tier 1 Restore Script
# Run this to re-enable all disabled packages
# Generated: 2026-10-28

echo "Restoring Tier 1 packages..."
echo ""

"@

$removed = @()

foreach ($app in $tier1Packages) {
    $pkg = $app.pkg
    $name = $app.name

    Write-Host "Disabling: $pkg" -ForegroundColor Yellow
    Write-Host "  -> $name" -ForegroundColor Gray

    # Check current state
    $state = adb shell pm get-user-visible-features $pkg 2>$null
    if ($state -match "enabled") {
        # Try to disable
        $result = adb shell pm disable-user --user 0 $pkg 2>&1
        if ($LASTEXITCODE -eq 0) {
            Write-Host "  [OK] Disabled" -ForegroundColor Green
            $removed += $pkg
            $restoreScript += "adb shell pm enable --user 0 $pkg`necho 'Restored: $pkg'`n"
        } else {
            Write-Host "  [FAILED] Could not disable" -ForegroundColor Red
        }
    } else {
        Write-Host "  [SKIP] Already disabled" -ForegroundColor DarkGray
    }
}

# Save restore script
$restoreScript | Out-File -FilePath "tier1-restore.ps1" -Encoding utf8

Write-Host ""
Write-Host "========================================" -ForegroundColor Cyan
Write-Host "COMPLETED" -ForegroundColor Cyan
Write-Host "Disabled packages: $($removed.Count)" -ForegroundColor Green
Write-Host "Restore script saved: tier1-restore.ps1" -ForegroundColor Cyan
Write-Host "========================================" -ForegroundColor Cyan
Write-Host ""
Write-Host "To restore all packages, run:" -ForegroundColor Yellow
Write-Host "  .\tier1-restore.ps1" -ForegroundColor White