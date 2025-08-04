import 'package:firebase_auth/firebase_auth.dart';
import 'package:healthy_mind_application/core/user_module/data/models/user_model.dart';

abstract class UserRepository {
  Stream<User?> get user;

  Future<void> signIn(String email, String password);

  Future<UserModel> signUp(UserModel user, String password);

  Future<void> signOut();

  Future<void> resetPassword(String email);

  Future<void> setUserData(UserModel user);

  Future<UserModel> getUserData(String id);
}
