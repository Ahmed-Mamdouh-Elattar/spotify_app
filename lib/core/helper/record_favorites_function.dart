import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:spotify_app/core/helper/constants.dart';
import 'package:spotify_app/core/helper/get_user_id.dart';

class RecordFavoritesFunction {
  static Future<void> addRecordToFavorites(String recordId) async {
    getUserId().then((userId) async {
      final user =
          FirebaseFirestore.instance.collection(kUsersCollection).doc(userId);
      await user.update({
        "favorites": FieldValue.arrayUnion([recordId])
      });
    });
  }

  static Future<void> deleteRecordFromFavorites(String recordId) async {
    getUserId().then((userId) async {
      final user =
          FirebaseFirestore.instance.collection(kUsersCollection).doc(userId);
      await user.update({
        "favorites": FieldValue.arrayRemove([recordId])
      });
    });
  }

  static Future<bool> checkIsRecordInFavourite(
      {required String userId,
      required String recordId,
      required List<dynamic> favorites}) async {
    bool isRecordInFavourite = favorites.contains(recordId);
    return isRecordInFavourite;
  }
}
