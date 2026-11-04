#!/bin/bash
# Android Debloat Restoration Script
# TECNO_KJ8 Device
# This script reinstalls packages that were removed during debloating
# Usage: adb shell < restore-packages.sh
# Or: adb push restore-packages.sh /sdcard/ && adb shell sh /sdcard/restore-packages.sh

# Enable command output for debugging
set -x

DEVICE="120533148P056211"
PACKAGES_DIR="/system_ext/app"

echo "==================================="
echo "Android Debloat Restoration Script"
echo "Device: TECNO_KJ8"
echo "==================================="
echo ""

# NOTE: Most system packages cannot be truly "restored" via adb shell commands
# This script documents what was removed for reference
# To fully restore, you would need:
# 1. Device backup (if you made one before debloating)
# 2. Factory reset
# 3. Restored ROM/firmware

# However, you CAN reinstall user-installed apps via Google Play Store

echo "RESTORATION INSTRUCTIONS:"
echo ""
echo "1. FOR SYSTEM/OEM PACKAGES REMOVED:"
echo "   - Use ADB to re-enable packages (if disabled, not uninstalled):"
echo "   - Command: adb shell cmd package install-existing <package_name>"
echo ""
echo "2. FOR USER-INSTALLED APPS:"
echo "   - Open Google Play Store on device"
echo "   - Search for and reinstall the app"
echo ""
echo "3. FOR COMPLETE RESTORATION:"
echo "   - Factory reset the device (Settings > System > Reset > Erase all data)"
echo "   - This restores all system apps to original state"
echo ""

echo "=== RESTORING DISABLED PACKAGES ==="
echo ""

# Transsion OEM Bloatware - can be re-enabled if disabled (not uninstalled)
echo "### Transsion OEM Apps (if only disabled, not uninstalled):"
cat << 'EOF'
adb shell cmd package install-existing com.transsion.ella
adb shell cmd package install-existing com.transsion.phonemaster
adb shell cmd package install-existing com.transsion.batterylab
adb shell cmd package install-existing com.transsion.applock
adb shell cmd package install-existing com.transsion.dualapp
adb shell cmd package install-existing com.transsion.screenrecorder
adb shell cmd package install-existing com.transsion.multiwindow
adb shell cmd package install-existing com.transsion.iotservice
adb shell cmd package install-existing com.transsion.teop
adb shell cmd package install-existing com.transsion.cloudserver
adb shell cmd package install-existing com.transsion.hilauncher
adb shell cmd package install-existing com.transsion.magicfont
adb shell cmd package install-existing com.transsion.faceid
adb shell cmd package install-existing com.transsion.trancare
adb shell cmd package install-existing com.transsion.easypic
adb shell cmd package install-existing com.transsion.uxdetector
adb shell cmd package install-existing com.transsion.systemupdate
adb shell cmd package install-existing com.transsion.plat.appupdate
adb shell cmd package install-existing com.transsion.repaircard
adb shell cmd package install-existing com.transsion.guideservice
adb shell cmd package install-existing com.transsion.keyguardclock
adb shell cmd package install-existing com.transsion.keyguardtheme
adb shell cmd package install-existing com.transsion.mediapipefilters
adb shell cmd package install-existing com.transsion.microintelligence
adb shell cmd package install-existing com.transsion.necessity
adb shell cmd package install-existing com.transsion.audiosmartconnect
adb shell cmd package install-existing com.transsion.tower
adb shell cmd package install-existing com.transsion.resolver
adb shell cmd package install-existing com.transsion.deskclock
adb shell cmd package install-existing com.transsion.calculator
adb shell cmd package install-existing com.transsion.scanningrecharger
adb shell cmd package install-existing com.transsion.hamal
adb shell cmd package install-existing com.transsion.fmradio
adb shell cmd package install-existing com.transsion.camera
adb shell cmd package install-existing com.transsion.tranengine
adb shell cmd package install-existing com.transsion.statisticalsales
adb shell cmd package install-existing com.transsion.aisettings
adb shell cmd package install-existing com.transsion.mol
adb shell cmd package install-existing com.transsion.tabe
adb shell cmd package install-existing com.transsion.thunderback
adb shell cmd package install-existing com.transsion.succ
adb shell cmd package install-existing com.transsion.aisupportercore
EOF

echo ""
echo "### Google Apps (if only disabled):"
cat << 'EOF'
adb shell cmd package install-existing com.google.android.apps.maps
adb shell cmd package install-existing com.google.android.youtube
adb shell cmd package install-existing com.google.android.calendar
adb shell cmd package install-existing com.google.android.gm
adb shell cmd package install-existing com.google.android.apps.messaging
adb shell cmd package install-existing com.google.android.apps.docs
adb shell cmd package install-existing com.google.android.apps.photos
adb shell cmd package install-existing com.google.android.apps.nbu.files
adb shell cmd package install-existing com.google.android.tts
adb shell cmd package install-existing com.google.android.marvin.talkback
adb shell cmd package install-existing com.google.android.apps.wellbeing
adb shell cmd package install-existing com.google.android.apps.nbu.paisa.user
EOF

echo ""
echo "### Pre-installed User Apps:"
cat << 'EOF'
adb shell cmd package install-existing org.altruist.BajajExperia
adb shell cmd package install-existing com.dreamplug.androidapp
EOF

echo ""
echo "=== FOR USER-INSTALLED APPS FROM GOOGLE PLAY STORE ==="
echo ""
echo "Visit Google Play Store on your device and search for:"
cat << 'EOF'
- Paytm
- ICICI Bank
- GE Capital
- Paycards
- IndusInd Bank
- UPI
- PhonePe
- HDFC PayZapp
- HDFC Bank
- Union Bank
- Bank of Baroda
- Myntra
- Flipkart
- JioMart
- Amazon
- MagicPin
- WhatsApp
- Slack
- Truecaller
- Google Lens
EOF

echo ""
echo "=== FULL FACTORY RESET (Nuclear Option) ==="
echo ""
echo "If you want to restore EVERYTHING to original state:"
echo ""
echo "1. Via adb:"
echo "   adb shell recovery --wipe_data"
echo "   or"
echo "   adb reboot recovery  (then use recovery menu to wipe data)"
echo ""
echo "2. Via device settings:"
echo "   Settings > System > Reset options > Erase all data"
echo ""
echo "WARNING: This will erase all personal data, photos, messages, etc."
echo "Backup your data first!"
echo ""
echo "=== END OF RESTORATION SCRIPT ==="
