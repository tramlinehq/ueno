# Ueno

[![License](https://img.shields.io/badge/license-MIT-green.svg?style=flat)](https://github.com/tramlinehq/ueno/blob/master/LICENSE)
[![](https://img.shields.io/itunes/v/1658845856)](https://apps.apple.com/us/app/ueno/id1658845856)

<img src="https://user-images.githubusercontent.com/50663/220053519-3dab4fe3-f287-43c3-8428-39634f1bdba3.png" height="200" target="_blank">

an aural experience of the very excellent [yamanote line](https://en.wikipedia.org/wiki/Yamanote_Line)

## Creating release builds for android.

### Google Play Store

To generate a release build you need two files that are not, for good reasons, part of this repository:

- `ueno-upload-keystore.jks` in the `android/app` directory.
- `key.properties` in the `android` directory.

You can get these files from our Google Cloud Storage account

## Pipeline Configurations

### GitHub

| Workflow Name                          | Type               | Category                   | Custom Parameters | Deploy-Action | Workflow Run Number as Build Number |
|----------------------------------------|--------------------|----------------------------|-------------------|---------------|------------------------------------|
| andoid-signed-apk.yml                 | Signed APK         | Release Build              | No                | No            | No                                 |
| android-debug-apk-fastlane.yml         | Unsigned APK       | Debug Build & Firebase     | No                | No            | Yes                                |
| android-debug-apk.yml                  | Unsigned APK       | Debug Build              | No                | No            | No                                 |
| android-release-aab-fastlane.yml       | Signed AAB         | Release Build & Play Store | No                | No            | Yes                                |
| android-debug-apk-no-artifact.yml      | Unsigned APK       | Debug build & Firebase & No Artifact     | No                | Yes           | Yes                                | 
| android-release-aab.yml                | Signed AAB         | Release Build              | No                | No            | No                                 |
| android-apk-external.yml               | Unsigned APK       | Debug Build              | No                | No            | Yes                                |
| android-staging-apk-params.yml         | Unsigned APK       | Staging Build              | Yes               | Yes           | No                                 |
| android-staging-apk.yml                | Unsigned APK       | Staging Build              | No                | No            | No                                 |
| ios-fastlane-debug.yml                 | Dev Signed IPA     | Debug Build              | No                | No            | No                                 |
| ios-fastlane-release.yml               | Dev Signed IPA     | Release Build & TestFlight | No                | No            | No                                 |
| ios-non-fastlane-release.yml           | Dev Signed IPA     | Release Build & TestFlight | No                | No            | No                                 |
| single-input-android-apk-debug-params.yml | Unsigned APK       | Debug Build              | Yes               | Yes           | No                                 |
| single-input-android-apk-debug.yml     | Unsigned APK       | Debug Build              | No                | Yes           | No                                 |
| single-input-ios-fastlane-debug.yml    | Dev Signed IPA     | Debug Build              | Yes               | Yes           | No                                 |

### Bitrise

#### Android

| Workflow Name                      | Type          | Category            | Publishing Destination |
|------------------------------------|---------------|---------------------|------------------------|
| debug                              | Signed APK    | Debug Build         | None                   |
| debug_firebase                     | Signed APK    | Debug Build         | Firebase               |
| release                            | Signed AAB    | Release Build       | None                   |
| release_play_store                 | Signed AAB    | Release Build       | Play Store             |
| debug_firebase_no_artifact         | Unsigned APK  | Debug Build (no artifact) | Firebase         |
| debug_no_artifact                  | Unsigned APK  | Debug Build (no artifact) | None             |

#### iOS

This is available in the `main-ios` branch.

| Workflow Name | Type                                    | Category      | Publishing Destination |
|---------------|-----------------------------------------|---------------|------------------------|
| deploy        | Signed app-store distribution certificate | Release Build | TestFlight             |
| debug         | Signed ad-hoc distribution certificate  | Debug Build   | None                   |

### Bitbucket Pipelines

These are available in the [Bitbucket mirror](https://bitbucket.org/tramline/ueno) of this repository.

#### Android

| Workflow Name                      | Type          | Category            | Publishing Destination |
|------------------------------------|---------------|---------------------|------------------------|
| android-debug-apk-firebase         | Unsigned APK  | Debug Build         | Firebase               |
| android-debug-apk                  | Unsigned APK  | Debug Build         | None                   |
| android-release-aab                | Signed AAB    | Release Build       | None                   |
| android-release-aab-playstore      | Signed AAB    | Release Build       | Play Store             |
| android-debug-apk-firebase-no-artifact | Unsigned APK | Debug Build (no artifact) | Firebase      |

#### iOS

iOS pipelines are currently not functional on Bitbucket.
