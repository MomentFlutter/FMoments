For security reasons we have deleted google-service.json and GoogleService-Info.plist file from the project.

If there is need of push notification and other things that required firebase usages. We need to add
google-service.json and GoogleService-Info.plist files in native layer to set firebase sdk.

- Setup of Firebase sdk:

1. Create project on firebase
2. Register app on firebase for iOS and android.
3. Download and then add config file inside native layer. For android google-service.json file should be added inside project/android/app and for iOS add GoogleService-Info.plist file inside project/ios/Runner/
4. Add firebase SDK in project by adding following plug-in:

Root-level(project level) Gradle file(project/build.gradle)
```
dependencies {
classpath 'com.google.gms:google-services:4.3.15'
}
```
Module(app-level) Gradle file(project/app/build.gradle)
```
apply plugin: 'com.google.gms.google-services'

dependencies {
implementation platform('com.google.firebase:firebase-bom:31.3.0')
implementation 'com.google.firebase:firebase-analytics-ktx'
}
```

Note: We also need to upgrade minSdkVersion to 21 inside Module(app-level) Gradle file (project/app/build.gradle).
