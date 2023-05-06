# FMoments

This project target to finish a flutter application that looks like wechat moments as flutter practice.
Create from `Catalyst-UI-Flutter-Starter`
More info about `Catalyst-UI-Flutter-Starter`,please see: [https://neo.thoughtworks.net/catalogue/developer-tools/TDtIrhAB8e/Catalyst-UI-Flutter-Starter](https://neo.thoughtworks.net/catalogue/developer-tools/TDtIrhAB8e/Catalyst-UI-Flutter-Starter)

### Install
1. run `make list-devices`
2. choose device
3. run `make app/<DEVICE>`



### Melos
- Regenerate build files: `Melos Run -> build runner`
- Clean project: Melos Run -> `Clean Workspace`
---
## Catalyst's Wiki

## Table Of Contents

- [Introduction](#introduction)
- [Features](#features)
- [Upcoming Features](#upcoming-features)
- [Quick start](#quick-start)
- [Prerequisites](#prerequisites)
- [Getting Started](#getting-started)
- [Documentation](#documentation)
- [Architecture Decision Record](#adr)

## Introduction

- Flutter catalyst is an opinionated code structure along with recommended coding practices to spread common
  pattern and practices followed in the community.
- A decent local dev set up, CI/CD setup and detailed documentation for all the features.
- As part of version `2.0.0`, setup for E2E testing, Code Obfuscation with Proguard, Adopting to Material 3 Library along with few bug fixes has been done.
- Ready to use development and production environments setup.

**`Note:`** You can refer to the artifacts of previous release version `1.0.0` here - https://drive.google.com/file/d/1uVZyqzZ9U3t0g0i_Ai-rAgWmWNtOx-xQ/view?usp=share_link

## Features

1. Monorepo
2. Static code and analysis
   1. Flutter analyzer
   2. Commit hook
   3. Flutter format
   4. Talisman
3. Storage
   1. Hive storage
   2. Secure storage
   3. Common interfaces
   4. Factory pattern
4. Network
   1. Dio
   2. Abort controller
   3. Endpoint code generation
5. Testing
   1. Unit test
   2. Widget test
   3. Generating mocks
6. Routing
   1. AutoRoute
   2. Generate app routes
   3. Route guard
   4. Route wrapper
7. Localisation
8. Theming
9. DLS
10. Environment
11. CI/CD
    1. GitHub actions
    2. Deployment
12. Setup for E2E Testing
13. Code Obfuscation with Proguard
    1. Reduced apk size
    2. Faster boot time

## Upcoming Features
1. SSL Pinning
2. Crashlytics
3. Universal links support
4. Feature Toggle

## Packages

The project also includes the following custom packages:
1. storage: A custom package for managing local storage.
2. dls: A custom package for implementing design language systems.
3. network: A custom package for managing network requests.
4. config: A custom package for managing app configurations.
5. localization: A custom package for implementing localization support.

## Quick Start

### Prerequisites

- Flutter - 3.7.11
- Dart - 2.19.6
- Xcode - 13.4, iOS 15
- Cocoapods
- Android Studio and Android SDK(21-31)

Refer [Flutter environment setup](https://docs.flutter.dev/get-started/install) to setup all prerequisites (select Windows / MacOS and follow instructions according to your OS).

### Getting Started

1. For NEO users download the repo using `Download source code` button on top right.
2. Install melos
    ```shell
   flutter pub global activate melos 2.9.0
   ```
3. Install Dependencies
   To install flutter dependencies run the following commands

    ```shell
    flutter pub global run melos bootstrap
    ```

   or we can use make commands that are already configured

    ```shell
    make bootstrap
    ```
4. Get the list of devices
   This command will help to get list devices running the machine
    ```shell
    make list-devices
   ```
5. Run the app
   To Run the application, give the prefix of the device
    ```shell
   make app/<DEVICE PREFIX>
   ```
   Default Flavor and Build Type is development and debug respectively. We can change them by passing FLAVOR and B_TYPE
   in make command as follows:

    ```shell
    make app/<DEVICE PREFIX> FLAVOR=<FLAVOR> B_TYPE=<Build_Type>
    ```

**`Note:`** To perform various operations like format, test, analyze you can refer to [Makefile](Makefile).

### Credentials for login

Once application gets started, it renders the login page. Logging to the application using following credentials

  ```
  User Id : derek
  Password : jklg*_56
  ```
NOTE: Check the right corner of the `Appbar` to change the `Language and Theme`.

## Documentation

- [Monorepo](docs/monorepo/monorepo.md)
- [CI/CD](docs/cicd)
  - [CD for IOS](docs/cicd/CD-IOS.md)
  - [CD for android](docs/cicd/CD-ANDROID.md)
- [Config management](docs/config/README.md)
- [Tools](docs/tools/README.md)
- [Storage](docs/storage/README.md)
- [Code Obfuscation with Proguard](docs/obfuscation/proguard.md)
- [Integration Testing E2E](docs/e2e/integration_test.md)

**`Observations on E2E Setup:`**
- As we have basic setup for integration test, we have not setup workflows for it. User can setup integration pipeline according to the requirement.
- As observed during running integration test on pipeline, there is complication to get stable Device configuration. Somehow it works with Android 11(most stable with Pixel 2 api 30). Upgraded version of devices give different issues in test cases.
- Test cases behaves flaky and gives error "Bad state: No element", but issue gets resolve when use certain time delay. (pump() and pumpAndSettle).

## ADR

Please refer [decisions](docs/decisions) folder to learn more about our tech choices and more detailed comparisons.

**`Note:`**
For security reasons we have deleted google-service.json and GoogleService-Info.plist file from the project.

If there is need of push notification and other things that required firebase usages. We need to add google-service.json and GoogleService-Info.plist files in native layer to set firebase sdk.
For more information you refer Firebase SDK setup documentation (docs/firebase_sdk_setup/firebase_sdk_setup.md).
