import "package:flutter/material.dart";
import "package:flutter_test/flutter_test.dart";

import "initialize.dart";
import "moments_screen.dart";

void main() {
  MomentsScreen momentsScreen;

  testWidgets("SliverAppBar collapses when ListView is scrolled",
      (widgetTester) async {
    momentsScreen = MomentsScreen();
    Initialize.main();
    await widgetTester.pumpAndSettle(Duration(seconds: 5));

    expect(find.byType(SliverAppBar), findsOneWidget);

    await momentsScreen.scrollList(widgetTester);

    await widgetTester.pumpAndSettle(Duration(seconds: 2));

    expect(find.byType(SliverAppBar), findsNothing);
  });
}
