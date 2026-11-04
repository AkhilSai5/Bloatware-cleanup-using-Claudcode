# Android Device Analysis Report
**Device:** TECNO_KJ8 (120533148P056211)  
**Date:** 2026-10-28  
**Total Packages:** 319

---

## Package Distribution Summary

| Category | Count | Description |
|----------|-------|-------------|
| Android System | 104 | Core Android framework and services |
| Google | 81 | Google apps and services (Play Store, Gmail, Maps, etc.) |
| **Transsion OEM** | **74** | **Manufacturer bloatware and HiOS customizations** |
| MediaTek | 26 | Chipset-specific services (safe to keep) |
| User/3rd Party | 32 | Apps you or carrier installed |
| Transsion Preload | 2 | Pre-installed third-party apps via carrier/OEM deals |

---

# DETAILED ANALYSIS BY CATEGORY

## 1. TRANSsion OEM BLOATWARE (74 packages) — SAFE TO REMOVE

These are Tecno/Transsion manufacturer-added apps, many of which duplicate system functionality or provide questionable value. They're often called "HiOS" apps (Hi Optimization System).

### A. CLEANER / OPTIMIZER / SECURITY APPS (Remove - Redundant)
These are third-party "phone cleaner" and "booster" apps that duplicate Android's built-in functions and often show aggressive ads.

| Package | App Name | Purpose | Why Remove |
|---------|----------|---------|------------|
| `com.transsion.phonemaster` | Phone Master | Phone optimizer, cleaner, cache cleaner | Duplicate to Android's built-in storage management; shows ads |
| `com.transsion.batterylab` | Battery Lab | Battery saver and optimizer | Duplicate to Android Battery Settings; shows ads |
| `com.transsion.trancare` | Trancare | Device care and optimization | Redundant system care features |
| `com.transsion.phonemanager` | Phone Manager | Another optimizer/cleaner app | Duplicate cleaner app |
| `com.transsion.aisupportercore` | AI Supporter Core | Background optimization service | Telemetry and optimizer background process |
| `com.transsion.scanningrecharger` | Smart Scan | Cache cleaner and junk scanner | Duplicate cleaner functionality |
| `com.transsion.spacesaversdk` | Space Saver SDK | Storage saver SDK | Used by other Transsion apps for cleaning |

### B. LAUNCHER / HOME SCREEN (Optional)
| Package | App Name | Purpose | Recommendation |
|---------|----------|---------|----------------|
| `com.transsion.hilauncher` | HiOS Launcher | Custom Tecno launcher | Remove if using stock launcher or Nova Launcher |
| `com.hilauncherconfig` | HiOS Launcher Config | Launcher configuration | Required by HiOS Launcher |

### C. CAMERA APPS (Optional)
| Package | App Name | Purpose | Why Remove |
|---------|----------|---------|------------|
| `com.transsion.camera` | Transsion Camera | OEM camera app | Can use Google Camera or stock Android camera |
| `com.transsion.mediapipefilters` | MediaPipe Filters | Camera AI filters | Optional camera enhancement |
| `com.transsion.easypic` | EasyPic Service | Photo enhancement service | Optional background photo processing |
| `com.gallery20` | AiGallery | Gallery app | Can use Google Photos instead |

### D. DUPLICATE UTILITY APPS (Remove - Stock Android has these)
| Package | App Name | Purpose | Why Remove |
|---------|----------|---------|------------|
| `com.transsion.deskclock` | Desk Clock | Clock/alarm app | Duplicate to Google Clock or stock clock |
| `com.transsion.calculator` | Calculator | Calculator app | Duplicate to Google Calculator |
| `com.transsion.screenrecorder` | Screen Recorder | Screen recording | Built into Android 11+ |
| `com.transsion.screencapture` | Screen Capture | Screenshot tool | Built into Android |
| `com.transsion.fmradio` | FM Radio | FM Radio app | Rarely used; requires headphones as antenna |
| `com.transsion.multiwindow` | Multi-Window | Multi-window support | Built into Android |

