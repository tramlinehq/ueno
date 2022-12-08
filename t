[1mdiff --git a/ios/Podfile.lock b/ios/Podfile.lock[m
[1mindex 146c7bf..f8e6160 100644[m
[1m--- a/ios/Podfile.lock[m
[1m+++ b/ios/Podfile.lock[m
[36m@@ -4,6 +4,8 @@[m [mPODS:[m
   - Flutter (1.0.0)[m
   - just_audio (0.0.1):[m
     - Flutter[m
[32m+[m[32m  - package_info_plus (0.4.5):[m
[32m+[m[32m    - Flutter[m
   - path_provider_ios (0.0.1):[m
     - Flutter[m
 [m
[36m@@ -11,6 +13,7 @@[m [mDEPENDENCIES:[m
   - audio_session (from `.symlinks/plugins/audio_session/ios`)[m
   - Flutter (from `Flutter`)[m
   - just_audio (from `.symlinks/plugins/just_audio/ios`)[m
[32m+[m[32m  - package_info_plus (from `.symlinks/plugins/package_info_plus/ios`)[m
   - path_provider_ios (from `.symlinks/plugins/path_provider_ios/ios`)[m
 [m
 EXTERNAL SOURCES:[m
[36m@@ -20,6 +23,8 @@[m [mEXTERNAL SOURCES:[m
     :path: Flutter[m
   just_audio:[m
     :path: ".symlinks/plugins/just_audio/ios"[m
[32m+[m[32m  package_info_plus:[m
[32m+[m[32m    :path: ".symlinks/plugins/package_info_plus/ios"[m
   path_provider_ios:[m
     :path: ".symlinks/plugins/path_provider_ios/ios"[m
 [m
[36m@@ -27,8 +32,9 @@[m [mSPEC CHECKSUMS:[m
   audio_session: 4f3e461722055d21515cf3261b64c973c062f345[m
   Flutter: 50d75fe2f02b26cc09d224853bb45737f8b3214a[m
   just_audio: baa7252489dbcf47a4c7cc9ca663e9661c99aafa[m
[32m+[m[32m  package_info_plus: 6c92f08e1f853dc01228d6f553146438dafcd14e[m
   path_provider_ios: 7d7ce634493af4477d156294792024ec3485acd5[m
 [m
 PODFILE CHECKSUM: 8e679eca47255a8ca8067c4c67aab20e64cb974d[m
 [m
[31m-COCOAPODS: 1.11.2[m
[32m+[m[32mCOCOAPODS: 1.11.3[m
[1mdiff --git a/ios/Runner.xcworkspace/contents.xcworkspacedata b/ios/Runner.xcworkspace/contents.xcworkspacedata[m
[1mindex 21a3cc1..4edc6d3 100644[m
[1m--- a/ios/Runner.xcworkspace/contents.xcworkspacedata[m
[1m+++ b/ios/Runner.xcworkspace/contents.xcworkspacedata[m
[36m@@ -2,7 +2,7 @@[m
 <Workspace[m
    version = "1.0">[m
    <FileRef[m
[31m-      location = "group:Runner.xcodeproj">[m
[32m+[m[32m      location = "group:/Users/kitallis/Work/tramline/ueno/ios/Ueno.xcodeproj">[m
    </FileRef>[m
    <FileRef[m
       location = "group:Pods/Pods.xcodeproj">[m
[1mdiff --git a/ios/Runner/Assets.xcassets/AppIcon.appiconset/Contents.json b/ios/Runner/Assets.xcassets/AppIcon.appiconset/Contents.json[m
[1mindex d36b1fa..65b74d7 100644[m
[1m--- a/ios/Runner/Assets.xcassets/AppIcon.appiconset/Contents.json[m
[1m+++ b/ios/Runner/Assets.xcassets/AppIcon.appiconset/Contents.json[m
[36m@@ -1,122 +1 @@[m
[31m-{[m
[31m-  "images" : [[m
[31m-    {[m
[31m-      "size" : "20x20",[m
[31m-      "idiom" : "iphone",[m
[31m-      "filename" : "Icon-App-20x20@2x.png",[m
[31m-      "scale" : "2x"[m
[31m-    },[m
[31m-    {[m
[31m-      "size" : "20x20",[m
[31m-      "idiom" : "iphone",[m
[31m-      "filename" : "Icon-App-20x20@3x.png",[m
[31m-      "scale" : "3x"[m
[31m-    },[m
[31m-    {[m
[31m-      "size" : "29x29",[m
[31m-      "idiom" : "iphone",[m
[31m-      "filename" : "Icon-App-29x29@1x.png",[m
[31m-      "scale" : "1x"[m
[31m-    },[m
[31m-    {[m
[31m-      "size" : "29x29",[m
[31m-      "idiom" : "iphone",[m
[31m-      "filename" : "Icon-App-29x29@2x.png",[m
[31m-      "scale" : "2x"[m
[31m-    },[m
[31m-    {[m
[31m-      "size" : "29x29",[m
[31m-      "idiom" : "iphone",[m
[31m-      "filename" : "Icon-App-29x29@3x.png",[m
[31m-      "scale" : "3x"[m
[31m-    },[m
[31m-    {[m
[31m-      "size" : "40x40",[m
[31m-      "idiom" : "iphone",[m
[31m-      "filename" : "Icon-App-40x40@2x.png",[m
[31m-      "scale" : "2x"[m
[31m-    },[m
[31m-    {[m
[31m-      "size" : "40x40",[m
[31m-      "idiom" : "iphone",[m
[31m-      "filename" : "Icon-App-40x40@3x.png",[m
[31m-      "scale" : "3x"[m
[31m-    },[m
[31m-    {[m
[31m-      "size" : "60x60",[m
[31m-      "idiom" : "iphone",[m
[31m-      "filename" : "Icon-App-60x60@2x.png",[m
[31m-      "scale" : "2x"[m
[31m-    },[m
[31m-    {[m
[31m-      "size" : "60x60",[m
[31m-      "idiom" : "iphone",[m
[31m-      "filename" : "Icon-App-60x60@3x.png",[m
[31m-      "scale" : "3x"[m
[31m-    },[m
[31m-    {[m
[31m-      "size" : "20x20",[m
[31m-      "idiom" : "ipad",[m
[31m-      "filename" : "Icon-App-20x20@1x.png",[m
[31m-      "scale" : "1x"[m
[31m-    },[m
[31m-    {[m
[31m-      "size" : "20x20",[m
[31m-      "idiom" : "ipad",[m
[31m-      "filename" : "Icon-App-20x20@2x.png",[m
[31m-      "scale" : "2x"[m
[31m-    },[m
[31m-    {[m
[31m-      "size" : "29x29",[m
[31m-      "idiom" : "ipad",[m
[31m-      "filename" : "Icon-App-29x29@1x.png",[m
[31m-      "scale" : "1x"[m
[31m-    },[m
[31m-    {[m
[31m-      "size" : "29x29",[m
[31m-      "idiom" : "ipad",[m
[31m-      "filename" : "Icon-App-29x29@2x.png",[m
[31m-      "scale" : "2x"[m
[31m-    },[m
[31m-    {[m
[31m-      "size" : "40x40",[m
[31m-      "idiom" : "ipad",[m
[31m-      "filename" : "Icon-App-40x40@1x.png",[m
[31m-      "scale" : "1x"[m
[31m-    },[m
[31m-    {[m
[31m-      "size" : "40x40",[m
[31m-      "idiom" : "ipad",[m
[31m-      "filename" : "Icon-App-40x40@2x.png",[m
[31m-      "scale" : "2x"[m
[31m-    },[m
[31m-    {[m
[31m-      "size" : "76x76",[m
[31m-      "idiom" : "ipad",[m
[31m-      "filename" : "Icon-App-76x76@1x.png",[m
[31m-      "scale" : "1x"[m
[31m-    },[m
[31m-    {[m
[31m-      "size" : "76x76",[m
[31m-      "idiom" : "ipad",[m
[31m-      "filename" : "Icon-App-76x76@2x.png",[m
[31m-      "scale" : "2x"[m
[31m-    },[m
[31m-    {[m
[31m-      "size" : "83.5x83.5",[m
[31m-      "idiom" : "ipad",[m
[31m-      "filename" : "Icon-App-83.5x83.5@2x.png",[m
[31m-      "scale" : "2x"[m
[31m-    },[m
[31m-    {[m
[31m-      "size" : "1024x1024",[m
[31m-      "idiom" : "ios-marketing",[m
[31m-      "filename" : "Icon-App-1024x1024@1x.png",[m
[31m-      "scale" : "1x"[m
[31m-    }[m
[31m-  ],[m
[31m-  "info" : {[m
[31m-    "version" : 1,[m
[31m-    "author" : "xcode"[m
[31m-  }[m
[31m-}[m
[32m+[m[32m{"images":[{"size":"60x60","expected-size":"180","filename":"180.png","folder":"Assets.xcassets/AppIcon.appiconset/","idiom":"iphone","scale":"3x"},{"size":"40x40","expected-size":"80","filename":"80.png","folder":"Assets.xcassets/AppIcon.appiconset/","idiom":"iphone","scale":"2x"},{"size":"40x40","expected-size":"120","filename":"120.png","folder":"Assets.xcassets/AppIcon.appiconset/","idiom":"iphone","scale":"3x"},{"size":"60x60","expected-size":"120","filename":"120.png","folder":"Assets.xcassets/AppIcon.appiconset/","idiom":"iphone","scale":"2x"},{"size":"57x57","expected-size":"57","filename":"57.png","folder":"Assets.xcassets/AppIcon.appiconset/","idiom":"iphone","scale":"1x"},{"size":"29x29","expected-size":"58","filename":"58.png","folder":"Assets.xcassets/AppIcon.appiconset/","idiom":"iphone","scale":"2x"},{"size":"29x29","expected-size":"29","filename":"29.png","folder":"Assets.xcassets/AppIcon.appiconset/","idiom":"iphone","scale":"1x"},{"size":"29x29","expected-size":"87","filename":"87.png","folder":"Assets.xcassets/AppIcon.appiconset/","idiom":"iphone","scale":"3x"},{"size":"57x57","expected-size":"114","filename":"114.png","folder":"Assets.xcassets/AppIcon.appiconset/","idiom":"iphone","scale":"2x"},{"size":"20x20","expected-size":"40","filename":"40.png","folder":"Assets.xcassets/AppIcon.appiconset/","idiom":"iphone","scale":"2x"},{"size":"20x20","expected-size":"60","filename":"60.png","folder":"Assets.xcassets/AppIcon.appiconset/","idiom":"iphone","scale":"3x"},{"size":"1024x1024","filename":"1024.png","expected-size":"1024","idiom":"ios-marketing","folder":"Assets.xcassets/AppIcon.appiconset/","scale":"1x"},{"size":"40x40","expected-size":"80","filename":"80.png","folder":"Assets.xcassets/AppIcon.appiconset/","idiom":"ipad","scale":"2x"},{"size":"72x72","expected-size":"72","filename":"72.png","folder":"Assets.xcassets/AppIcon.appiconset/","idiom":"ipad","scale":"1x"},{"size":"76x76","expected-size":"152","filename":"152.png","folder":"Assets.xcassets/AppIcon.appiconset/","idiom":"ipad","scale":"2x"},{"size":"50x50","expected-size":"100","filename":"100.png","folder":"Assets.xcassets/AppIcon.appiconset/","idiom":"ipad","scale":"2x"},{"size":"29x29","expected-size":"58","filename":"58.png","folder":"Assets.xcassets/AppIcon.appiconset/","idiom":"ipad","scale":"2x"},{"size":"76x76","expected-size":"76","filename":"76.png","folder":"Assets.xcassets/AppIcon.appiconset/","idiom":"ipad","scale":"1x"},{"size":"29x29","expected-size":"29","filename":"29.png","folder":"Assets.xcassets/AppIcon.appiconset/","idiom":"ipad","scale":"1x"},{"size":"50x50","expected-size":"50","filename":"50.png","folder":"Assets.xcassets/AppIcon.appiconset/","idiom":"ipad","scale":"1x"},{"size":"72x72","expected-size":"144","filename":"144.png","folder":"Assets.xcassets/AppIcon.appiconset/","idiom":"ipad","scale":"2x"},{"size":"40x40","expected-size":"40","filename":"40.png","folder":"Assets.xcassets/AppIcon.appiconset/","idiom":"ipad","scale":"1x"},{"size":"83.5x83.5","expected-size":"167","filename":"167.png","folder":"Assets.xcassets/AppIcon.appiconset/","idiom":"ipad","scale":"2x"},{"size":"20x20","expected-size":"20","filename":"20.png","folder":"Assets.xcassets/AppIcon.appiconset/","idiom":"ipad","scale":"1x"},{"size":"20x20","expected-size":"40","filename":"40.png","folder":"Assets.xcassets/AppIcon.appiconset/","idiom":"ipad","scale":"2x"}]}[m
\ No newline at end of file[m
[1mdiff --git a/ios/Runner/Assets.xcassets/AppIcon.appiconset/Icon-App-1024x1024@1x.png b/ios/Runner/Assets.xcassets/AppIcon.appiconset/Icon-App-1024x1024@1x.png[m
[1mdeleted file mode 100644[m
[1mindex 78010b8..0000000[m
Binary files a/ios/Runner/Assets.xcassets/AppIcon.appiconset/Icon-App-1024x1024@1x.png and /dev/null differ
[1mdiff --git a/ios/Runner/Assets.xcassets/AppIcon.appiconset/Icon-App-20x20@1x.png b/ios/Runner/Assets.xcassets/AppIcon.appiconset/Icon-App-20x20@1x.png[m
[1mdeleted file mode 100644[m
[1mindex cae6728..0000000[m
Binary files a/ios/Runner/Assets.xcassets/AppIcon.appiconset/Icon-App-20x20@1x.png and /dev/null differ
[1mdiff --git a/ios/Runner/Assets.xcassets/AppIcon.appiconset/Icon-App-20x20@2x.png b/ios/Runner/Assets.xcassets/AppIcon.appiconset/Icon-App-20x20@2x.png[m
[1mdeleted file mode 100644[m
[1mindex 9c703a7..0000000[m
Binary files a/ios/Runner/Assets.xcassets/AppIcon.appiconset/Icon-App-20x20@2x.png and /dev/null differ
[1mdiff --git a/ios/Runner/Assets.xcassets/AppIcon.appiconset/Icon-App-20x20@3x.png b/ios/Runner/Assets.xcassets/AppIcon.appiconset/Icon-App-20x20@3x.png[m
[1mdeleted file mode 100644[m
[1mindex 521348c..0000000[m
Binary files a/ios/Runner/Assets.xcassets/AppIcon.appiconset/Icon-App-20x20@3x.png and /dev/null differ
[1mdiff --git a/ios/Runner/Assets.xcassets/AppIcon.appiconset/Icon-App-29x29@1x.png b/ios/Runner/Assets.xcassets/AppIcon.appiconset/Icon-App-29x29@1x.png[m
[1mdeleted file mode 100644[m
[1mindex 4955a59..0000000[m
Binary files a/ios/Runner/Assets.xcassets/AppIcon.appiconset/Icon-App-29x29@1x.png and /dev/null differ
[1mdiff --git a/ios/Runner/Assets.xcassets/AppIcon.appiconset/Icon-App-29x29@2x.png b/ios/Runner/Assets.xcassets/AppIcon.appiconset/Icon-App-29x29@2x.png[m
[1mdeleted file mode 100644[m
[1mindex 699e370..0000000[m
Binary files a/ios/Runner/Assets.xcassets/AppIcon.appiconset/Icon-App-29x29@2x.png and /dev/null differ
[1mdiff --git a/ios/Runner/Assets.xcassets/AppIcon.appiconset/Icon-App-29x29@3x.png b/ios/Runner/Assets.xcassets/AppIcon.appiconset/Icon-App-29x29@3x.png[m
[1mdeleted file mode 100644[m
[1mindex 6d9435a..0000000[m
Binary files a/ios/Runner/Assets.xcassets/AppIcon.appiconset/Icon-App-29x29@3x.png and /dev/null differ
[1mdiff --git a/ios/Runner/Assets.xcassets/AppIcon.appiconset/Icon-App-40x40@1x.png b/ios/Runner/Assets.xcassets/AppIcon.appiconset/Icon-App-40x40@1x.png[m
[1mdeleted file mode 100644[m
[1mindex 9c703a7..0000000[m
Binary files a/ios/Runner/Assets.xcassets/AppIcon.appiconset/Icon-App-40x40@1x.png and /dev/null differ
[1mdiff --git a/ios/Runner/Assets.xcassets/AppIcon.appiconset/Icon-App-40x40@2x.png b/ios/Runner/Assets.xcassets/AppIcon.appiconset/Icon-App-40x40@2x.png[m
[1mdeleted file mode 100644[m
[1mindex 7bea539..0000000[m
Binary files a/ios/Runner/Assets.xcassets/AppIcon.appiconset/Icon-App-40x40@2x.png and /dev/null differ
[1mdiff --git a/ios/Runner/Assets.xcassets/AppIcon.appiconset/Icon-App-40x40@3x.png b/ios/Runner/Assets.xcassets/AppIcon.appiconset/Icon-App-40x40@3x.png[m
[1mdeleted file mode 100644[m
[1mindex b561f39..0000000[m
Binary files a/ios/Runner/Assets.xcassets/AppIcon.appiconset/Icon-App-40x40@3x.png and /dev/null differ
[1mdiff --git a/ios/Runner/Assets.xcassets/AppIcon.appiconset/Icon-App-60x60@2x.png b/ios/Runner/Assets.xcassets/AppIcon.appiconset/Icon-App-60x60@2x.png[m
[1mdeleted file mode 100644[m
[1mindex b561f39..0000000[m
Binary files a/ios/Runner/Assets.xcassets/AppIcon.appiconset/Icon-App-60x60@2x.png and /dev/null differ
[1mdiff --git a/ios/Runner/Assets.xcassets/AppIcon.appiconset/Icon-App-60x60@3x.png b/ios/Runner/Assets.xcassets/AppIcon.appiconset/Icon-App-60x60@3x.png[m
[1mdeleted file mode 100644[m
[1mindex 65665ed..0000000[m
Binary files a/ios/Runner/Assets.xcassets/AppIcon.appiconset/Icon-App-60x60@3x.png and /dev/null differ
[1mdiff --git a/ios/Runner/Assets.xcassets/AppIcon.appiconset/Icon-App-76x76@1x.png b/ios/Runner/Assets.xcassets/AppIcon.appiconset/Icon-App-76x76@1x.png[m
[1mdeleted file mode 100644[m
[1mindex 5ef2e09..0000000[m
Binary files a/ios/Runner/Assets.xcassets/AppIcon.appiconset/Icon-App-76x76@1x.png and /dev/null differ
[1mdiff --git a/ios/Runner/Assets.xcassets/AppIcon.appiconset/Icon-App-76x76@2x.png b/ios/Runner/Assets.xcassets/AppIcon.appiconset/Icon-App-76x76@2x.png[m
[1mdeleted file mode 100644[m
[1mindex bab3f18..0000000[m
Binary files a/ios/Runner/Assets.xcassets/AppIcon.appiconset/Icon-App-76x76@2x.png and /dev/null differ
[1mdiff --git a/ios/Runner/Assets.xcassets/AppIcon.appiconset/Icon-App-83.5x83.5@2x.png b/ios/Runner/Assets.xcassets/AppIcon.appiconset/Icon-App-83.5x83.5@2x.png[m
[1mdeleted file mode 100644[m
[1mindex 56209b1..0000000[m
Binary files a/ios/Runner/Assets.xcassets/AppIcon.appiconset/Icon-App-83.5x83.5@2x.png and /dev/null differ
[1mdiff --git a/ios/Ueno.xcodeproj/project.pbxproj b/ios/Ueno.xcodeproj/project.pbxproj[m
[1mindex 2e8d919..17b9c82 100644[m
[1m--- a/ios/Ueno.xcodeproj/project.pbxproj[m
[1m+++ b/ios/Ueno.xcodeproj/project.pbxproj[m
[36m@@ -42,7 +42,7 @@[m
 		7AFA3C8E1D35360C0083082E /* Release.xcconfig */ = {isa = PBXFileReference; lastKnownFileType = text.xcconfig; name = Release.xcconfig; path = Flutter/Release.xcconfig; sourceTree = "<group>"; };[m
 		9740EEB21CF90195004384FC /* Debug.xcconfig */ = {isa = PBXFileReference; fileEncoding = 4; lastKnownFileType = text.xcconfig; name = Debug.xcconfig; path = Flutter/Debug.xcconfig; sourceTree = "<group>"; };[m
 		9740EEB31CF90195004384FC /* Generated.xcconfig */ = {isa = PBXFileReference; fileEncoding = 4; lastKnownFileType = text.xcconfig; name = Generated.xcconfig; path = Flutter/Generated.xcconfig; sourceTree = "<group>"; };[m
[31m-		97C146EE1CF9000F007C117D /* Runner.app */ = {isa = PBXFileReference; explicitFileType = wrapper.application; includeInIndex = 0; path = Runner.app; sourceTree = BUILT_PRODUCTS_DIR; };[m
[32m+[m		[32m97C146EE1CF9000F007C117D /* Ueno.app */ = {isa = PBXFileReference; explicitFileType = wrapper.application; includeInIndex = 0; path = Ueno.app; sourceTree = BUILT_PRODUCTS_DIR; };[m
 		97C146FB1CF9000F007C117D /* Base */ = {isa = PBXFileReference; lastKnownFileType = file.storyboard; name = Base; path = Base.lproj/Main.storyboard; sourceTree = "<group>"; };[m
 		97C146FD1CF9000F007C117D /* Assets.xcassets */ = {isa = PBXFileReference; lastKnownFileType = folder.assetcatalog; path = Assets.xcassets; sourceTree = "<group>"; };[m
 		97C147001CF9000F007C117D /* Base */ = {isa = PBXFileReference; lastKnownFileType = file.storyboard; name = Base; path = Base.lproj/LaunchScreen.storyboard; sourceTree = "<group>"; };[m
[36m@@ -94,7 +94,7 @@[m
 		97C146EF1CF9000F007C117D /* Products */ = {[m
 			isa = PBXGroup;[m
 			children = ([m
[31m-				97C146EE1CF9000F007C117D /* Runner.app */,[m
[32m+[m				[32m97C146EE1CF9000F007C117D /* Ueno.app */,[m
 			);[m
 			name = Products;[m
 			sourceTree = "<group>";[m
[36m@@ -127,9 +127,9 @@[m
 /* End PBXGroup section */[m
 [m
 /* Begin PBXNativeTarget section */[m
[31m-		97C146ED1CF9000F007C117D /* Runner */ = {[m
[32m+[m		[32m97C146ED1CF9000F007C117D /* Ueno */ = {[m
 			isa = PBXNativeTarget;[m
[31m-			buildConfigurationList = 97C147051CF9000F007C117D /* Build configuration list for PBXNativeTarget "Runner" */;[m
[32m+[m			[32mbuildConfigurationList = 97C147051CF9000F007C117D /* Build configuration list for PBXNativeTarget "Ueno" */;[m
 			buildPhases = ([m
 				5566EFB17BCE9986C0473B21 /* [CP] Check Pods Manifest.lock */,[m
 				9740EEB61CF901F6004384FC /* Run Script */,[m
[36m@@ -143,9 +143,9 @@[m
 			);[m
 			dependencies = ([m
 			);[m
[31m-			name = Runner;[m
[32m+[m			[32mname = Ueno;[m
 			productName = Runner;[m
[31m-			productReference = 97C146EE1CF9000F007C117D /* Runner.app */;[m
[32m+[m			[32mproductReference = 97C146EE1CF9000F007C117D /* Ueno.app */;[m
 			productType = "com.apple.product-type.application";[m
 		};[m
 /* End PBXNativeTarget section */[m
[36m@@ -163,7 +163,7 @@[m
 					};[m
 				};[m
 			};[m
[31m-			buildConfigurationList = 97C146E91CF9000F007C117D /* Build configuration list for PBXProject "Runner" */;[m
[32m+[m			[32mbuildConfigurationList = 97C146E91CF9000F007C117D /* Build configuration list for PBXProject "Ueno" */;[m
 			compatibilityVersion = "Xcode 9.3";[m
 			developmentRegion = en;[m
 			hasScannedForEncodings = 0;[m
[36m@@ -176,7 +176,7 @@[m
 			projectDirPath = "";[m
 			projectRoot = "";[m
 			targets = ([m
[31m-				97C146ED1CF9000F007C117D /* Runner */,[m
[32m+[m				[32m97C146ED1CF9000F007C117D /* Ueno */,[m
 			);[m
 		};[m
 /* End PBXProject section */[m
[36m@@ -516,7 +516,7 @@[m
 /* End XCBuildConfiguration section */[m
 [m
 /* Begin XCConfigurationList section */[m
[31m-		97C146E91CF9000F007C117D /* Build configuration list for PBXProject "Runner" */ = {[m
[32m+[m		[32m97C146E91CF9000F007C117D /* Build configuration list for PBXProject "Ueno" */ = {[m
 			isa = XCConfigurationList;[m
 			buildConfigurations = ([m
 				97C147031CF9000F007C117D /* Debug */,[m
[36m@@ -526,7 +526,7 @@[m
 			defaultConfigurationIsVisible = 0;[m
 			defaultConfigurationName = Release;[m
 		};[m
[31m-		97C147051CF9000F007C117D /* Build configuration list for PBXNativeTarget "Runner" */ = {[m
[32m+[m		[32m97C147051CF9000F007C117D /* Build configuration list for PBXNativeTarget "Ueno" */ = {[m
 			isa = XCConfigurationList;[m
 			buildConfigurations = ([m
 				97C147061CF9000F007C117D /* Debug */,[m
[1mdiff --git a/ios/Ueno.xcodeproj/xcshareddata/xcschemes/Runner.xcscheme b/ios/Ueno.xcodeproj/xcshareddata/xcschemes/Runner.xcscheme[m
[1mindex c87d15a..de1b67d 100644[m
[1m--- a/ios/Ueno.xcodeproj/xcshareddata/xcschemes/Runner.xcscheme[m
[1m+++ b/ios/Ueno.xcodeproj/xcshareddata/xcschemes/Runner.xcscheme[m
[36m@@ -15,9 +15,9 @@[m
             <BuildableReference[m
                BuildableIdentifier = "primary"[m
                BlueprintIdentifier = "97C146ED1CF9000F007C117D"[m
[31m-               BuildableName = "Runner.app"[m
[31m-               BlueprintName = "Runner"[m
[31m-               ReferencedContainer = "container:Runner.xcodeproj">[m
[32m+[m[32m               BuildableName = "Ueno.app"[m
[32m+[m[32m               BlueprintName = "Ueno"[m
[32m+[m[32m               ReferencedContainer = "container:Ueno.xcodeproj">[m
             </BuildableReference>[m
          </BuildActionEntry>[m
       </BuildActionEntries>[m
[36m@@ -31,9 +31,9 @@[m
          <BuildableReference[m
             BuildableIdentifier = "primary"[m
             BlueprintIdentifier = "97C146ED1CF9000F007C117D"[m
[31m-            BuildableName = "Runner.app"[m
[31m-            BlueprintName = "Runner"[m
[31m-            ReferencedContainer = "container:Runner.xcodeproj">[m
[32m+[m[32m            BuildableName = "Ueno.app"[m
[32m+[m[32m            BlueprintName = "Ueno"[m
[32m+[m[32m            ReferencedContainer = "container:Ueno.xcodeproj">[m
          </BuildableReference>[m
       </MacroExpansion>[m
       <Testables>[m
[36m@@ -54,9 +54,9 @@[m
          <BuildableReference[m
             BuildableIdentifier = "primary"[m
             BlueprintIdentifier = "97C146ED1CF9000F007C117D"[m
[31m-            BuildableName = "Runner.app"[m
[31m-            BlueprintName = "Runner"[m
[31m-            ReferencedContainer = "container:Runner.xcodeproj">[m
[32m+[m[32m            BuildableName = "Ueno.app"[m
[32m+[m[32m            BlueprintName = "Ueno"[m
[32m+[m[32m            ReferencedContainer = "container:Ueno.xcodeproj">[m
          </BuildableReference>[m
       </BuildableProductRunnable>[m
    </LaunchAction>[m
[36m@@ -71,9 +71,9 @@[m
          <BuildableReference[m
             BuildableIdentifier = "primary"[m
             BlueprintIdentifier = "97C146ED1CF9000F007C117D"[m
[31m-            BuildableName = "Runner.app"[m
[31m-            BlueprintName = "Runner"[m
[31m-            ReferencedContainer = "container:Runner.xcodeproj">[m
[32m+[m[32m            BuildableName = "Ueno.app"[m
[32m+[m[32m            BlueprintName = "Ueno"[m
[32m+[m[32m            ReferencedContainer = "container:Ueno.xcodeproj">[m
          </BuildableReference>[m
       </BuildableProductRunnable>[m
    </ProfileAction>[m
