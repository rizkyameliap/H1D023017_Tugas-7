import 'package:shared_preferences/shared_preferences.dart';

class AuthService {
  static const String _userKey = 'current_user';
  static const String _isLoggedInKey = 'is_logged_in';

  Future<bool> login(String email, String password) async {
    // Simulasi authentication
    await Future.delayed(const Duration(seconds: 1));

    // Demo credentials
    if (email == 'admin@example.com' && password == 'password123') {
      final prefs = await SharedPreferences.getInstance();
      await prefs.setString(_userKey, email);
      await prefs.setBool(_isLoggedInKey, true);
      return true;
    }
    return false;
  }

  Future<void> logout() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(_userKey);
    await prefs.setBool(_isLoggedInKey, false);
  }

  Future<bool> isLoggedIn() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getBool(_isLoggedInKey) ?? false;
  }

  Future<String?> getCurrentUser() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString(_userKey);
  }
}