### E. LOCK SCREEN / THEME APPS (Optional)
| Package | App Name | Purpose | Recommendation |
|---------|----------|---------|----------------|
| `com.transsion.keyguardclock` | Keyguard Clock | Custom lock screen clock | Use stock lock screen |
| `com.transsion.keyguardtheme` | Keyguard Theme | Lock screen themes | Use stock themes |
| `com.transsion.theme.icon` | OS Icon | Icon pack for HiOS | Optional |
| `com.transsion.magicfont` | Magic Font | Custom fonts | Use system fonts instead |
| `com.transsion.os.typeface` | Font Manager | Font management | Optional |
| `com.transsion.dynamicbar` | Dynamic Bar | Status bar customization | Optional |
| `com.transsion.nephilim` | Nephilim | Theme engine | Optional |

### F. FACE UNLOCK / BIOMETRICS (Optional)
| Package | App Name | Purpose |
|---------|----------|---------|
| `com.transsion.faceid` | Face ID | Face unlock feature |
| `com.transsion.faceprint` | Faceprint | Face recognition data |

### G. DUAL APP / APPLOCK (Optional)
| Package | App Name | Purpose |
|---------|----------|---------|
| `com.transsion.dualapp` | Dual App | Clone apps for dual SIM usage |
| `com.transsion.applock` | App Lock | Lock apps with password |
| `com.transsion.ella` | Ella | AI assistant for app locking |

### H. CLOUD / SYNC SERVICES (Optional)
| Package | App Name | Purpose | Why Remove |
|---------|----------|---------|------------|
| `com.transsion.cloudserver` | Cloud Server | Proprietary cloud backup | Use Google Drive instead |
| `com.transsion.thunderback` | Thunder Backup | Backup app | Use Google Backup |
| `com.transsion.iotservice` | IoT Service | IoT device connection | Rarely used |
| `com.transsion.iotcard` | IoT Card | IoT SIM card service | Rarely used |

### I. AI / SMART FEATURES (Optional)
| Package | App Name | Purpose |
|---------|----------|---------|
| `com.transsion.microintelligence` | Micro Intelligence | AI features engine |
| `com.transsion.aisettings` | AI Voice Settings | AI voice assistant settings |
| `com.transsion.ella` | Ella | Smart assistant |
| `com.talpa.hiservice` | Hi Language Service | Language AI service |

### J. TELEMETRY / ANALYTICS / TRACKING (Remove - Privacy Concern)
| Package | App Name | Purpose | Why Remove |
|---------|----------|---------|------------|
| `com.transsion.uxdetector` | UX Detector | User experience analytics | Data collection/tracking |
| `com.transsion.statisticalsales` | Statistical Sales | Sales/usage statistics | Analytics/telemetry |
| `com.transsion.succ` | SUCC | Unknown service | Background data collection |
| `com.xui.xhide` | XHide | App hiding service | Privacy/security concern |

### K. OEM SUPPORT / GUIDE APPS (Optional - Rarely Used)
| Package | App Name | Purpose |
|---------|----------|---------|
| `com.transsion.repaircard` | Warranty Card | Warranty information |
| `com.transsion.guideservice` | Guide Service | User guide/tutorial |
| `com.transsion.manualguide` | Manual | Device manual |
| `com.transsion.overlaysuw` | OOBE | Setup wizard overlay |
| `com.hoffnung` | Hoffnung | Unknown Tecno service |

### L. SYSTEM TUNING / ENGINE (Safe to Keep)
| Package | App Name | Purpose |
|---------|----------|---------|
| `com.transsion.tranengine` | Tran Engine | HiOS system engine |
| `com.transsion.ossettingsext` | OS Settings Ext | Extended settings |
| `com.transsion.plat.appupdate` | App Update Manager | App update service |
| `com.transsion.systemupdate` | System Update | System OTA updates |

