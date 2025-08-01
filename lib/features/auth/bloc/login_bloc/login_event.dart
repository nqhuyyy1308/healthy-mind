part of 'login_bloc.dart';

abstract class LoginEvent extends Equatable {
  const LoginEvent();

  @override
  List<Object> get props => [];
}

class LoginRequired extends LoginEvent {
  final String email;
  final String password;

  const LoginRequired({required this.email, required this.password});
}

class LogoutRequired extends LoginEvent {
  const LogoutRequired();
}
