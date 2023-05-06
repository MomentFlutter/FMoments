import "package:auto_route/auto_route.dart";
import "package:flutter/material.dart";

import "../presentation/home.dart";
import "../presentation/login.dart";

part "routes.gr.dart";

@MaterialAutoRouter(
  routes: <AutoRoute>[
    AutoRoute(page: Login, path: "/login", initial: true),
    AutoRoute(
      page: Home,
      path: "/home",
    )
  ],
)
// extend the generated private router
class AppRouter extends _$AppRouter {
  AppRouter();
}