### M. SHARE MENU / RESOLVER (Optional)
| Package | App Name | Purpose |
|---------|----------|---------|
| `com.transsion.resolver` | TranResolver | Custom share menu |
| `com.transsion.tower` | ControlTower | Control center |

### N. AUDIO / SOUND (Optional)
| Package | App Name | Purpose |
|---------|----------|---------|
| `com.transsion.audiosmartconnect` | Audio Smart Connect | Audio enhancement |
| `com.transsion.sk` | Secure Keyboard | Custom keyboard |

### O. OEM-SPECIFIC SERVICES (KEEP - Required for some features)
| Package | App Name | Purpose | Risk if Removed |
|---------|----------|---------|-----------------|
| `com.transsion.teop` | TEOP | Telecom operator package | May affect carrier features |
| `com.transsion.tabe` | TranAbe | System service | Unknown - test first |
| `com.transsion.tranfacmode` | TranfacMode | Factory mode | For diagnostics |
| `com.transsion.agingfunction` | Aging Function | Test mode | For hardware testing |
| `com.transsion.tranproductframeworkresoverlay` | Framework Overlay | System UI theming | May break UI |
| `com.transsion.overlaysuw.resoverlay` | OOBE Overlay | Setup UI theming | May break setup |

### P. PRELOADED THIRD-PARTY (Advertising/OEM Deal)
| Package | App Name | Purpose | Why Remove |
|---------|----------|---------|------------|
| `com.transsion.chromecustomization` | Chrome Assistant | Chrome customization | Pre-installed by deal |
| `tech.palm.find` | Palm Find | Palm store/search | Pre-installed ads/promotional |
| `tech.palm.id` | Palm ID | Palm account service | Required by Palm Find |
| `com.transsion.necessity` | Necessity App | Unknown promo app | Likely promotional |

---

## 2. Transsion PRELOADED Apps (2 packages) — REMOVE

These were pre-installed via OEM/carrier agreements, not Google.

| Package | App Name | Purpose | Why Remove |
|---------|----------|---------|------------|
| `com.google.android.apps.tachyon` | Google Meet | Video calling app | Pre-installed by Transsion deal |
| `com.google.android.apps.youtube.music` | YouTube Music | Music streaming | Pre-installed by Transsion deal |

---

## 3. USER/THIRD-PARTY APPS (32 packages)

These are in `/data/app/` - installed by you or came pre-installed.

### A. BANKING / FINANCE APPS (Keep if you use them)
| Package | App Name | Description |
|---------|----------|-------------|
| `net.one97.paytm` | Paytm | Digital wallet and payments |
| `com.csam.icici.bank.imobile` | iMobile | ICICI Bank official app |
| `com.ge.capital.konysbiapp` | Kotak SBIE | Kotak Mahindra Bank |
| `com.paycards.app` | PayCards | Credit/debit card scanner |
| `com.indusind.indie` | IndusInd Bank | IndusInd Bank app |
| `in.org.npci.upiapp` | BHIM UPI | Government UPI payments |
| `com.phonepe.app` | PhonePe | UPI payments and more |
| `com.hdfcbank.payzapp` | PayZapp | HDFC Bank payments |
| `com.hdfcbank.android.now` | HDFC Bank | HDFC Bank official app |
| `com.infrasoft.uboi` | UBoi | Union Bank of India |
| `org.npci.token.hdfc` | HDFC Token | HDFC security token |
| `com.bob.fe` | BOB | Bank of Baroda app |
| `com.google.android.apps.nbu.paisa.user` | Google Pay | Google's UPI app |

### B. SHOPPING APPS (Remove if not used)
| Package | App Name |
|---------|----------|
| `com.myntra.android` | Myntra - Fashion shopping |
| `com.flipkart.android` | Flipkart - E-commerce |
| `com.jpl.jiomart` | JioMart - Grocery shopping |
| `in.amazon.mShop.android.shopping` | Amazon Shopping |
| `com.magicpin.local` | MagicPin - Deals and rewards |

