#!/bin/bash
# Tier 1 Restore Script - TECNO_KJ8
# Generated: 2026-10-28
# This script restores all packages disabled in Tier 1 removal

echo "========================================"
echo "Restoring Tier 1 Disabled Packages"
echo "========================================"
echo ""

adb shell pm enable com.transsion.batterylab  # Battery Lab - Battery optimizer (shows ads)
adb shell pm enable com.transsion.phonemanager  # Phone Manager - System optimizer (duplicate)
adb shell pm enable com.transsion.scanningrecharger  # Smart Scan - Junk file cleaner (duplicate)
adb shell pm enable com.transsion.statisticalsales  # Statistical Sales - Analytics/telemetry
adb shell pm enable com.xui.xhide  # XHide - App hiding service
adb shell pm enable com.transsion.deskclock  # Desk Clock - Use Google Clock instead
adb shell pm enable com.transsion.calculator  # Calculator - Use Google Calculator instead
adb shell pm enable com.transsion.fmradio  # FM Radio - Rarely used
adb shell pm enable com.transsion.multiwindow  # Multi-Window - Built into Android already

echo ""
echo "========================================"
echo "Restoration complete!"
echo "========================================"
