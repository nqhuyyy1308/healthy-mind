import 'package:healthy_mind_application/features/auth/data/datasources/data_constants.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthLocalDataSource {
  AuthLocalDataSource({required this.sf});
  final SharedPreferences sf;

  Future<void> saveToken(String token) async {
    await sf.setString(AuthDataConstants.keyToken, token);
  }

  Future<String?> getToken() async {
    return sf.getString(AuthDataConstants.keyToken);
  }
}
