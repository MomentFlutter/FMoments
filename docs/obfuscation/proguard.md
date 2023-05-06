## Proguard Documentation

In modern app development, libraries are often used to speed up development, but they can introduce unnecessary classes or functions that our app doesn't need. 

ProGuard helps to remove these unnecessary chunks of code. With ProGuard, we can shrink, obfuscate, and optimize our Flutter app, making it a valuable addition to our development toolkit.

### Benefits Offered:

1. **Code shrinking:** It removes unused classes, debug-time code, unused resources, and library dependencies from our app, resulting in a smaller code size. This process is also known as the Tree shaking mechanism.

2. **Obfuscation:** ProGuard changes the names of classes to shorter and harder-to-understand names, making it difficult to decompile and understand the code flow. This helps protect our code from reverse engineering, and also reduces the size of _DEX_ (Dalvik Executable) files.

3. **Optimization:** ProGuard removes dead or unused code from our source code, such as removing code for unused branches in if/else statements. This helps optimize our app by reducing unnecessary code and improving performance.

### Profile/Debug APK:

After generating APK file in release mode, open Android Studio `File > Profile or Debug APK > Select the generated APK file`
Look for the `classes.dex` file(s), where compiled 3rd party dependencies can be seen. These will be obfuscated/non-readable if ProGuard is enabled.


### How to enable Proguard:

1. Go to `android/app/build.gradle` and set `minifyEnabled true` in the release buildType:

    ```
    release {
      signingConfig signingConfigs.release

      debuggable false
      shrinkResources true
      zipAlignEnabled true

      minifyEnabled true
      proguardFiles getDefaultProguardFile("proguard-android.txt"), "proguard-rules.pro"
    }
    ```

    `getDefaultProguardFile("proguard-android.txt")` refers to the default ProGuard rules file provided by the Android SDK, which is commonly used for most Android apps. The `"proguard-rules.pro"` refers to any additional ProGuard rules file that we might want to add.

2. To protect Flutter files during obfuscation, add the following lines inside our proguard-rules file:

    ```
    # Flutter Wrapper
    -keep class io.flutter.app.** { *; }
    -keep class io.flutter.plugin.**  { *; }
    -keep class io.flutter.util.**  { *; }
    -keep class io.flutter.view.**  { *; }
    -keep class io.flutter.**  { *; }
    -keep class io.flutter.plugins.**  { *; }
    ```

3. It is important to add package dependencies like Firebase's classes to the ProGuard rules file to exclude them from obfuscation, as obfuscating these classes can cause issues with their functionality.

    ```
    # Firebase Android SDK 2.0.0+
    -keep class com.firebase.** { *; }
    -keep class org.apache.** { *; }
    -keepnames class com.fasterxml.jackson.** { *; }
    -keepnames class javax.servlet.** { *; }
    -keepnames class org.ietf.jgss.** { *; }
    -dontwarn org.apache.**
    -dontwarn org.w3c.dom.**
    -keep class com.google.android.gms.auth.api.** { *; }
    -keep class com.google.firebase.** { *; }
    ```

4. When using ProGuard, runtime annotations or type information of parameters and exceptions may be removed from our code during obfuscation. This can potentially cause issues with libraries that rely on runtime annotations for functionality, such as Room, which is an ORM library for SQLite in Android. Room uses runtime annotations to generate SQL queries and perform database operations at runtime. Therefore, it's important to configure ProGuard to exclude Room's runtime annotations from obfuscation using appropriate rules in the ProGuard configuration file to ensure Room works correctly in our app.


    ```
    #Runtime Annotations
    -keepattributes *Annotation*, Signature, Exception
    ```
### App Sizing Stats

| Property | Without Obfuscation | With Obfuscation |
|----------|----------|----------|
| APK Size | 23.5 MB | 20.7 MB |
| Download Size | 23.3 MB | 20.6 MB |

### References:
- [Code Obfuscation in Flutter Android](https://bootcamp.uxdesign.cc/code-obfuscation-in-flutter-android-cb9fb7f546ba)
- [Use of ProGuard in the Flutter App](https://articles.wesionary.team/use-of-proguard-in-the-flutter-app-289cd7b31a18)
- [Practical ProGuard Rules Examples](https://medium.com/androiddevelopers/practical-proguard-rules-examples-5640a3907dc9)
- [ProGuard Firebase Rules for AndroidChat App](https://github.com/googlearchive/AndroidChat/blob/master/app/proguard-rules.pro)