import 'package:dartz/dartz.dart';
import 'package:spotify_app/features/home/data/models/record_model/record_model.dart';

abstract class HomeRepo {
  Future<Either<String, List<RecordModel>>> getGeneralRecordsData(
      List<dynamic> favorites);
  Future<Either<String, List<RecordModel>>> getQuranRecordsData(
      List<dynamic> favorites);
  Future<Either<String, List<RecordModel>>> getPodcastsRecordsData(
      List<dynamic> favorites);
  Future<List<dynamic>> fetchFavoriteRecords();
  Future<void> addOrDeleteRecordFromFavorites(
      {required String recordId, required bool isRecordInFavourite});
}
