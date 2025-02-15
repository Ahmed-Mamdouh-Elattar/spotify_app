import 'package:shared_preferences/shared_preferences.dart';
import 'package:spotify_app/core/helper/constants.dart';

Future<void> setUserIsLogged({required bool isLogged}) async {
  SharedPreferences pref = await SharedPreferences.getInstance();
  pref.setBool(kUserLoggedIn, isLogged);
}
