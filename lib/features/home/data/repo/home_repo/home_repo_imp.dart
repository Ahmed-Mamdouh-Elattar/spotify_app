import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:spotify_app/core/helper/record_favorites_function.dart';
import 'package:spotify_app/core/helper/constants.dart';

import 'package:spotify_app/core/helper/determine_favorite_records.dart';
import 'package:spotify_app/core/helper/get_user_id.dart';
import 'package:spotify_app/features/home/data/models/record_model/record_model.dart';
import 'package:spotify_app/features/home/data/repo/home_repo/home_repo.dart';

class HomeRepoImp extends HomeRepo {
  @override
  Future<Either<String, List<RecordModel>>> getGeneralRecordsData(
      List<dynamic> favorites) async {
    try {
      var recordsData =
          await FirebaseFirestore.instance.collection(kRecordsCollection).get();
      List<RecordModel> records = recordsData.docs.map((e) {
        return RecordModel.fromJson(json: e.data(), id: e.id);
      }).toList();
      determineFavoriteRecords(records: records, favorites: favorites);

      return right(records);
    } on Exception catch (e) {
      return left(e.toString());
    }
  }

  @override
  Future<Either<String, List<RecordModel>>> getQuranRecordsData(
      List<dynamic> favorites) async {
    try {
      var data = await FirebaseFirestore.instance
          .collection(kRecordsCollection)
          .where("type", isEqualTo: "quran")
          .get();
      List<RecordModel> records = data.docs.map((e) {
        return RecordModel.fromJson(json: e.data(), id: e.id);
      }).toList();
      determineFavoriteRecords(records: records, favorites: favorites);
      return right(records);
    } on Exception catch (e) {
      return left(e.toString());
    }
  }

  @override
  Future<Either<String, List<RecordModel>>> getPodcastsRecordsData(
      List<dynamic> favorites) async {
    try {
      var data = await FirebaseFirestore.instance
          .collection(kRecordsCollection)
          .where("type", isEqualTo: "podcast")
          .get();
      List<RecordModel> records = data.docs.map((e) {
        return RecordModel.fromJson(id: e.id, json: e.data());
      }).toList();
      determineFavoriteRecords(favorites: favorites, records: records);
      return right(records);
    } on Exception catch (e) {
      return left(e.toString());
    }
  }

  @override
  Future<void> addOrDeleteRecordFromFavorites(
      {required String recordId, required bool isRecordInFavourite}) async {
    if (isRecordInFavourite) {
      await RecordFavoritesFunction.deleteRecordFromFavorites(recordId);
    } else {
      await RecordFavoritesFunction.addRecordToFavorites(recordId);
    }
  }

  @override
  Future<List<dynamic>> fetchFavoriteRecords() async {
    var data = await FirebaseFirestore.instance
        .collection(kUsersCollection)
        .doc(await getUserId())
        .get();
    List<dynamic> favoritesRecords = data.data()!["favorites"];
    return favoritesRecords;
  }
}
