import "package:bloc_test/bloc_test.dart";
import "package:flutter_starter/cubit/login_user_cubit.dart";
import "package:flutter_starter/model/auth_data.dart";
import "package:flutter_starter/repository/login_repository.dart";
import "package:flutter_test/flutter_test.dart";
import "package:mockito/annotations.dart";
import "package:mockito/mockito.dart";
import "login_user_cubit_test.mocks.dart";

@GenerateMocks([LoginRepository])
void main() {
  LoginRepository loginRepository = MockLoginRepository();
  AuthData userData = AuthData(username: "gfgjhf", token: "jrntgi");
  AuthData userData1 = AuthData(username: "abcdef", token: "jrntgi");

  group(
    "login user cubit",
    () => {
      blocTest<LoginUserCubit, LoginUserState>(
        "should able to fetch user details for given username and password",
        build: () => LoginUserCubit(loginRepository),
        act: (LoginUserCubit loginUserCubit) async {
          when(loginRepository.getLoggedInUser())
              .thenAnswer((_) => Future.value(userData));
          await loginUserCubit.fetchUserDetails();
        },
        expect: () => [LoginUserLoaded(authData: userData)],
      ),
      blocTest<LoginUserCubit, LoginUserState>(
        "should not able to fetch user details for given username and password",
        build: () => LoginUserCubit(loginRepository),
        act: (LoginUserCubit loginUserCubit) async {
          when(loginRepository.getLoggedInUser())
              .thenAnswer((_) => Future.value(userData));
          await loginUserCubit.fetchUserDetails();
        },
        expect: () => [isNot(LoginUserLoaded(authData: userData1))],
      ),
      blocTest<LoginUserCubit, LoginUserState>(
        "should able to login with valid username and password",
        build: () => LoginUserCubit(loginRepository),
        act: (LoginUserCubit loginUserCubit) async {
          when(loginRepository.loginUser("johnd", "johnd"))
              .thenAnswer((_) => Future.value(userData));

          await loginUserCubit.loginUser("johnd", "johnd");
        },
        verify: (LoginUserCubit loginUserCubit) {
          verify(loginRepository.loginUser("johnd", "johnd")).called(1);
        },
      ),
      blocTest<LoginUserCubit, LoginUserState>(
        "should able to logout for given user ",
        build: () => LoginUserCubit(loginRepository),
        act: (LoginUserCubit loginUserCubit) async {
          when(loginRepository.loginUser("johnd", "johd"))
              .thenAnswer((_) => Future.value(userData));
          when(loginRepository.logout()).thenReturn("");
          await loginUserCubit.loginUser("johnd", "johd");
          loginUserCubit.logout();
        },
        verify: (LoginUserCubit loginUserCubit) {
          verify(loginRepository.loginUser("johnd", "johd")).called(1);
          verify(loginRepository.logout()).called(1);
        },
      ),
    },
  );
}
