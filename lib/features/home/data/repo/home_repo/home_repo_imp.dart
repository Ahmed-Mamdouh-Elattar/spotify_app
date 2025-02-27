import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:spotify_app/core/helper/record_favorites_function.dart';
import 'package:spotify_app/core/helper/constants.dart';

import 'package:spotify_app/core/helper/get_user_id.dart';
import 'package:spotify_app/core/helper/set_user_id.dart';
import 'package:spotify_app/features/home/data/models/record_model/record_model.dart';
import 'package:spotify_app/features/home/data/models/user_model/user_model.dart';
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
  Future<UserModel> fetchUserInfo({String? email}) async {
    UserModel user;
    if (email == null && await getUserId() != "null") {
      var data = await FirebaseFirestore.instance
          .collection(kUsersCollection)
          .doc(await getUserId())
          .get();
      user = UserModel.fromJson(data.data()!);
      return user;
    } else {
      var data = await FirebaseFirestore.instance
          .collection(kUsersCollection)
          .where("email", isEqualTo: email)
          .get();
      user = UserModel.fromJson(data.docs[0].data());
      await setuserIdInSharedPreference(id: data.docs.first.id);
      return user;
    }
  }

  @override
  List<RecordModel> fetchFavoriteRecordList(
      List favorites, List<RecordModel> records) {
    List<RecordModel> favoriteRecords = [];
    for (var favoriteRecordId in favorites) {
      for (var record in records) {
        if (favoriteRecordId == record.id) {
          favoriteRecords.add(record);
        }
      }
    }
    return favoriteRecords;
  }

  @override
  Either<String, List<RecordModel>> searchRecords(
      {required String recordTitle, required List<RecordModel> records}) {
    List<RecordModel> searchRecords = records
        .where((record) =>
            record.title!.toLowerCase().contains(recordTitle.toLowerCase()))
        .toList();
    return searchRecords.isEmpty
        ? left("No matches found")
        : right(searchRecords);
  }
}
