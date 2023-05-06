import "package:flutter/material.dart";
import "package:flutter_test/flutter_test.dart";
import "package:integration_test/integration_test.dart";
import "package:flutter_starter/main.dart" as app;

class Initialize {
  static void main() {
    IntegrationTestWidgetsFlutterBinding.ensureInitialized().framePolicy =
        LiveTestWidgetsFlutterBindingFramePolicy.fullyLive;
    app.main();

    WidgetsFlutterBinding.ensureInitialized();
  }
}
