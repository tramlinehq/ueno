# ueno

[![License](https://img.shields.io/badge/license-MIT-green.svg?style=flat)](https://github.com/tramlinehq/ueno/blob/master/LICENSE)
[![](https://img.shields.io/itunes/v/1658845856)](https://apps.apple.com/us/app/ueno/id1658845856)
[![](https://img.shields.io/endpoint?color=green&logo=google-play&logoColor=green&url=https%3A%2F%2Fplay.cuzi.workers.dev%2Fplay%3Fi%3Dcom.tramline.ueno%26l%3Dandroid%26m%3D%24version)](https://play.google.com/store/apps/details?id=com.tramline.ueno)

<img src="https://user-images.githubusercontent.com/50663/220053519-3dab4fe3-f287-43c3-8428-39634f1bdba3.png" height="550" target="_blank">

an aural experience of the very excellent [yamanote line](https://en.wikipedia.org/wiki/Yamanote_Line)

## Creating release builds

### Play Store

To generate a release build you need two files that are not, for good reasons, part of this repository: 

- `ueno-upload-keystore.jks` in the `android/app` directory 
- `key.properties` in the `android` directory 

You can get these files from our Google Cloud Storage account. 
