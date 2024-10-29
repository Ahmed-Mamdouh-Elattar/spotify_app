import 'package:shared_preferences/shared_preferences.dart';
import 'package:spotify_app/core/helper/constants.dart';

void setuserIdInSharedPreference({required String email}) async {
  SharedPreferences pref = await SharedPreferences.getInstance();
  pref.setString(kUserIdKey, email);
}
