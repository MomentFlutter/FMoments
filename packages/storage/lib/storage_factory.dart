import "package:flutter_secure_storage/flutter_secure_storage.dart";

import "secure_storage.dart";
import "storage.dart";
import "local_storage.dart";

class StorageFactory {
  static Storage getStorage({
    required bool isSecure,
    String? boxName,
  }) {
    if (isSecure)
      return SecureStorage(new FlutterSecureStorage());
    else
      return LocalStorage(boxName!);
  }
}