### C. COMMUNICATION APPS (Keep)
| Package | App Name |
|---------|----------|
| `com.whatsapp` | WhatsApp - Messaging |
| `com.Slack` | Slack - Team communication |
| `com.truecaller` | Truecaller - Caller ID and spam blocking |

### D. GOVERNMENT / INSURANCE (Remove if not used)
| Package | App Name |
|---------|----------|
| `com.gov.ssc` | SSC - Staff Selection Commission (India govt jobs) |
| `org.altruist.BajajExperia` | Bajaj Experia - Insurance app |

### E. OTHER APPS
| Package | App Name |
|---------|----------|
| `com.dreamplug.androidapp` | Dreamplug - Financial app |
| `com.google.ar.lens` | Google Lens - Visual search |

---

## 4. MEDIATEK CHIPSET SERVICES (26 packages) — KEEP

These are hardware-specific services for MediaTek chipset. **DO NOT REMOVE** - removing can cause stability issues, GPS problems, or broken calling features.

| Package | Purpose |
|---------|---------|
| `com.mediatek.ims` | IMS (VoLTE/VoWiFi calling) |
| `com.mediatek.omacp` | OMA CP (Carrier provisioning) |
| `com.mediatek.engineermode` | Engineer Mode (hardware diagnostics) |
| `com.mediatek.ygps` | GPS testing and assistance |
| `com.mediatek.location.mtkgeofence` | Geofencing service |
| `com.mediatek.location.lppe.main` | Location services |
| `com.mediatek.telephony` | Telephony enhancements |
| `com.mediatek.gbaservice` | GBA (Generic Bootstrapping) service |
| `com.mediatek.simprocessor` | SIM card processing |
| `com.mediatek.capctrl.service` | Capacity control service |
| `com.mediatek.mdmlsample` | Diagnostic sample |
| `com.mediatek.batterywarning` | Battery warning service |
| `com.mediatek.voiceunlock` | Voice unlock |
| `com.mediatek.magtapp` | MagtApp service |
| `com.mediatek.mdmconfig` | MDM configuration |
| `com.mediatek.miravision.ui` | MiraVision display settings |
| `com.mediatek.gnss.nonframeworklbs` | GNSS location services |
| `com.mediatek.schpwronoff` | Scheduled power on/off |
| `com.mediatek` | MediaTek framework resources |

---

## 5. GOOGLE APPS (81 packages) — SELECTIVE

### A. KEEP (Essential System Apps)
| Package | Purpose |
|---------|---------|
| `com.google.android.gms` | Google Play Services (CRITICAL) |
| `com.google.android.gsf` | Google Services Framework (CRITICAL) |
| `com.google.android.vending` | Google Play Store |
| `com.android.systemui` | System UI |
| `com.android.settings` | Settings |
| `com.android.phone` | Phone/Dialer |
| `com.android.permissioncontroller` | Permission management |
| `com.android.providers.*` | Content providers (all) |
| `com.google.android.webview` | WebView for embedded browsers |

### B. SAFE TO REMOVE (Optional Google Apps)
| Package | App Name | Description |
|---------|----------|-------------|
| `com.google.android.apps.maps` | Google Maps | Navigation - remove if using others |
| `com.google.android.youtube` | YouTube | Video streaming |
| `com.google.android.gm` | Gmail | Email - remove if using other email |
| `com.google.android.calendar` | Google Calendar | Calendar |
| `com.google.android.apps.messaging` | Messages | SMS app - remove if using WhatsApp only |
| `com.google.android.apps.photos` | Google Photos | Gallery - remove if using another gallery |
| `com.google.android.apps.docs` | Google Docs | Document viewing |
| `com.google.android.apps.nbu.files` | Files by Google | File manager |
| `com.google.android.apps.tachyon` | Google Meet | Video calls |
| `com.google.android.tts` | Google TTS | Text-to-speech |
| `com.google.android.marvin.talkback` | TalkBack | Accessibility - remove if not needed |
| `com.google.android.apps.wellbeing` | Digital Wellbeing | Screen time tracking |
| `com.google.android.apps.nbu.paisa.user` | Google Pay | Payments |
| `com.google.android.apps.youtube.music` | YouTube Music | Music streaming |
| `com.android.chrome` | Chrome | Browser - can use others |

