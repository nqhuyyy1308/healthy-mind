import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:healthy_mind_application/features/auth/bloc/auth_event.dart';
import 'package:healthy_mind_application/features/auth/bloc/auth_state.dart';
import 'package:healthy_mind_application/features/auth/data/repositories/auth_repository.dart';

class AuthLoginBloc extends Bloc<AuthEvent, AuthLoginState> {
  AuthLoginBloc(this.authRepository) : super(AuthLoginInitial()) {
    on<LoginEvent>(_onLoginEvent);
    // on<RegisterEvent>(_onRegisterEvent);
  }

  final AuthRepository authRepository;

  void _onLoginEvent(LoginEvent event, Emitter<AuthLoginState> emit) async {
    emit(AuthLoginLoading());
    // await Future.delayed(const Duration(seconds: 1));
    try {
      final isLoggedin = await authRepository.signIn(
        email: event.email,
        password: event.password,
      );
      if (isLoggedin.user != null) {
        emit(AuthLoginSuccess());
      } else {
        emit(
          AuthLoginFailure(
            errorMessage: "Đăng nhập thất bại! Vui lòng thử lại.",
          ),
        );
      }
    } on FirebaseAuthException catch (e) {
      String errorMessage =
          e.message ?? "Đăng nhập thất bại! Vui lòng thử lại.";
      emit(AuthLoginFailure(errorMessage: errorMessage));
    }
  }

  // void _onRegisterEvent(RegisterEvent event, Emitter<AuthRegisterState> emit) async {
  //   emit(AuthRegisterLoading());
  //   final isSignedUp = await authRepository.signUp(
  //     email: event.email,
  //     password: event.password,
  //   );
  //   if (isSignedUp.user != null) {
  //     emit(AuthRegisterSuccess());
  //   } else {
  //     emit(
  //       AuthRegisterFailure(
  //         errorMessage: "Đăng ký thất bại! Vui lòng thử lại.",
  //       ),
  //     );
  //   }
  // }
}

class AuthRegisterBloc extends Bloc<AuthEvent, AuthRegisterState> {
  AuthRegisterBloc(this.authRepository) : super(AuthRegisterInitial()) {
    on<RegisterEvent>(_onRegisterEvent);
  }

  final AuthRepository authRepository;

  void _onRegisterEvent(
    RegisterEvent event,
    Emitter<AuthRegisterState> emit,
  ) async {
    emit(AuthRegisterLoading());
    try {
      final isSignedUp = await authRepository.signUp(
        email: event.email,
        password: event.password,
      );
      if (isSignedUp.user != null) {
        emit(AuthRegisterSuccess());
      } else {
        emit(
          AuthRegisterFailure(
            errorMessage: "Đăng ký thất bại! Vui lòng thử lại.",
          ),
        );
      }
    } on FirebaseAuthException catch (e) {
      String errorMessage = e.message ?? "Đăng ký không thành công!";
      emit(AuthRegisterFailure(errorMessage: errorMessage));
    }
  }
}
