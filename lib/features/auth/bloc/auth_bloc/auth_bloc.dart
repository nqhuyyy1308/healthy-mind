import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:healthy_mind_application/core/user_module/domain/repositories/user_repository.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final UserRepository userRepository;
  late final StreamSubscription<User?> _userSubscription;

  AuthBloc({required UserRepository myUserRepository})
    : userRepository = myUserRepository,
      super(const AuthState.unknown()) {
    _userSubscription = userRepository.user.listen((authUser) {
      add(AuthUserChanged(authUser));
    });
    on<AuthUserChanged>((event, emit) {
      if (event.user != null) {
        emit(AuthState.authenticated(event.user!));
      } else {
        emit(const AuthState.unauthenticated());
      }
    });
  }

  // Đóng tất cả bloc, stream, listener khi ta close bloc
  @override
  Future<void> close() {
    _userSubscription.cancel();
    return super.close();
  }
}
