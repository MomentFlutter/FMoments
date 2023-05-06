import "package:flutter_test/flutter_test.dart";
import "initialize.dart";
import "login_screen.dart";
import "logout_screen.dart";

void main() {
  LoginScreen loginScreen;
  LogoutScreen logoutScreen;

  String userName = "derek";
  String password = "jklg*_56";

  testWidgets("should check login and logout flow",
      (WidgetTester tester) async {
    loginScreen = LoginScreen();
    logoutScreen = LogoutScreen();

    Initialize.main();

    await tester.pumpAndSettle(Duration(seconds: 1));
    await loginScreen.enterUserName(tester, userName);
    expect(find.text("Login"), findsNWidgets(2));
    await loginScreen.enterPassword(tester, password);
    expect(find.text("Password"), findsOneWidget);
    await loginScreen.login(tester);
    await tester.pumpAndSettle(Duration(seconds: 1));
    await logoutScreen.clickOnLogout(tester);
    await tester.pumpAndSettle(Duration(seconds: 1));

    expect(find.text("User ID"), findsOneWidget);
  });
}
