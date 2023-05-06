# CD for android

- [Release Workflow for Android](#release-workflow-for-android)
  - [Tools](#tools)
  - [Signing apps for beta release](#signing-apps-for-beta-release)
  - [Steps in release workflow](#steps-in-release-workflow)
[comment]: <> (  - [Fastlane and Firebase setup]&#40;#fastlane-and-firebase-setup&#41;)
  - [Secret/Env required](#secretenv-required)
  - [Version bumping in Android](#version-bumping-in-android)
[comment]: <> (  - [Tips]&#40;#tips&#41;)

## Release Workflow for Android

#### Tools

- [fastlane](https://docs.fastlane.tools/) (To distribute artifacts to the firebase app distribution)
- ruby bundler (To install all dependency actions of fastlane)
- gradle (Installed by default on Github's Ubuntu image)

#### Signing apps for beta release

Before your application binary is uploaded to "Google Play/Firebase App Distribution", it needs to be signed with an upload key. This upload key is a digitally signed certificate which helps in preventing anyone to tamper with your apps.

- To know why we need signing key, please refer [here](https://stackoverflow.com/questions/23906799/why-should-i-sign-my-apk-before-releasing-to-playstore)
- Steps to create a signing key and sign an application binary can be found [here](https://medium.com/@prashant.bedi/signing-android-apk-using-jks-b1cbf955b5f)
- These are the environment variables are required to sign the app. `SIGNING_KEYSTORE_PATH`, `SIGNING_KEYSTORE_PASSWORD`, `SIGNING_KEY_ALIAS`, `SIGNING_KEY_PASSWORD`. These are exported in github actions file.
- Please refer [build.gradle](../../android/app/build.gradle)'s `signingConfigs` sections.

#### Steps in release workflow

- Refer [release workflow](../../.github/workflows/release_android.yml)
- Before the actual deployment, we need to run the static-checks and test cases so we run [CI Workflow](../../.github/workflows/ci.yml) as a dependency.
- Install all the tools mentioned above.
- Cache all the dependencies from ruby, gradle and gradle wrapper. This is useful for faster builds.
- Setting up the secrets, read more about it in [secrets section](#secretenv-required).
- Read more about how we implemented version bumping for releases, refer [version bumping](#version-bumping-in-android)
- Distributing the artifact(.apk) to Firebase app distribution. Please refer [Fastfile](../../android/fastlane/Fastfile)
[comment]: <> (- and [firebase setup]&#40;#fastlane-and-firebase-setup&#41;)

### Secret/Env required

- All the below environment variables are set in github secrets.
  ```bash
  SIGNING_KEY_ALIAS #alias for above .keystore file
  SIGNING_KEY_PASSWORD #password for above .keystore file
  SIGNING_KEYSTORE_PATH=upload-key.jks
  SIGNING_KEYSTORE_PASSWORD APP_UPLOAD_KEY_ALIAS #alias keyname for signing key
  FIREBASE_CLI_TOKEN #credentials to distribute apk to firebase
  FIREBASE_APP_ID #unique application ID specific to app created on firebase `
  RELEASE_BUILD_NUMBER #GITHUB_RUN_NUMBER which increments on each pipeline run
  RELEASE_VERSION #release version taken as github input
  RELEASE_NOTES #release notes taken as github input
  SELECTED_FLAVOR #release flavor for your apk

  ```
- The `APP_UPLOAD_SIGNING_KEYSTORE` should be decoded by following above mentioned process. Please check step `Setup secrets` in [release-android.yaml](../../.github/workflows/release_android.yml)

### Version bumping in Android

- There are two versions, that needs to increased. One is versionCode(build number) and versionName(release number). These properties are present in `build.gradle` file.
- An artifact can be created with provided properties using fastlane `gradle` action (`build.gradle` is not updated)
- `versionCode (RELEASE_BUILD_NUMBER)` is incremented automatically using the current build number(GITHUB_RUN_NUMBER) provided by github, this is unique and is always increasing.
- `versionName (RELEASE_VERSION)` is passed as an input parameter from github actions before triggering the workflow.
- Release notes can be passed as input parameter in github worflow run.

Read more : [Increment Version and Build Numbers with fastlane](https://spin.atomicobject.com/2022/02/10/version-fastlane/)