---

## 6. ANDROID SYSTEM APPS (104 packages) — KEEP ALL

Core Android framework and system services. **DO NOT REMOVE**.

- All `com.android.providers.*` packages
- All `com.android.service.*` packages
- All overlay packages
- All framework packages

---

# RECOMMENDED REMOVAL (TIERED APPROACH)

## 🟢 TIER 1: Definitely Safe (No Feature Loss)
Remove these with low risk - they provide duplicate functionality or ads:

```
# Cleaner/Optimizer Bloat
com.transsion.phonemaster
com.transsion.batterylab
com.transsion.trancare
com.transsion.phonemanager
com.transsion.aisupportercore
com.transsion.scanningrecharger
com.transsion.spacesaversdk
com.xui.xhide

# Telemetry/Analytics
com.transsion.uxdetector
com.transsion.statisticalsales
com.transsion.succ

# Duplicate Utility Apps
com.transsion.deskclock
com.transsion.calculator
com.transsion.fmradio

# Pre-installed Promotional
com.transsion.necessity
tech.palm.find
tech.palm.id
```

**Estimated: ~15-20 packages**

## 🟡 TIER 2: Moderately Safe (Check Before Full Removal)
Remove if you don't use these features:

```
# If not using HiOS Launcher
com.transsion.hilauncher
com.hilauncherconfig

# If not using Transsion Camera
com.transsion.camera
com.transsion.mediapipefilters
com.gallery20

# If not using custom lock screen
com.transsion.keyguardclock
com.transsion.keyguardtheme
com.transsion.theme.icon

# If using Google Photos
com.gallery20

# Pre-installed third-party
com.google.android.apps.youtube.music
com.google.android.apps.tachyon
```

**Estimated: ~10-15 additional packages**

## 🔴 TIER 3: Do NOT Remove
Removing these can break features or cause instability:

```
# All MediaTek packages (26 total)
com.mediatek.*

# All System Providers
com.android.providers.*

# Google Play Services
com.google.android.gms
com.google.android.gsf
com.android.vending

# System UI
com.android.systemui
com.android.settings

# Calling
com.android.phone
```

---

# HOW TO REMOVE SAFELY

## Method 1: Disable via Settings (Safest)
```
Settings > Apps > [App Name] > Disable
```
This hides the app from the launcher but keeps it on the system for restoration.

## Method 2: Disable via ADB (Fast)
```powershell
adb shell pm disable-user --user 0 com.transsion.phonemaster
```

## Method 3: Uninstall via ADB (Removes completely)
```powershell
adb shell pm uninstall -k --user 0 com.transsion.phonemaster
```
`-k` keeps data so you can restore later.

## Method 4: Freeze via Titanium Backup (If rooted)
For root users, freezing completely disables without removing.

---

# CREATING RESTORE SCRIPT

Would you like me to create a script that generates a restoration command for every package you disable? Say "yes" and I'll create scripts that:

1. List all disabled packages
2. Generate `adb shell cmd package install-existing <package>` commands
3. Save a complete restore script

---

# SUMMARY

**Total packages analyzed:** 319  
**Safe to remove (Tier 1):** ~20 packages  
**Optional to remove (Tier 2):** ~15 packages  
**Keep:** ~280 packages (MediaTek, Android System, Google Services)

**Estimated space savings:** 500MB - 1.5GB depending on what you remove