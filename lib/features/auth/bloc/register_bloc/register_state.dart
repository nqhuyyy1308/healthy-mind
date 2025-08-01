part of 'register_bloc.dart';

abstract class RegisterState extends Equatable {
  const RegisterState();

  @override
  List<Object> get props => [];
}

// Chỉ cần tạo class không cần truyền tham số cho nó vì ta sẽ lấy data vào từ bloc khác
class RegisterInitial extends RegisterState {}

class RegisterLoading extends RegisterState {}

class RegisterSuccess extends RegisterState {}

class RegisterFailure extends RegisterState {
  final String? message;
  const RegisterFailure({this.message});
}
