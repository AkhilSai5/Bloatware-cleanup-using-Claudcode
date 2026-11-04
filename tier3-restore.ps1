# Restore script for the approved enabled-only optional-app batch.
# Created before the changes on 2026-10-28.
# Run from D:\demo_claude_code with the phone connected and authorized.

$packages = @(
  'com.transsion.chromecustomization', # TECNO Chrome customization
  'com.transsion.cloudserver',         # TECNO cloud service
  'com.transsion.thunderback',         # TECNO backup service
  'com.transsion.microintelligence',   # TECNO AI/smart-feature service
  'com.transsion.dynamicbar',          # TECNO Dynamic Bar
  'com.transsion.nephilim',            # TECNO themes component
  'com.transsion.applock',             # TECNO App Lock
  'com.transsion.dualapp',             # TECNO Dual App
  'com.transsion.faceid',              # TECNO Face Unlock
  'com.google.android.feedback'        # Google Feedback
)

foreach ($package in $packages) {
  adb shell pm enable --user 0 $package
}
