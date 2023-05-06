import "package:auto_route/auto_route.dart";
import "package:dls/widgets/change_language_widget.dart";
import "package:dls/widgets/change_theme_button_widget.dart";
import "package:flutter/material.dart";
import "package:flutter_bloc/flutter_bloc.dart";
import "package:localization/language_translate.dart";
import "package:network/endpoints/login_api.dart";
import "package:provider/provider.dart";
import "package:storage/storage_factory.dart";

import "../cubit/login_user_cubit.dart";
import "../navigation/routes.dart";
import "../network/client.dart";
import "../repository/login_repository.dart";
import "../utilities/system_provider.dart";

class Login extends StatefulWidget implements AutoRouteWrapper {
  @override
  State<Login> createState() => _LoginState();

  final LoginRepository loginRepository = LoginRepository(
    StorageFactory.getStorage(isSecure: false, boxName: "catalyst"),
    StorageFactory.getStorage(
      isSecure: true,
    ),
    LoginApi(DioClient().dio),
  );

  @override
  Widget wrappedRoute(BuildContext context) {
    return BlocProvider(
      create: (context) => LoginUserCubit(
        loginRepository,
      ),
      child: Login(),
    );
  }
}

class _LoginState extends State<Login> {
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final userIdController = TextEditingController();
  final passwordController = TextEditingController();

  void onLogin(BuildContext context) {
    if (_formKey.currentState!.validate()) {
      var navigator = AutoRouter.of(context);
      context
          .read<LoginUserCubit>()
          .loginUser(userIdController.text, passwordController.text)
          .then(
            (value) => navigator.push(
              HomeRoute(),
            ),
          );
    }
  }

  @override
  Widget build(BuildContext context) {
    SystemProvider systemProvider = Provider.of<SystemProvider>(context);
    TextTheme _textTheme = Theme.of(context).textTheme;
    return BlocBuilder<LoginUserCubit, LoginUserState>(
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            actions: [
              ChangeLanguageWidget(systemProvider.changeLanguage),
              ChangeThemeButtonWidget(systemProvider.toggleTheme),
            ],
            automaticallyImplyLeading: false,
            title: Text(
              getTranslated(context, "login") as String,
            ),
          ),
          body: () {
            if (state is LoginUserLoading) {
              return Center(child: const CircularProgressIndicator());
            } else if (state is LoginUserError) {
              CircularProgressIndicator();
              return Text("Something went wrong");
            } else {
              return Padding(
                padding: const EdgeInsets.all(15.0),
                child: Form(
                  key: _formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      TextFormField(
                        key: ValueKey("user_id_field"),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "Please Enter User Name";
                          } else if (value.length <= 2) {
                            return "Invalid User Name";
                          }
                          return null;
                        },
                        controller: userIdController,
                        decoration: InputDecoration(
                          enabledBorder: UnderlineInputBorder(),
                          labelStyle: _textTheme.titleLarge,
                          labelText:
                              getTranslated(context, "user_id") as String,
                        ),
                        autofocus: true,
                      ),
                      TextFormField(
                        key: ValueKey("password_field"),
                        obscureText: true,
                        enableSuggestions: false,
                        autocorrect: false,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "Please Enter Password";
                          } else if (value.length <= 2) {
                            return "Invalid Password";
                          }
                          return null;
                        },
                        controller: passwordController,
                        decoration: InputDecoration(
                          labelStyle: _textTheme.titleLarge,
                          labelText:
                              getTranslated(context, "password") as String,
                        ),
                      ),
                      ElevatedButton(
                        key: ValueKey("login_button"),
                        onPressed: () => onLogin(context),
                        child: Text(getTranslated(context, "login") as String),
                      ),
                    ],
                  ),
                ),
              );
            }
          }(),
        );
      },
    );
  }
}
