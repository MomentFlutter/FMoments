// import "package:auto_route/auto_route.dart";
// import "package:network/endpoints/login_api.dart";
// import "package:storage/storage_factory.dart";
// import "../../network/client.dart";
// import "../../repository/login_repository.dart";
// import "../app_routes.dart";
//
// class IsUserLogin extends AutoRouteGuard {
//   @override
//   void onNavigation(NavigationResolver resolver, StackRouter router) async {
//     LoginRepository loginRepository = LoginRepository(
//       StorageFactory.getStorage(isSecure: false, boxName: "catalyst"),
//       StorageFactory.getStorage(isSecure: true),
//       LoginApi(DioClient().dio),
//     );
//     var user = await loginRepository.getLoggedInUser();
//     if (user.username != null && user.token != null) {
//       resolver.next();
//     } else {
//       router.pushNamed(AppRoutes.LOGIN.getString());
//     }
//   }
// }
