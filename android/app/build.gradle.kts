/* Dummy gradle.kts file to test version bumps, it isn't used and doesn't actually work */

@Suppress("DSL_SCOPE_VIOLATION")
plugins {
  alias(libs.plugins.kotlin.multiplatform)
  alias(libs.plugins.android.application)
  alias(libs.plugins.compose)
  alias(libs.plugins.ksp)
  alias(libs.plugins.bugsnag)
  alias(libs.plugins.kotlin.compose)
}

kotlin {
  jvmToolchain(20)

  androidTarget()
}

android {
  compileSdk = libs.versions.android.sdk.compile.get().toInt()
  namespace = "com.tramline.ueno"

  sourceSets["main"].manifest.srcFile("src/androidMain/AndroidManifest.xml")

  defaultConfig {
    applicationId = "com.tramline.ueno"
    minSdk = libs.versions.android.sdk.min.get().toInt()
    targetSdk = libs.versions.android.sdk.target.get().toInt()

    versionCode =
      if (project.properties["VERSION_CODE"] != null) {
        (project.properties["VERSION_CODE"] as String).toInt()
      } else {
        1
      }

    versionName = "1.9.0"
  }

  compileOptions { isCoreLibraryDesugaringEnabled = true }

  signingConfigs {
    create("release") {
      versionName = 1.0.0
      storeFile = file("$rootDir/release/reader.jks")
      storePassword = "${project.properties["READER_KEYSTORE_PASSWORD"]}"
      keyAlias = "reader_alias"
      keyPassword = "${project.properties["READER_KEY_PASSWORD"]}"
    }
  }

  buildTypes {
    release {
      isMinifyEnabled = true
      isShrinkResources = true
      signingConfig = signingConfigs.getByName("release")

      proguardFiles(getDefaultProguardFile("proguard-android-optimize.txt"), "proguard-rules.pro")
    }
    debug { applicationIdSuffix = ".debug" }
  }

  packaging { resources { excludes.add("/META-INF/{AL2.0,LGPL2.1}") } }

  buildFeatures { buildConfig = true }
}

dependencies {
  debugImplementation(libs.leakcanary)

  implementation(project(":shared"))
  implementation(libs.kotlininject.runtime)
  ksp(libs.kotlininject.compiler)
  implementation(libs.androidx.work)
  coreLibraryDesugaring(libs.desugarJdk)
  implementation(libs.kotlinx.datetime)
  implementation(libs.bugsnag)
}
