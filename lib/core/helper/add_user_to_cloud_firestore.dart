import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:spotify_app/core/helper/constants.dart';
import 'package:spotify_app/core/helper/set_user_id.dart';

void addUserToCloudFireStore(String name, String email) {
  CollectionReference users =
      FirebaseFirestore.instance.collection(kUsersCollection);
  users.add({
    "name": name,
    "email": email,
  }).then((user) {
    setuserIdInSharedPreference(id: user.id);
  });
}
