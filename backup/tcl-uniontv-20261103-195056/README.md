# TCL UnionTV Debloat & Customization

**Device:** TCL UnionTV (Realtek RTD284X, Android 9)  
**Date:** 2026-11-03  
**IP:** 192.168.1.7:5555

---

## What Was Done

### Debloat
The following packages were disabled:

**Already disabled (from prior session):**
- `com.tcl.initsetup` - Initial setup
- `com.tcl.keyhelp` - Key helper
- `com.google.android.speech.pumpkin` - Offline hotword
- `com.google.android.music` - Play Music
- `com.google.android.tvlauncher` - Stock launcher
- `com.android.gallery3d` - Gallery
- `com.google.android.videos` - Play Movies & TV
- `com.google.android.leanbacklauncher.partnercustomizer` - Partner customizer
- `com.google.android.play.games` - Play Games
- `com.netflix.ninja` - Netflix

**Newly disabled (this session):**
- `com.google.android.tv.bugreportsender` - Bug reporter
- `com.google.android.tvrecommendations` - TV recommendations
- `com.google.android.leanbacklauncher.recommendations` - Recommendations row
- `android.autoinstalls.config.tcl.device` - Partner auto-installs
- `com.tcl.copydatatotv` - Phone-to-TV copy helper

**Re-enabled by firmware after reboot (TCL Android 9 protects these):**
- `com.google.android.tts` - Text-to-speech
- `com.tcl.common.terminalmanagerplus` - Device management

**Kept enabled per your preferences:**
- `com.amazon.amazonvideo.livingroom` - Prime Video ✓
- `com.google.android.youtube.tv` - YouTube ✓
- `com.google.android.apps.mediashell` - Chromecast ✓
- `com.tcl.versionUpdateApp` - Firmware updates ✓
- `com.tcl.rc.ota` - OTA updates ✓

### Launcher
- Custom launcher `com.gathin.tvhome` installed and set as default Home
- Theme applied with 5-column dock
- Dock apps: Prime Video, YouTube, Hotstar, SonyLIV, AhaFlix
- Live TV hidden from grid (available via Inputs menu)

---

## Restore

To re-enable all disabled packages, run:

```powershell
.\restore-tcl-uniontv.ps1
```

Or manually:
```powershell
$tv = "192.168.1.7:5555"
adb -s $tv shell "pm enable com.google.android.tv.bugreportsender"
adb -s $tv shell "pm enable com.google.android.tvrecommendations"
adb -s $tv shell "pm enable com.google.android.leanbacklauncher.recommendations"
adb -s $tv shell "pm enable android.autoinstalls.config.tcl.device"
adb -s $tv shell "pm enable com.tcl.copydatatotv"
```

---

## Reset Theme

To remove the custom theme and return to defaults:

```powershell
$tv = "192.168.1.7:5555"
adb -s $tv shell "rm /sdcard/Android/data/com.gathin.tvhome/files/config.json"
adb -s $tv shell "am force-stop com.gathin.tvhome"
```

---

## Change Dock Apps

Edit the theme config and push it:

```powershell
# Edit: D:\demo_claude_code\cleanyourtv\themes\tcl-uniontv-custom\config.json
$tv = "192.168.1.7:5555"
adb -s $tv push "D:\demo_claude_code\cleanyourtv\themes\tcl-uniontv-custom\config.json" "/sdcard/Android/data/com.gathin.tvhome/files/config.json"
adb -s $tv shell "am force-stop com.gathin.tvhome"
```

---

## Close ADB After Use

When finished, close network ADB for security:

```powershell
# On the TV: Settings → Device Preferences → Developer options → Network/ADB debugging → OFF
# Also revoke USB debugging authorizations in the same menu
```

---

## Notes

1. **Firmware-protected packages:** Some packages (TTS, terminal manager, bug reporter, recommendations) are re-enabled by TCL firmware at every boot. This is normal for TCL Android 9.

2. **USB debugging power issue:** Some TCL sets cut power to USB ports when debugging is enabled. If you plug in USB devices later, disable USB debugging first.

3. **Quick start (STR):** If enabled, Quick start suspends the TV to RAM and takes Ethernet down, so ADB can't wake it. Disable Quick start if you need network wake.

4. **Private DNS (optional ad blocking):** To block ads system-wide:
   ```
   adb -s 192.168.1.7:5555 shell "settings put global private_dns_specifier dns.adguard-dns.com"
   adb -s 192.168.1.7:5555 shell "settings put global private_dns_mode hostname"
   ```
   Note: This doesn't block YouTube ads. Undo with `private_dns_mode opportunistic`.
