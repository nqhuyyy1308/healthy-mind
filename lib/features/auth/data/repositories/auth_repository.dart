import 'package:firebase_auth/firebase_auth.dart';
import 'package:healthy_mind_application/features/auth/data/datasources/local_data_source.dart';

class AuthRepository {
  final FirebaseAuth firebaseAuth;
  final AuthLocalDataSource authLocalDataSource;

  AuthRepository({
    required this.firebaseAuth,
    required this.authLocalDataSource,
  });

  User? get currentUser => firebaseAuth.currentUser;

  Stream<User?> get authStateChanges => firebaseAuth.authStateChanges();

  Future<UserCredential> signIn({
    required String email,
    required String password,
  }) async {
    return await firebaseAuth.signInWithEmailAndPassword(
      email: email,
      password: password,
    );
  }

  Future<UserCredential> signUp({
    required String email,
    required String password,
  }) async {
    return await firebaseAuth.createUserWithEmailAndPassword(
      email: email,
      password: password,
    );
  }

  Future<void> signOut() async {
    await firebaseAuth.signOut();
  }
}
