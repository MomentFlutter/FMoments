import "package:auto_route/auto_route.dart";
import "package:flutter/material.dart";

import "../presentation/moments/moments.dart";

part "routes.gr.dart";

@MaterialAutoRouter(
  routes: <AutoRoute>[
    AutoRoute(page: Moments, path: "/moments", initial: true)
  ],
)
// extend the generated private router
class AppRouter extends _$AppRouter {
  AppRouter();
}
