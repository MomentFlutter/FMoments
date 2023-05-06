# Storage

- [Storage](#storage)
  - [Overview](#overview)
  - [Dependencies](#dependencies)
  - [Interface Exposed Methods](#interface-exposed-methods)

## Overview

In flutter there are two types of storage options available, Secured and Local.

- Secured storage:
Secure storage is implemented using `Flutter Secure Storage`. `Keychain` is used in iOS and KeyStore based solution is used in Android.

- Local storage:
Flutter provides many local storage options to choose from like shared_preferences, sqflite, and hive.

For Local storage we are using Hive. Hive is a fast and secure local database with no native dependencies that also runs on Flutter web.
Hive is a lightweight and fast key-value database solution that is cross-platform (runs on mobile, desktop, and web) and is written in pure Dart. .

## Dependencies

- [flutter_secure_storage](https://pub.dev/packages/flutter_secure_storage) (Secure Storage)
- [Hive](https://pub.dev/packages/hive) (Local Storage)

## Interface Exposed Methods

- `setItem({required String key, required String value})`
- `Future<String?> getItem({required String key})`
- `Future<Map<String, String>?> getAllItem()`
- `void deleteItem({required String key})`
- `void clear()`
