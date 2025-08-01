import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:healthy_mind_application/core/user_module/data/models/user_model.dart';
import 'package:healthy_mind_application/core/user_module/domain/repositories/user_repository.dart';

part 'register_event.dart';
part 'register_state.dart';

class RegisterBloc extends Bloc<RegisterEvent, RegisterState> {
  final UserRepository _userRepository;

  RegisterBloc({required UserRepository myUserRepository})
    : _userRepository = myUserRepository,
      super(RegisterInitial()) {
    on<RegisterRequired>((event, emit) async {
      emit(RegisterLoading());
      try {
        UserModel user = await _userRepository.signUp(
          event.userModel,
          event.password,
        );
        await _userRepository.setUserData(user);
        emit(RegisterSuccess());
      } on FirebaseAuthException catch (e) {
        String errorMessage =
            e.message ?? "Đăng nhập thất bại! Vui lòng thử lại.";
        emit(RegisterFailure(message: errorMessage));
      } catch (e) {
        log(e.toString());
        emit(RegisterFailure(message: e.toString()));
      }
    });
  }
}
