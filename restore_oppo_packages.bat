@echo off
title Oppo CPH2285 Package Restore Script
echo =====================================================
echo   OPPO CPH2285 - PACKAGE RESTORE SCRIPT
echo =====================================================
echo.
echo This script will re-enable all previously disabled bloatware
echo and system packages on your Oppo device.
echo.
echo Make sure USB Debugging is enabled and phone is connected.
echo.
pause

echo.
echo Checking ADB connection...
adb devices
echo.

echo Restoring packages...
echo.

set packages=^
 com.heytap.market^
 com.heytap.cloud^
 com.heytap.mcs^
 com.heytap.accessory^
 com.coloros.assistantscreen^
 com.coloros.operationManual^
 com.coloros.compass2^
 com.coloros.karaoke^
 com.coloros.musiclink^
 com.coloros.video^
 com.coloros.weather2^
 com.coloros.oshare^
 com.coloros.securepay^
 com.oppo.quicksearchbox^
 com.oplus.themestore^
 com.oplus.vip^
 com.oplus.sos^
 com.oplus.pay^
 com.oplus.linker^
 com.oplus.omoji^
 com.oplus.portrait^
 com.oplus.synergy^
 com.oplus.onet^
 com.oplus.statistics.rom^
 com.oplus.crashbox^
 com.oplus.postmanservice^
 com.oplus.onetrace^
 com.daemon.shelper^
 com.google.android.feedback^
 com.google.mainline.telemetry^
 com.coloros.activation^
 com.coloros.operationtips

for %%p in (%packages%) do (
    echo Enabling %%p...
    adb shell pm enable --user 0 %%p
)

echo.
echo =====================================================
echo   RESTORE COMPLETE!
echo =====================================================
echo All packages have been re-enabled.
pause
