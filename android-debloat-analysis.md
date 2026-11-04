# Android Debloat Analysis - TECNO_KJ8
**Device:** TECNO_KJ8 (120533148P056211)  
**Date:** 2026-10-28  
**Total Packages:** 319

---

## Package Analysis by Category

### 1. OEM Bloatware (Transsion/Tecno) - SAFE TO REMOVE
These are manufacturer-added apps that duplicate system functionality or provide questionable value.

| Package | Purpose | Risk Level | Notes |
|---------|---------|-----------|-------|
| `com.transsion.ella` | Smart Assistant | Low | Duplicate to Google Assistant |
| `com.transsion.phonemaster` | Phone Cleaner/Optimizer | Low | Redundant; system handles this |
| `com.transsion.batterylab` | Battery Management | Low | Duplicate to native battery settings |
| `com.transsion.applock` | App Lock | Low | Can use system lock instead |
| `com.transsion.dualapp` | Dual App Clone | Low | Rarely needed |
| `com.transsion.screenrecorder` | Screen Recorder | Low | Built into Android 11+ |
| `com.transsion.multiwindow` | Multi-window | Low | Stock Android feature |
| `com.transsion.iotservice` | IoT Service | Medium | Connected device support; likely unused |
| `com.transsion.teop` | Telecom Operator? | Medium | Carrier-specific; check before removing |
| `com.transsion.cloudserver` | Cloud Service | Low | Proprietary cloud storage |
| `com.transsion.hilauncher` | HiOS Launcher | Low | Use stock launcher or another instead |
| `com.transsion.magicfont` | Custom Fonts | Low | Can use system fonts |
| `com.transsion.faceid` | Face Unlock | Low | Use system biometric settings |
| `com.transsion.trancare` | Device Care | Low | Redundant optimizer |
| `com.transsion.easypic` | Easy Pic | Low | Photo enhancement; can use Google Photos |
| `com.transsion.uxdetector` | UX Detection | Low | Telemetry/analytics |
| `com.transsion.systemupdate` | System Update | Medium | Keep—handles OTA updates |
| `com.transsion.plat.appupdate` | App Update Manager | Medium | Important for app updates |
| `com.transsion.repaircard` | Repair Card/Warranty | Low | OEM support; rarely used |
| `com.transsion.guideservice` | Guide/Tutorial Service | Low | Help tips |
| `com.transsion.keyguardclock` | Lock Screen Clock | Low | Stock lock screen has this |
| `com.transsion.keyguardtheme` | Lock Screen Theme | Low | Stock lock screen theming |
| `com.transsion.mediapipefilters` | Video Filters | Low | Camera enhancement |
| `com.transsion.microintelligence` | AI Features | Low | Proprietary AI |
| `com.transsion.necessit` | Necessity App | Low | Unknown; likely spam |
| `com.transsion.audiosmartconnect` | Audio Enhancement | Low | Can disable in settings |
| `com.transsion.tower` | ControlTower | Low | System control hub |
| `com.transsion.resolver` | Share Menu Custom | Low | Safe to remove |
| `com.transsion.deskclock` | Desk Clock | Low | Use Google Clock or similar |
| `com.transsion.calculator` | Calculator | Low | Use Google Calculator or built-in |
| `com.transsion.scanningrecharger` | Smart Scan | Low | Cleaner/optimizer |
| `com.transsion.hamal` | Hamal Browser | Low | Proprietary browser; use Chrome |
| `com.transsion.fmradio` | FM Radio | Low | If you don't use radio |
| `com.transsion.camera` | Transsion Camera | Low | Use stock/Google Camera |
| `com.transsion.tranengine` | Tran Engine | Low | Background optimizer |
| `com.transsion.statisticalsales` | Statistical Sales | Low | Analytics/telemetry |
| `com.transsion.aisettings` | AI Voice Settings | Low | Proprietary AI |
| `com.transsion.skyguardclock` | Clock Widget | Low | Stock clock available |
| `com.transsion.mol` | Master of Language | Low | Language feature |
| `com.transsion.tabe` | Tran ABE | Low | Unknown; likely system enhancement |
| `com.transsion.thunderback` | Thunder Backup | Low | Use Google Backup instead |
| `com.transsion.succ` | SUCC Service | Low | Unknown background service |
| `com.transsion.aisupportercore` | AI Supporter Core | Low | Background AI service |

**Total Transsion packages (safe to remove):** ~50 packages

---

### 2. Mediatek Chipset Bloat - KEEP (System Dependencies)
These are chipset-specific and removing them can cause stability issues.

| Package | Purpose | Keep? |
|---------|---------|-------|
| `com.mediatek.*` | Various services | **YES** |
| `com.mediatek.ygps` | GNSS/GPS | YES |
| `com.mediatek.ims` | IMS Calling | YES |
| `com.mediatek.omacp` | OMA CP | YES |
| `com.mediatek.engineermode` | Engineer Mode | YES (hidden) |

---

