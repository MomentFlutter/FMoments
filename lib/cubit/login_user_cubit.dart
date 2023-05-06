import "package:equatable/equatable.dart";
import "package:flutter_bloc/flutter_bloc.dart";
import "../model/auth_data.dart";
import "../repository/login_repository.dart";
part "login_user_state.dart";

class LoginUserCubit extends Cubit<LoginUserState> {
  late final LoginRepository loginRepository;

  LoginUserCubit(this.loginRepository) : super(LoginUserInitial());

  Future<void> loginUser(String username, String password) async {
    AuthData? authData;
    emit(
      LoginUserLoading(),
    );
    try {
      authData = await loginRepository.loginUser(username, password);
    } on Exception {
      emit(LoginUserError());
    }
    emit(
      LoginUserLoaded(
        authData: authData!,
      ),
    );
  }

  Future<void> fetchUserDetails() async {
    AuthData? user = await loginRepository.getLoggedInUser();

    emit(
      LoginUserLoaded(
        authData: user,
      ),
    );
  }

  void logout() {
    loginRepository.logout();
  }
}
