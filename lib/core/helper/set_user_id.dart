import 'package:shared_preferences/shared_preferences.dart';
import 'package:spotify_app/core/helper/constants.dart';

Future<void> setuserIdInSharedPreference({required String id}) async {
  SharedPreferences pref = await SharedPreferences.getInstance();
  pref.setString(kUserIdKey, id);
}
