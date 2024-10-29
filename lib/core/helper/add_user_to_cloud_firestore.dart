import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:spotify_app/core/helper/constants.dart';

void addUserToCloudFireStore(String name, String email) {
  CollectionReference users =
      FirebaseFirestore.instance.collection(usersCollection);
  users.add({
    "name": name,
    "email": email,
  });
}
