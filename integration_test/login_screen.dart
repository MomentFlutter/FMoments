import "package:flutter/foundation.dart";
import "package:flutter/material.dart";
import "package:flutter/widgets.dart";
import "package:flutter_test/flutter_test.dart";

class LoginScreen {
  final loginButton = find.byKey(const ValueKey("login_button"));
  final passwordField = find.byKey(const ValueKey("password_field"));
  final userIdField = find.byKey(const ValueKey("user_id_field"));

  Future<LoginScreen> enterUserName(
    WidgetTester tester,
    String userName,
  ) async {
    await tester.enterText(userIdField, userName);
    return this;
  }

  Future<LoginScreen> enterPassword(
    WidgetTester tester,
    String password,
  ) async {
    await tester.enterText(passwordField, password);
    return this;
  }

  Future<LoginScreen> login(
    WidgetTester tester,
  ) async {
    await tester.tap(loginButton);
    return this;
  }
}
