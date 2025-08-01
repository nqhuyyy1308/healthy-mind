import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:healthy_mind_application/core/user_module/domain/repositories/user_repository.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final UserRepository _userRepository;
  LoginBloc({required UserRepository myUserRepository})
    : _userRepository = myUserRepository,
      super(LoginInitial()) {
    on<LoginRequired>((event, emit) async {
      emit(LoginLoading());
      try {
        await _userRepository.signIn(event.email, event.password);
        emit(LoginSuccess());
      } on FirebaseAuthException catch (e) {
        String errorMessage = e.message ?? "Đăng ký thất bại! Vui lòng thử lại";
        emit(LoginFailure(message: errorMessage));
      } catch (e) {
        emit(LoginFailure(message: e.toString()));
      }
    });
    on<LogoutRequired>((event, emit) async {
      await _userRepository.signOut();
    });
  }
}
