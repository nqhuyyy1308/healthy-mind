part of 'register_bloc.dart';

abstract class RegisterEvent extends Equatable {
  const RegisterEvent();

  @override
  List<Object> get props => [];
}

class RegisterRequired extends RegisterEvent {
  final UserModel userModel;
  final String password;

  const RegisterRequired({required this.userModel, required this.password});
}
