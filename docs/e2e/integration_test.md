# Integration testing (E2E)

There are three types of tests that Flutter supports. 
- A unit test verifies the behavior of a method or class. 
- A widget test verifies the behavior of Flutter widgets without running the app itself. 
- An integration test (also called end-to-end testing or GUI testing) runs the full app.

- [Overview](#overview)
- [Integration test package](#integration_test)
- [Advantages](#advantages)
- [Setup](#setup)
- [Run Integration tests](#run-integration-tests)

## Overview
-  The goal to use integration test is to verify that all the widgets and services being tested work together as expected. Furthermore, you can use integration tests to verify your app’s performance
- A typical integration test runs the actual app in an automated fashion and simulates the user interacting with the app.

#### integration_test
- For our flutter project we are using `integration_test` package for integration testing.
- Integration testing package is part of Flutter sdk itself.

#### Integration test uses following steps:

- Add the `integration_test` and `flutter_test` dependency.
- Create the test files.
- Write the integration test.
- Run the integration test.

## Advantages
- Integration testing provides compatibility with the flutter drive command, for running tests on a physical device or emulator.
- Run directly on the target device, allowing you to test on multiple Android or iOS devices using Firebase Test Lab.
- It also gives Compatibility with flutter_test APIs, enabling tests to be written in a similar style as widget tests

## Setup

- Add integration_test and flutter_test to your pubspec.yaml file under dev_dependencies section.
```
flutter_test:
    sdk: flutter

integration_test:
    sdk: flutter
```
## Run Integration tests
Run following command to run integration test cases:
```
 make integration-test
```
*NOTE: Make sure Emulator or device is Running*