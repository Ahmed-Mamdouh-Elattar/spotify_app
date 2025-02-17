import 'package:dartz/dartz.dart';
import 'package:spotify_app/features/home/data/models/record_model/record_model.dart';
import 'package:spotify_app/features/home/data/models/user_model/user_model.dart';

abstract class HomeRepo {
  Future<Either<String, List<RecordModel>>> getGeneralRecordsData(
      List<dynamic> favorites);
  Future<Either<String, List<RecordModel>>> getQuranRecordsData(
      List<dynamic> favorites);
  Future<Either<String, List<RecordModel>>> getPodcastsRecordsData(
      List<dynamic> favorites);
  Future<UserModel> fetchUserInfo();
  Future<void> addOrDeleteRecordFromFavorites(
      {required String recordId, required bool isRecordInFavourite});
  List<RecordModel> fetchFavoriteRecordList(
      List<dynamic> favorites, List<RecordModel> records);

  Either<String, List<RecordModel>> searchRecords(
      {required String recordTitle, required List<RecordModel> records});
}
