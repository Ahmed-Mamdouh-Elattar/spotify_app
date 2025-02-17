part of 'favorite_records_cubit.dart';

sealed class FavoriteRecordsState {}

final class FavoriteRecordsInitial extends FavoriteRecordsState {}

final class FavoriteRecordsSuccess extends FavoriteRecordsState {
  final List<RecordModel> records;

  FavoriteRecordsSuccess({required this.records});
}

final class FavoriteRecordsLoading extends FavoriteRecordsState {}
