# Ueno

[![License](https://img.shields.io/badge/license-MIT-green.svg?style=flat)](https://github.com/tramlinehq/ueno/blob/master/LICENSE)
[![](https://img.shields.io/itunes/v/1658845856)](https://apps.apple.com/us/app/ueno/id1658845856)

<img src="https://user-images.githubusercontent.com/50663/220053519-3dab4fe3-f287-43c3-8428-39634f1bdba3.png" height="200" target="_blank">

an aural experience of the very excellent [yamanote line](https://en.wikipedia.org/wiki/Yamanote_Line)

## Creating release builds for android

### Play Store

To generate a release build you need two files that are not, for good reasons, part of this repository:

- `ueno-upload-keystore.jks` in the `android/app` directory.
- `key.properties` in the `android` directory.

You can get these files from our Google Cloud Storage account.
