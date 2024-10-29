import 'package:dartz/dartz.dart';
import 'package:spotify_app/features/home/data/models/record_model/record_model.dart';

abstract class HomeRepo {
  Future<Either<String, List<RecordModel>>> getGeneralRecordsData();
  Future<Either<String, List<RecordModel>>> getQuranRecordsData();
  Future<Either<String, List<RecordModel>>> getPodcastsRecordsData();
}
