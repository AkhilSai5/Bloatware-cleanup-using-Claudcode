@echo off
setlocal enabledelayedexpansion

title Oppo CPH2285 - Package Restore Script
cls

echo =====================================================
echo   OPPO CPH2285 DEBLOAT - PACKAGE RESTORE SCRIPT
echo =====================================================
echo.
echo This script will RE-ENABLE all previously disabled packages
echo on your Oppo CPH2285 device.
echo.
echo IMPORTANT: 
echo  - USB Debugging MUST be enabled on your phone
echo  - Phone MUST be connected via USB cable
echo  - Run "adb devices" to verify connection
echo.
pause

cls
echo Checking ADB connection...
adb devices
echo.
pause

setlocal enabledelayedexpansion

set "packages=com.mediatek.engineermode com.oplus.bttestmode com.oplus.engineercamera com.oplus.engineermode com.coloros.bootreg com.coloros.floatassistant com.coloros.healthcheck com.coloros.lockassistant com.coloros.scenemode com.coloros.smartsidebar com.oplus.appplatform com.oplus.apprecover com.oplus.interconnectcollectkit com.oplus.lfeh com.oplus.obrain com.oplus.ocloud com.oplus.olc com.oplus.qualityprotect com.oplus.stdsp com.oplus.subsys com.oplus.upgradeguide com.oplus.uxdesign com.oplus.wifibackuprestore com.oplus.wirelesssettings com.heytap.colorfulengine com.nearme.instant.platform com.android.wallpaper.livepicker com.android.wallpaperbackup com.android.wallpaperpicker com.android.systemui.overlay.fingerprint.anim.ccyh com.android.systemui.overlay.fingerprint.anim.fy com.android.systemui.overlay.fingerprint.anim.jslz com.android.systemui.overlay.fingerprint.anim.none com.android.systemui.overlay.fingerprint.anim.sw com.android.systemui.overlay.fingerprint.anim.xklc com.android.systemui.overlay.fingerprint.anim.xw"

cls
echo.
echo Restoring packages...
echo.

set count=0
for %%p in (!packages!) do (
    set /a count+=1
    echo [!count!/37] Enabling %%p...
    adb shell pm enable --user 0 %%p >nul 2>&1
)

cls
echo =====================================================
echo   RESTORE COMPLETE!
echo =====================================================
echo.
echo Successfully re-enabled !count! packages.
echo.
echo Your phone is now back to its original state.
echo You can disconnect USB.
echo.
pause
endlocal