### 3. Google/Android System Apps - SELECTIVE REMOVAL
Keep essential ones; remove if you don't use them.

**Safe to Keep:**
- `com.android.vending` (Google Play Store)
- `com.google.android.gms` (Google Play Services—CRITICAL)
- `com.google.android.gsf` (Google Services Framework—CRITICAL)
- `com.android.systemui` (System UI)
- `com.android.settings` (Settings)
- `com.android.phone` (Phone/Dialer)
- `com.google.android.permissioncontroller` (Permissions)
- `com.google.android.ext.services` (Google Services)
- `com.google.android.webview` (WebView—used by apps)

**Safe to Remove (Google Apps You Might Not Use):**
- `com.google.android.apps.maps` — Remove if you use another maps app
- `com.google.android.youtube` — Remove if you use YouTube on web or another client
- `com.google.android.calendar` — Remove if you use another calendar
- `com.google.android.gm` — Remove if you don't use Gmail
- `com.google.android.apps.messaging` — Remove if you use WhatsApp/Telegram only
- `com.google.android.apps.docs` — Remove if you don't use Google Docs
- `com.google.android.apps.photos` — Remove if you use another gallery (but sync is useful)
- `com.google.android.apps.nbu.files` — Files app; optional
- `com.google.android.gm` — Gmail; optional
- `com.google.android.tts` — Text-to-speech; optional
- `com.google.android.marvin.talkback` — TalkBack (accessibility); remove if not using
- `com.google.android.apps.wellbeing` — Digital Wellbeing; optional
- `com.google.android.apps.nbu.paisa.user` — Google Pay; optional if you don't use it

**Cannot Remove (System Critical):**
- `com.android.providers.*` (Content providers—needed by system)
- `com.android.framework` (Framework)
- All system overlays and modules
- Google Play Services components

---

### 4. Pre-Installed Third-Party Apps (User-Installed Category)

**Financial/Payment Apps** (Keep if you use them):
- `net.one97.paytm` — Paytm wallet
- `com.csam.icici.bank.imobile` — ICICI Bank
- `com.ge.capital.konysbiapp` — GE Capital
- `com.paycards.app` — Paycards
- `com.indusind.indie` — IndusInd Bank
- `in.org.npci.upiapp` — NPCI UPI
- `com.phonepe.app` — PhonePe
- `com.hdfcbank.payzapp` — HDFC PayZapp
- `com.hdfcbank.android.now` — HDFC Bank
- `com.infrasoft.uboi` — Union Bank
- `org.npci.token.hdfc` — HDFC Token
- `com.bob.fe` — Bank of Baroda

**E-Commerce Apps** (Keep if you use them):
- `com.myntra.android` — Myntra
- `com.flipkart.android` — Flipkart
- `com.jpl.jiomart` — JioMart
- `in.amazon.mShop.android.shopping` — Amazon
- `com.magicpin.local` — MagicPin

**Communication** (Keep):
- `com.whatsapp` — WhatsApp
- `com.Slack` — Slack
- `com.truecaller` — Truecaller

**Google Productivity** (Keep if you use them):
- `com.google.android.inputmethod.latin` — Gboard keyboard
- `com.google.android.documentsui` — Google Docs
- `com.google.android.gm` — Gmail
- `com.google.ar.lens` — Google Lens

**Other Pre-installed**:
- `org.altruist.BajajExperia` — Insurance app; remove if not using
- `com.dreamplug.androidapp` — Dream Plug; remove if not using
- `com.gov.ssc` — Government app; keep if relevant

---

### 5. Overlay/Resource Packages - KEEP (Non-Removable System)
These are system overlays and cannot be removed safely:
- `com.theme.icondefaultshape*`
- `com.android.overlay.*`
- `com.google.android.overlay.*`
- `com.transsion.overlaysuw*`
- etc. (all overlay packages)

---

## Summary: Safe Removal Recommendations

### **Tier 1: Definitely Safe (Low Risk)**
~30-40 packages of obvious OEM bloat:
- All `com.transsion.*` cleaner/optimizer apps
- Transsion duplicate services (launcher, camera, clock, calculator, etc.)
- Transsion analytics/telemetry packages

### **Tier 2: Moderately Safe (if you don't use them)**
- `com.transsion.teop` (check if carrier-specific)
- `com.transsion.systemupdate` (only if you handle updates manually)
- Unused Google apps (Maps, YouTube, Gmail, Calendar, etc.)
- Pre-installed shopping/finance apps you don't use

### **Tier 3: Do Not Remove**
- All Mediatek packages
- All `com.android.providers.*`
- All `com.android.framework*`
- `com.google.android.gms` and related Google Services
- System UI and Settings

---

## Next Steps

1. **Review the lists above** and decide which packages to remove
2. **I'll create removal and restore scripts** for your selections
3. **Test after each removal** to ensure no breakage
4. **Keep the restore script** to undo changes if needed

Let me know which categories you want to remove, or if you want me to create a "conservative" removal script (Tier 1 only).
