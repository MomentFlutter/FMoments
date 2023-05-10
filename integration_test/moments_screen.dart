import "package:flutter_test/flutter_test.dart";
import "package:flutter/widgets.dart";

class MomentsScreen {
  final momentsList = find.byKey(const ValueKey("moments_list"));

  Future<MomentsScreen> scrollList(WidgetTester tester) async {
    await tester.drag(momentsList, Offset(0.0, -200.0));
    return this;
  }
}
