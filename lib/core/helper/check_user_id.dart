import 'package:shared_preferences/shared_preferences.dart';
import 'package:spotify_app/core/helper/constants.dart';

Future<bool> isUserIdExisted() async {
  SharedPreferences pref = await SharedPreferences.getInstance();
  return pref.containsKey(kUserIdKey);
}
