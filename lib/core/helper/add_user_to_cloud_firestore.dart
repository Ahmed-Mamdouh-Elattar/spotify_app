import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:spotify_app/core/helper/constants.dart';
import 'package:spotify_app/core/helper/set_user_id.dart';

Future<void> addUserToCloudFireStore(String name, String email) async {
  CollectionReference users =
      FirebaseFirestore.instance.collection(kUsersCollection);
  await users.add({
    "name": name,
    "email": email,
  }).then((user) async {
    await setuserIdInSharedPreference(id: user.id);
  });
}
