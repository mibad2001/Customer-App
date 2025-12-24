// import 'package:shared_preferences/shared_preferences.dart';
//
// class SessionManager {
//   static const String _tokenKey = "token";
//   static const String _loginKey = "isLoggedIn";
//
//   static Future<void> saveSession(String token) async {
//     final prefs = await SharedPreferences.getInstance();
//     await prefs.setString(_tokenKey, token);
//     await prefs.setBool(_loginKey, true);
//   }
//
//   static Future<String?> getToken() async {
//     final prefs = await SharedPreferences.getInstance();
//     return prefs.getString(_tokenKey);
//   }
//
//   static Future<bool> isLoggedIn() async {
//     final prefs = await SharedPreferences.getInstance();
//     return prefs.getBool(_loginKey) ?? false;
//   }
//
//   static Future<void> clearSession() async {
//     final prefs = await SharedPreferences.getInstance();
//     await prefs.clear();
//   }
// }
