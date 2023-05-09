// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************
//
// ignore_for_file: type=lint

part of 'routes.dart';

class _$AppRouter extends RootStackRouter {
  _$AppRouter([GlobalKey<NavigatorState>? navigatorKey]) : super(navigatorKey);

  @override
  final Map<String, PageFactory> pagesMap = {
    MomentsRoute.name: (routeData) {
      return MaterialPageX<dynamic>(
        routeData: routeData,
        child: Moments(),
      );
    }
  };

  @override
  List<RouteConfig> get routes => [
        RouteConfig(
          '/#redirect',
          path: '/',
          redirectTo: '/moments',
          fullMatch: true,
        ),
        RouteConfig(
          MomentsRoute.name,
          path: '/moments',
        ),
      ];
}

/// generated route for
/// [Moments]
class MomentsRoute extends PageRouteInfo<void> {
  const MomentsRoute()
      : super(
          MomentsRoute.name,
          path: '/moments',
        );

  static const String name = 'MomentsRoute';
}
