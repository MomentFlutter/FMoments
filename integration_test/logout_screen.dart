import "package:flutter/foundation.dart";
import "package:flutter/material.dart";
import "package:flutter/widgets.dart";
import "package:flutter_test/flutter_test.dart";

class LogoutScreen {
  final logoutButton = find.byKey(const ValueKey("logout_button"));

  Future<LogoutScreen> clickOnLogout(
    WidgetTester tester,
  ) async {
    await tester.tap(logoutButton);
    return this;
  }
}
