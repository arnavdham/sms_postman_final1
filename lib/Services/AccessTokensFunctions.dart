import 'package:shared_preferences/shared_preferences.dart';

Future<void> saveAccessToken(String accessToken) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  prefs.setString('accessToken', accessToken);
}

Future<String?> getAccessToken() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  return prefs.getString('accessToken');
}

// Future<void> removeAccessToken() async {
//   SharedPreferences prefs = await SharedPreferences.getInstance();
//   await prefs.remove('accessToken');
// }