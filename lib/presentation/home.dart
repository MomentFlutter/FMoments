import "package:dls/widgets/change_language_widget.dart";
import "package:dls/widgets/change_theme_button_widget.dart";
import "package:dls/widgets/secondary_elevated_button.dart";
import "package:flutter/material.dart";
import "package:localization/language_translate.dart";
import "package:provider/provider.dart";

import "../utilities/system_provider.dart";

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SystemProvider systemProvider = Provider.of<SystemProvider>(context);
    return Scaffold(
      appBar: AppBar(
        actions: [
          ChangeLanguageWidget(systemProvider.changeLanguage),
          ChangeThemeButtonWidget(systemProvider.toggleTheme),
        ],
        automaticallyImplyLeading: false,
        title: Text(
          getTranslated(context, "home") as String,
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "Welcome to our sample application!",
            style: Theme.of(context).textTheme.titleLarge,
          ),
          Container(
            alignment: Alignment.center,
            child: SecondaryElevatedButton.stretched(
              key: ValueKey("logout_button"),
              // onPress: () {
              //   var navigator = AutoRouter.of(context);
              //   navigator.push(LoginRoute());
              // },
              child: Text(getTranslated(context, "logout") as String),
            ),
          ),
        ],
      ),
    );
  }
}
