import "package:flutter/material.dart";

import "app_asset.dart";
import "app_assets.dart";

extension AppAssetContextExtension on BuildContext {
  String? getAsset(AppAsset key) {
    return AppThemeWrapper(this).getAsset(key);
  }
}

class AppThemeWrapper {
  late BuildContext context;

  AppThemeWrapper(this.context);

  String? getAsset(AppAsset key) {
    return _assetsMap[key];
  }

  final Map<AppAsset, String> _assetsMap = {
    AppAsset.LOGO: AppAssets.logo,
  };
}
