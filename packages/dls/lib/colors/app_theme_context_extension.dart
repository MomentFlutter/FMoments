import "package:flutter/material.dart";

import "../theme/app_theme.dart";
import "app_color.dart";
import "app_colors.dart";

extension AppThemeContextExtension on BuildContext {
  Color getColor(AppColor key) {
    return AppThemeWrapper().getColor(key);
  }

  bool get isDark => AppThemeWrapper().isDarkTheme();
}

class AppThemeWrapper {
  AppThemeWrapper();

  Color getColor(AppColor key) {
    return _themeColorsMap[AppTheme.currentTheme][key];
  }

  bool isDarkTheme() {
    return AppTheme.currentTheme == ThemeMode.dark;
  }

  final Map<ThemeMode, dynamic> _themeColorsMap = {
    ThemeMode.dark: {
      AppColor.TRANSPARENT: AppColors.transparent,
      AppColor.WHITE: AppColors.white,
      AppColor.BLACK: AppColors.black,
      AppColor.SUCCESS: AppColors.success,
      AppColor.WARNING: AppColors.warning,
      AppColor.ERROR: AppColors.error,
      AppColor.OUTLINE: AppColors.divider,
      AppColor.TEXT_BOX_OUTLINE: AppColors.textBoxOutline,
      AppColor.DIVIDER_FILL: AppColors.dividerFill,
      AppColor.BACKGROUND_COLOR: AppColors.backgroundDark,
      AppColor.PRIMARY: AppColors.primaryDark,
      AppColor.SECONDARY: AppColors.secondaryDark,
      AppColor.LABEL_TEXT: AppColors.labelTextDark,
      AppColor.BODY_TEXT: AppColors.bodyTextDark,
      AppColor.HEADLINE_TEXT: AppColors.headlineTextDark,
      AppColor.TITLE_TEXT: AppColors.titleTextDark,
      AppColor.HINT_TEXT: AppColors.hintTextDark,
      AppColor.DOT_INDICATOR: AppColors.dotIndicatorDark,
      AppColor.NAVBAR: AppColors.navbarDark,
      AppColor.ICON_1: AppColors.icon1Dark,
      AppColor.ICON_2: AppColors.icon2Dark,
    },
    ThemeMode.light: {
      AppColor.TRANSPARENT: AppColors.transparent,
      AppColor.WHITE: AppColors.white,
      AppColor.BLACK: AppColors.black,
      AppColor.SUCCESS: AppColors.success,
      AppColor.WARNING: AppColors.warning,
      AppColor.ERROR: AppColors.error,
      AppColor.OUTLINE: AppColors.divider,
      AppColor.TEXT_BOX_OUTLINE: AppColors.textBoxOutline,
      AppColor.DIVIDER_FILL: AppColors.dividerFill,
      AppColor.BACKGROUND_COLOR: AppColors.backgroundDark,
      AppColor.PRIMARY: AppColors.primaryDark,
      AppColor.SECONDARY: AppColors.secondaryDark,
      AppColor.LABEL_TEXT: AppColors.labelTextDark,
      AppColor.BODY_TEXT: AppColors.bodyTextDark,
      AppColor.HEADLINE_TEXT: AppColors.headlineTextDark,
      AppColor.TITLE_TEXT: AppColors.titleTextDark,
      AppColor.HINT_TEXT: AppColors.hintTextDark,
      AppColor.DOT_INDICATOR: AppColors.dotIndicatorDark,
      AppColor.NAVBAR: AppColors.navbarDark,
      AppColor.ICON_1: AppColors.icon1Dark,
      AppColor.ICON_2: AppColors.icon2Dark,
    }
  };
}
