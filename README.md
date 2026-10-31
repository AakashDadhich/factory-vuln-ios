# factory-vuln-ios

> **Intentionally vulnerable. Never ship.**

A deliberately misconfigured SwiftUI iOS app that the [Security Software Factory](https://github.com/AakashDadhich/security-factory) runs against in its weekly acceptance test. It is built unsigned in CI and never installed or distributed.

Planted flaws (the list the factory must catch is in `expected-findings.yml`):

- `NSAllowsArbitraryLoads` is true in the Info.plist (set in `project.yml`).
- An auth token is saved to `UserDefaults` under `authToken`.
- A Keychain item is saved with `kSecAttrAccessibleAlways`.
- A password is hashed with `Insecure.MD5`.
- There is no `PrivacyInfo.xcprivacy`, while the app uses `UserDefaults`.
- `Config/App.entitlements` sets `get-task-allow` to true.
- `ZIPFoundation` is pinned to 0.9.16, which has an advisory in OSV (CVE-2023-39138, fixed in 0.9.18).
