part of "login_user_cubit.dart";

abstract class LoginUserState extends Equatable {
  const LoginUserState();

  @override
  List<Object> get props => [];
}

class LoginUserInitial extends LoginUserState {}

class LoginUserLoading extends LoginUserState {}

class LoginUserLoaded extends LoginUserState {
  late final AuthData authData;
  LoginUserLoaded({required this.authData}) {}
  @override
  List<Object> get props => [this.authData];
}

class LoginUserError extends LoginUserState {}
