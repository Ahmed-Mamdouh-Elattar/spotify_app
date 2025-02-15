import 'package:shared_preferences/shared_preferences.dart';
import 'package:spotify_app/core/helper/constants.dart';

Future<bool> getIfUserLoggedIn() async {
  SharedPreferences pref = await SharedPreferences.getInstance();
  return pref.getBool(kUserLoggedIn) ?? false;
}
