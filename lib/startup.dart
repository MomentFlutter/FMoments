import "package:config/config.dart";
import "package:flutter/material.dart";
import "package:storage/storage.dart";
import "my_app.dart";

void startup() async {
  await initHive();
  await createBox("catalyst");

  String env = const String.fromEnvironment("ENV", defaultValue: "local");
  await initConfig(env);

  runApp(MyApp());
}
