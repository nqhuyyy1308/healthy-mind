class AuthEvent {}

class LoginEvent extends AuthEvent {
  LoginEvent({required this.email, required this.password});
  final String email;
  final String password;
}

class RegisterEvent extends AuthEvent {
  RegisterEvent({required this.email, required this.password});
  final String email;
  final String password;
}
