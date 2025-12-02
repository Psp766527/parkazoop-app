import 'package:shared_preferences/shared_preferences.dart';

class AuthStorage {
  static const _userKey = 'auth_username';
  static const _passKey = 'auth_password';

  static Future<void> saveCredentials(String username, String password) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_userKey, username);
    await prefs.setString(_passKey, password);
  }

  static Future<void> clear() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(_userKey);
    await prefs.remove(_passKey);
  }

  static Future<Map<String, String>?> getCredentials() async {
    final prefs = await SharedPreferences.getInstance();
    final u = prefs.getString(_userKey);
    final p = prefs.getString(_passKey);
    if (u != null && p != null) return {'username': u, 'password': p};
    return null;
  }
}
