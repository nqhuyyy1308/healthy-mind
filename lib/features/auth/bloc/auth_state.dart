sealed class AuthLoginState {}

class AuthLoginInitial extends AuthLoginState {}

class AuthLoginLoading extends AuthLoginState {}

class AuthLoginSuccess extends AuthLoginState {
  // int typeWellcomeContent = 1;
}

class AuthLoginFailure extends AuthLoginState {
  final String? errorMessage;
  AuthLoginFailure({this.errorMessage});
}

sealed class AuthRegisterState {}

class AuthRegisterInitial extends AuthRegisterState {}

class AuthRegisterLoading extends AuthRegisterState {}

class AuthRegisterSuccess extends AuthRegisterState {
  // int typeWellcomeContent = 2;
}

class AuthRegisterFailure extends AuthRegisterState {
  final String? errorMessage;
  AuthRegisterFailure({this.errorMessage});
}
