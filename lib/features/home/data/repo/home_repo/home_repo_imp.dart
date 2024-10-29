import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:spotify_app/core/helper/constants.dart';
import 'package:spotify_app/features/home/data/models/record_model/record_model.dart';
import 'package:spotify_app/features/home/data/repo/home_repo/home_repo.dart';

class HomeRepoImp extends HomeRepo {
  @override
  Future<Either<String, List<RecordModel>>> getGeneralRecordsData() async {
    try {
      var data =
          await FirebaseFirestore.instance.collection(kRecordsCollection).get();
      List<RecordModel> records = data.docs.map((e) {
        return RecordModel.fromJson(e.data());
      }).toList();
      return right(records);
    } on Exception catch (e) {
      return left(e.toString());
    }
  }

  @override
  Future<Either<String, List<RecordModel>>> getQuranRecordsData() async {
    try {
      var data = await FirebaseFirestore.instance
          .collection(kRecordsCollection)
          .where("type", isEqualTo: "quran")
          .get();
      List<RecordModel> records = data.docs.map((e) {
        return RecordModel.fromJson(e.data());
      }).toList();
      return right(records);
    } on Exception catch (e) {
      return left(e.toString());
    }
  }

  @override
  Future<Either<String, List<RecordModel>>> getPodcastsRecordsData() async {
    try {
      var data = await FirebaseFirestore.instance
          .collection(kRecordsCollection)
          .where("type", isEqualTo: "podcast")
          .get();
      List<RecordModel> records = data.docs.map((e) {
        return RecordModel.fromJson(e.data());
      }).toList();
      return right(records);
    } on Exception catch (e) {
      return left(e.toString());
    }
  }
}
