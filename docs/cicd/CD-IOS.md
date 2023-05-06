# CD for IOS

## Release work flow IOS

Tools

- Flutter
- [flastlane](https://docs.fastlane.tools/) (To distribute artifacts to the firebase app
  distribution)
- ruby bundler (To install all dependency actions of fastlane)
- Xcode 13.4 (set the version for xcode on GitHub's mac-os image)

### Signing IOS apps

Signing your app assures users that it is from a known source and the app hasn’t been modified since
it was last signed. Before your app can integrate app services, be installed on a device, or be
submitted to the App Store, it must be signed with a certificate issued by Apple

To know more about signing the ios app - iOS Code Signing, Development and Distribution Provisioning
Profiles explained

A full guide is available on the fastlane doc, describing the best approaches for your code signing
process.

### Fastlane match

match creates all required certificates & provisioning profiles and stores them in a separate git
repository, Google Cloud, or Amazon S3. Every team member with access to the selected storage can
use those credentials for code signing.

More details - [Fastlane tools](https://docs.fastlane.tools/actions/match/)

Flutter Starter kit decisions for ios app signing

1. To setup provisioning profile, we are creating a private GIT repo.
2. We have got access to Apple Developer Program Enterprise (ADPE)
3. For distribution, we are using adhoc profile (needs device to be whitelisted on ADP/ADPE)
4. Using firebase cli token for authentication

### Steps in release workflow

1. Setup fastlane for ios
2. Create separate keychain to store signing certificates and provisioning profiles
3. Fetch the certificates and provisioning profiles from private git repo. Setup Deploy keys in the
   git private repo for ssh authentication.
4. Build the ipa . Building the release ipa locally needs some changes for signing.
5. Distribute it to firebase using firebase cli token.
   Refer the fastfile for more details - [Fastfile](../../apps/ui/ios/fastlane/Fastfile)

### Fastlane setup

Refer this article to setup fastlane match
setup : [IOS Fastlane](https://litoarias.medium.com/continuous-delivery-for-ios-using-fastlane-and-github-actions-edf62ee68ecc)

- Create the `fastlane` folder in iOS folder, and then create the `Fastfile`.
- Run following command to add gem file of distribution type in iOS folder

```
 fastlane add_plugin firebase_app_distribution
```

- Run following command to create the bundle id and app in ADPE

```
 fastlane produce create -i
```

- Create a private git repo to store cert
- Run the following in your project folder to start using match:

```
fastlane match init
```

- Use git and provide the private git repo URL.
  Passphrase (Git Repo storage only)
  When running match for the first time on a new machine, it will ask you for the passphrase for the Git repository.
  This
  is an additional layer of security: each of the files will be encrypted using openssl. Make sure to remember the
  password, as you'll need it when you run match on a different machine.
  To set the passphrase to decrypt your profiles using an environment variable (and avoid the prompt) use MATCH_PASSWORD
  You can easily migrate to another storage. Steps are mentioned in the official doc
- A Matchfile will be created. Open it and change the profile type (e.g. appstore, adhoc) and add your Apple developer
  account under username.
- Add following line in `fastfile` to match app identifier

```
  platform :ios do
    desc 'Fetch certificates and provisioning profiles'
   lane :certificates do
      match(app_identifier: '<app identifier>') #### (change the name of app_identifier with your bundle identifier)
     end
   end
```

NOTE : To get the [identifier list](https://developer.apple.com/account/resources/identifiers/list)

- To set up the certificates and provisioning profiles on a new machine, you just run the command

```
fastlane match adhoc
```

You will need bundle idetifier handy. Run the above command only once initially to create the certificate and profile.

You can also run match in a readonly mode to be sure it won't create any new certificates or profiles.

```
fastlane match adhoc -a << BUNDLE_IDENTIFIER >> --readonly
```

- It is recommended to create separate keychain for storing signing certificates and profiles. Fastlane action for doing
  so.

### Firebase setup

To distribute IOS app to firebase app distribution follow this
guide [Firebase iOS app distribution using fastlane](https://firebase.google.com/docs/app-distribution/ios/distribute-fastlane)

### Environment variables required

- Below is the list of environment variables. Some of them are set in github secrets and some are taken as github input.

```
iOS app signing secrets :
MATCH_PASSWORD #passphrase to access the private git repo
MATCH_GIT_PRIVATE_KEY #ssh private key file for ssh authentication to private git repo
KEYCHAIN_PASSWORD #password for keychain to store certs and profiles

Firebase config secrets:
FIREBASE_CLI_TOKEN #credentials to distribute apk to firebase

BUNDLE_VERSION #GITHUB_RUN_NUMBER which increments on each pipeline run
BUNDLE_SHORT_VERSION #release version taken as github input
RELEASE_NOTES # release notes taken as github input
```
